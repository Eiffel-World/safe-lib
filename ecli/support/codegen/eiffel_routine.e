indexing
	description: "Objects that can represent either Eiffel functions or procedures"
	project: "Project Goanna <http://sourceforge.net/projects/goanna>"
	library: "Eiffel Code Generator"
	date: "$Date: 2003/05/08 13:58:07 $"
	revision: "$Revision: 1.1 $"
	author: "Glenn Maughan <glennmaughan@optushome.com.au>"
	copyright: "Copyright (c) 2001 Glenn Maughan and others"
	license: "Eiffel Forum Freeware License v1 (see forum.txt)."

class EIFFEL_ROUTINE

inherit

	EIFFEL_FEATURE
		rename
			make as feature_make
		end
		
creation

	make

feature -- Initialisation

	make (new_name: STRING) is
			-- Create new routine with 'name'
		require
			new_name_exists: new_name /= Void
		do
			feature_make (new_name)
			create params.make
		end

feature -- Access

	type: STRING
			-- Type of this feature if it is a function

	preconditions: DS_LINKED_LIST [DS_PAIR [STRING, STRING]]
			-- Preconditions (label, expression) of this routine.
			
	postconditions: DS_LINKED_LIST [DS_PAIR [STRING, STRING]]
			-- Postconditions (label, expression) of this routine.
			
	params: DS_LINKED_LIST [DS_PAIR [STRING, STRING]]
			-- Parameter pairs (name, type) of this routine.

	locals: DS_LINKED_LIST [DS_PAIR [STRING, STRING]]
			-- Local variable pairs (name, type) of this routine.

	body: DS_LINKED_LIST [STRING]
			-- Source code lines that constitute the body of the routine.

	is_function: BOOLEAN is
			-- Is this routine a function?
		do
			Result := type /= Void
		end

	is_deferred: BOOLEAN is
			-- Is this routine deferred?
		do
			Result := body = Void
		end

feature -- Status setting

	set_type (new_type: STRING) is
			-- Set the type of this routine to 'type'
		require
			new_type_exists: new_type /= Void
		do
			type := new_type
		end

	add_param (new_parameter: DS_PAIR [STRING, STRING]) is
			-- Add new parameter with name 'new_parameter.first' and value 'new_parameter.second'
		require
			new_parameter_exists: new_parameter /= Void
			parameter_name_exists: new_parameter.first /= Void
			parameter_value_exists: new_parameter.second /= Void
		do
			params.force_last (new_parameter)
		end

	add_local (new_local: DS_PAIR [STRING, STRING]) is
			-- Add new local with name 'new_local.first' and type 'new_local.second'
		require
			new_local_exists: new_local /= Void
			local_name_exists: new_local.first /= Void
			local_type_exists: new_local.second /= Void
		do
			if locals = Void then
				create body.make
				create locals.make
			end
			locals.force_last (new_local)
		end

	add_body_line (line: STRING) is
			-- Add 'line' to the body of this routine
		require
			line_exists: line /= Void
		do
			if body = Void then
				create body.make
				create locals.make
			end
			body.force_last (line)
		end

	add_precondition (precondition: DS_PAIR [STRINg, STRING]) is
			-- Add a precondition with the expression 'precondition.first' and
			-- label 'precondition.second' to this routine.
		require
			precondition_exists: precondition /= Void		
		do
			if preconditions = Void then
				create preconditions.make
			end
			preconditions.force_last (precondition)
		end
	
	add_postcondition (postcondition: DS_PAIR [STRING, STRING]) is
			-- Add a postcondition with the expression 'postcondition.first' and
			-- label 'postcondition.second' to this routine.
		require
			postcondition_exists: postcondition /= Void		
		do
			if postconditions = Void then
				create postconditions.make
			end
			postconditions.force_last (postcondition)
		end
		
feature -- Basic operations

	write (output: KI_TEXT_OUTPUT_STREAM) is
			-- Print source code representation of this routine on 'output'
		do
			output.put_string ("%T" + name)
			if not params.is_empty then
				write_params (output)
			end
			if is_function then
				output.put_string (": " + type)
			end
			output.put_string (" is")
			if comment /= Void then
				output.put_new_line
				output.put_string ("%T%T%T-- "+comment)
			end
			output.put_new_line
			if preconditions /= Void then
				write_preconditions (output)
			end
			if is_deferred then
				output.put_string ("%T%Tdeferred")
				output.put_new_line
			else
				if not locals.is_empty then
					write_locals (output)
				end
				write_body (output)
			end
			if postconditions /= Void then
				write_postconditions (output)
			end
			output.put_string ("%T%Tend")
			output.put_new_line
			output.put_new_line
		end

feature {NONE} -- Implementation

	write_params (output: KI_TEXT_OUTPUT_STREAM) is
		do
			output.put_string (" (")
			from
				params.start
			until
				params.off
			loop
				output.put_string (params.item_for_iteration.first 
					+ ": " + params.item_for_iteration.second)
				if not params.is_last then
					output.put_string ("; ")
				end
				params.forth
			end
			output.put_string (")")
		end

	write_locals (output: KI_TEXT_OUTPUT_STREAM) is
		do
			output.put_string ("%T%Tlocal")
			output.put_new_line
			from
				locals.start
			until
				locals.off
			loop
				output.put_string ("%T%T%T" + locals.item_for_iteration.first 
					+ ": " + locals.item_for_iteration.second)
				output.put_new_line
				locals.forth
			end
		end

	write_body (output: KI_TEXT_OUTPUT_STREAM) is
		do
			output.put_string ("%T%Tdo")
			output.put_new_line
			from
				body.start
			until
				body.off
			loop
				output.put_string ("%T%T%T" + body.item_for_iteration)
				output.put_new_line
				body.forth
			end
		end

	write_preconditions (output: KI_TEXT_OUTPUT_STREAM) is
		do
			output.put_string ("%T%Trequire")
			output.put_new_line
			from
				preconditions.start
			until
				preconditions.off
			loop
				output.put_string ("%T%T%T" + preconditions.item_for_iteration.first + ": "
					+ preconditions.item_for_iteration.second)
				output.put_new_line
				preconditions.forth
			end
		end

	write_postconditions (output: KI_TEXT_OUTPUT_STREAM) is
		do
			output.put_string ("%T%Tensure")
			output.put_new_line
			from
				postconditions.start
			until
				postconditions.off
			loop
				output.put_string ("%T%T%T" + postconditions.item_for_iteration.first + ": "
					+ postconditions.item_for_iteration.second)
				output.put_new_line
				postconditions.forth
			end
		end

invariant

	function_definition: is_function implies type /= Void
	deferred_definition: is_deferred implies (body = Void and locals = Void)
	no_body_or_locals: body = Void implies locals = Void
	params_exist: params /= Void
		
end -- class EIFFEL_ROUTINE
