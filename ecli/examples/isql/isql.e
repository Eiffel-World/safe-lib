indexing
	description: "Command Line Interactive SQL for ODBC datasources";
	author: "Paul G. Crismer"
	date: "$Date: 2005/02/09 23:41:24 $"
	revision: "$Revision: 1.24 $"
	licensing: "See notice at end of class"
class
	ISQL

inherit

	KL_SHARED_ARGUMENTS

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all
		end
	
	KL_SHARED_OPERATING_SYSTEM
	
creation

	make

feature {NONE} -- Initialization

	make is
			-- isql
		local
			simple_login : ECLI_SIMPLE_LOGIN
			std : KL_STANDARD_FILES
			sp : ECLI_STORED_PROCEDURE
			tc : ECLI_TYPE_CATALOG
			l : DS_LIST[ECLI_SQL_TYPE]
		do			
			create_commands
			create std
			output_file := std.output
			create_current_context (output_file, commands, sql_command) 
			create_default_system_variables (current_context)
			print_banner
			-- session opening
			parse_arguments
			if error_message /= Void then
				print_usage
			else
				if echo_output then
					current_context.enable_echo_output
				end	
				if dsn /= Void and then user /= Void and then password /= Void then
					create session.make_default
					create simple_login.make (dsn, user, password)
					session.set_login_strategy (simple_login)
					session.connect
					current_context.set_session (session)
					if session.is_connected then
						--| create default values for system variables
						current_context.filter.begin_error
						current_context.filter.put_error ("Connected %N")
						current_context.filter.end_error
					else
						print_error (session)
					end
					create tc.make(session)
					l := tc.numeric_types
				end
				if session = Void or else session /= Void and then not session.is_connected then
					current_context.filter.begin_error
					current_context.filter.put_error ("WARNING : NO session connected !%N%
						%Commands usage is restricted. Type HELP more information.%N%
						%Please connect first using 'CONNECT' command.%N")
					current_context.filter.end_error
				end
				execute_command.execute ("execute", current_context)	
				-- disconnecting and closing session
				if current_context.session /= Void then
					if current_context.session.is_connected then
						current_context.session.disconnect
					end
					if current_context.session.is_valid then
						current_context.session.close
					end
				end
			end;
		end

feature -- Access

	dsn : STRING
				-- Data source name
				
	user: STRING
				-- User name
				
	password : STRING
				-- Password
				
	sql_file_name : STRING
				-- clisql script filename
	
	error_message : STRING
				-- current error message
	
	session : ECLI_SESSION
				-- database session

	output_file : KI_TEXT_OUTPUT_STREAM
				-- output file of the application
	
	current_context : ISQL_CONTEXT
				-- current execution context
	
feature -- Status Report

	echo_output : BOOLEAN

feature -- Element change

	create_default_system_variables (a_context : ISQL_CONTEXT) is
			-- create default system variables and their value
		do
			a_context.set_variable ("", a_context.var_heading_begin)
			a_context.set_variable ("%N", a_context.var_heading_end)
			a_context.set_variable (",", a_context.var_heading_separator)
			a_context.set_variable ("", a_context.var_row_begin)
			a_context.set_variable (",", a_context.var_column_separator)
			a_context.set_variable ("%N", a_context.var_row_end)
			if Operating_system.is_windows or else Operating_system.Is_dotnet then
				a_context.set_variable ("notepad", a_context.Var_editor)
			else
				a_context.set_variable ("vi", a_context.Var_editor)
			end
		end		

feature {NONE} -- Implementation

	parse_arguments is
		local
			index : INTEGER
			current_argument : STRING
		do
			from
				index := 1
				error_message := Void
			until
				error_message /= Void or else index > Arguments.argument_count
			loop
				current_argument := Arguments.argument (index)
				if current_argument.item (1) = '-' then
					if (index + 1) <= Arguments.argument_count then
						if current_argument.is_equal ("-dsn") then
							dsn := Arguments.argument (index + 1)
						elseif current_argument.is_equal ("-user") then
							user := Arguments.argument (index + 1)
						elseif current_argument.is_equal ("-pwd") then
							password := Arguments.argument (index + 1)
						elseif current_argument.is_equal ("-sql_file_name") then
							sql_file_name := Arguments.argument (index + 1)
						elseif current_argument.is_equal ("-set") then
							do_assign (Arguments.argument (index + 1))
						end
						index := index + 2
					else
						set_error ("Missing value for parameter",current_argument)
					end
				else
					current_argument.to_lower
					if current_argument.is_equal ("echo") then
						echo_output := True
					end
					index := index + 1
				end
			end
		end		
	
	set_error (message, value : STRING) is
			-- set error_message to "<message> '<value>' "
		do
			!!error_message.make (0)
			error_message.append_string (message)
			error_message.append_string (" '")
			error_message.append_string (value)
			error_message.append_string ("'")		
		ensure
			error_message /= Void
		end

	print_banner is
			-- print banner
		do
			current_context.output_file.put_string (
				"CLISQL - Command Line Interactive SQL for ODBC datasources.%N%N%
				%This application has been developed using the Eiffel language.%N%
				%Copyright (C) Paul G. Crismer 2000-2003. %N%
				%SAFE project (http://safe.sourceforge.net).%N%
				%Released under the Eiffel Forum License version 1.%N%N%
				%Type%N%
				%    help; or he; to get help,%N%
				%    quit; or q;  to quit.%N%N")
		end
		
	print_usage is
			-- print command usage
		do
			if error_message /= Void then
				current_context.output_file.put_string (error_message)
				current_context.output_file.put_new_line
			end
			usage_command.execute ("usage", current_context)
		end

		
	print_error (status : ECLI_STATUS) is
			-- print error message relative to `status'
		do
			current_context.filter.begin_error
			current_context.filter.put_error (status.diagnostic_message)
			current_context.filter.end_error
		end

	create_commands is
			-- create command_stream set
		local
			l_command : ISQL_COMMAND
		do
			create {ISQL_CMD_SQL}sql_command
			--| the SQL command is not part of the list
			create commands.make
			create {ISQL_CMD_BEGIN}l_command
			commands.put_last (l_command)			
			create {ISQL_CMD_COLUMNS}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_CONNECT}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_COMMIT}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_DISCONNECT}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_DRIVERS}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_EDIT}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_EXECUTE} execute_command
			commands.put_last (execute_command)
			create {ISQL_CMD_FOREIGN_KEYS}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_HELP} l_command
			commands.put_last (l_command)			
			create {ISQL_CMD_HISTORY} l_command
			commands.put_last (l_command)			
			create {ISQL_CMD_OUTPUT} l_command
			commands.put_last (l_command)
			create {ISQL_CMD_PRIMARY_KEYS}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_PROCEDURES}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_PROCEDURE_COLUMNS}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_QUIT}l_command
			commands.put_last (l_command)			
			create {ISQL_CMD_RECALL}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_ROLLBACK}l_command
			commands.put_last (l_command)
			create set_command
			commands.put_last (set_command)
			create {ISQL_CMD_SOURCES}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_TABLES}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_TYPES}l_command
			commands.put_last (l_command)
			create {ISQL_CMD_USAGE} usage_command
			commands.put_last (usage_command) 
		end
		
	commands : DS_LINKED_LIST [ISQL_COMMAND]
				-- list of supported commands

	do_assign (text : STRING) is
			-- execute the command 'set <variable>=<value>'
		require
			set_command_not_void: set_command /= Void
		do
			set_command.do_assign (text, current_context)
		end
		
	set_command : ISQL_CMD_SET
			-- shortcut to the 'set' command

	execute_command : ISQL_CMD_EXECUTE
			-- shortcut to the 'execute' command
	
	sql_command : ISQL_CMD_SQL
	
	usage_command : ISQL_CMD_USAGE
	
	create_current_context  (a_output_file : KI_TEXT_OUTPUT_STREAM; a_commands : DS_LIST[ISQL_COMMAND]; a_sql_command : ISQL_CMD_SQL) is
		do
			create current_context.make (a_output_file, a_commands, a_sql_command)			
		end
		
	
end -- class ISQL
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
