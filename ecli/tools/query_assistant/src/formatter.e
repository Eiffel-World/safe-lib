indexing

	description:

		"Simple application that reads an XML file and outputs it again"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date: 2003/05/08 13:54:36 $"
	revision: "$Revision: 1.1 $"

class FORMATTER

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Run.
		do
			Arguments.set_program_name ("formatter")
			!! error_handler.make_standard
			process_arguments
			if not has_error then
				process_data_file
			end
		end

feature -- Access

	in_filename: STRING
			-- Name of the input file

	out_filename: STRING
			-- Name of the output file (see use_std_out)

	use_stdout: BOOLEAN
			-- Only if this is True, we write to stdout
			-- otherwise we write to out_filename
			
	has_error: BOOLEAN
			-- Error during processing?

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Parser

	fact: XM_EXPAT_PARSER_FACTORY is
			-- Expat XML parser factory
		once
			!! Result
		ensure
			factory_not_void: Result /= Void
		end

	event_parser: XM_PARSER
			-- XML parser

	tree_pipe: XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks

feature -- Basic operations

	process_data_file is
			-- Do the real work (parse and output).
		require
			in_filename_not_void: in_filename /= Void
			out_filename: not use_stdout implies out_filename /= Void
			parser_not_void: event_parser /= Void
			pipe_not_void: tree_pipe /= Void
		local
			formatter: XM_FORMATTER
			in: KL_TEXT_INPUT_FILE
			os: KL_TEXT_OUTPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			error_handler.report_info_message ("- parsing data...")
			!! in.make (in_filename)
			in.open_read
			if not in.is_open_read then
				!! cannot_read.make (in_filename)
				error_handler.report_error (cannot_read)
				has_error := True
			else
				event_parser.parse_from_stream (in)
				in.close
				if tree_pipe.error.has_error then
					error_handler.report_error_message (tree_pipe.last_error)
					has_error := True
				else
						-- TODO: this section will go once namespace processing
						-- is removed from tree.
					error_handler.report_info_message ("- resolving namespaces...")
					tree_pipe.document.root_element.resolve_namespaces
					tree_pipe.document.root_element.remove_namespace_declarations_from_attributes
					error_handler.report_info_message ("- printing document...")
					!! formatter.make
					formatter.process_document (tree_pipe.document)
					if use_stdout then
						std.output.put_string (formatter.last_string)
						std.output.put_new_line
					else
						!! os.make (out_filename)
						os.open_write
						if not os.is_open_write then
							!! cannot_write.make (out_filename)
							error_handler.report_error (cannot_write)
							has_error := True
						else
							os.put_string (formatter.last_string)
							os.close
						end
					end
				end
			end
			error_handler.report_info_message ("exiting...")
		end

	process_arguments is
			-- Read command line arguments.
		local
			parser_switch: STRING
		do
			if Arguments.argument_count < 2 then
				error_handler.report_error (Usage_message)
				has_error := True
			else
				parser_switch := Arguments.argument (1)
				if parser_switch.is_equal ("--expat") then
					if fact.is_expat_parser_available then
						event_parser := fact.new_expat_parser
					else
						error_handler.report_error_message ("expat is not availabe, please choose other parser backend")
						has_error := True
					end
				elseif parser_switch.is_equal ("--eiffel") then
					!XM_EIFFEL_PARSER! event_parser.make
				else
					error_handler.report_error (Usage_message)
					has_error := True
				end
					-- Create standard pipe holder and bind it to event parser.
				if not has_error then
					!! tree_pipe.make
					event_parser.set_callbacks (tree_pipe.start)
				end
				in_filename := Arguments.argument (2)
				if Arguments.argument_count > 2 then
						-- We got an output file as well.
					out_filename := Arguments.argument (3)
				else
						-- We use STDOUT instead.
					use_stdout := True
				end
			end
		ensure
			in_filename_not_void: not has_error implies in_filename /= Void
			out_filename: not has_error implies (not use_stdout implies out_filename /= Void)
			parser_not_void: not has_error implies event_parser /= Void
			pipe_not_void: not has_error implies tree_pipe /= Void
		end

feature {NONE} -- Implementation

	Usage_message: UT_USAGE_MESSAGE is
			-- Usage message
		local
			a_message: STRING
		once
			a_message := clone ("(")
			if fact.is_expat_parser_available then
				a_message.append_string ("--expat|")
			end
			a_message.append_string ("--eiffel) <input-file> [<output-file]")
			!! Result.make (a_message)
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
