indexing
	description: "Cursor class generator"
	author: "Paul G. Crismer"
	date: "$Date: 2000/07/30 20:34:29 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	QA_CURSOR_GENERATOR

inherit
	ECLI_TYPE_CODES

		rename
		export
		undefine
		redefine
		select
		end

feature -- Initialization

	execute (a_cursor : QA_CURSOR; a_file : FILE) is
		require
			cursor: a_cursor /= Void and then a_cursor.name /= Void
			cursor_executed: a_cursor.is_executed
			file: a_file /= Void and a_file.is_open_write
		do
			current_cursor := a_cursor
			current_file := a_file
			create indentation.make (10)
			put_heading
			put_visible_features
			put_invisible_features
			put_closing
		end


feature -- Access

	current_cursor : QA_CURSOR
	
	current_file : FILE
	
feature -- Measurement

	indentation : STRING
	
	indent is
		do
			if indentation = Void then
				create indentation.make(10)
			end
			indentation.append_character ('%T')
		end
		
	exdent is
		require
			indentation /= Void
		do
			indentation.tail (indentation.count - 1)
		end
		
feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	put_visible_features is
		do
			put_line ("feature -- Basic Operations")
			put_new_line
			put_start
			put_line ("feature -- Access")
			put_new_line
			put_definition
			put_line ("feature -- Access (parameters)")
			put_new_line
			put_parameters
			put_line ("feature -- Access (results)")
			put_new_line
			put_results
		end

	put_invisible_features is
		do
			put_line ("feature {NONE} -- Implementation")
			put_new_line
			put_setup
		end
				
	put_heading is
			-- put indexing, class name, inheritance and creation
		do
			put_line ("indexing")
			indent
			put_line ("description: %"Generated cursor '"+current_cursor.name+"' : DO NOT EDIT !%"")
			put_line ("author: %"QUERY_ASSISTANT%"")
			put_line ("date: %"$Date : $%"")
			put_line ("revision: %"$Revision : $%"")
			put_line ("licensing: %"See notice at end of class%"")
			exdent
			put_line ("class")
			put_new_line
			indent
			put_line (class_name)
			exdent
			put_new_line
			put_line ("inherit")
			put_new_line
			indent
			put_line ("ECLI_CURSOR")
			exdent
			put_new_line
			put_line ("creation")
			put_new_line
			indent
			put_line ("make")
			exdent
			put_new_line			
		end

	put_definition is
		do
			indent
			put_line ("definition : STRING is")
			indent
			indent
			put_line ("-- SQL definition of Current")
			exdent
			put_line ("once")
			indent
			put_line ("Result := %"" + current_cursor.definition + "%"")
			exdent
			put_line ("end")
			exdent
			exdent
			put_new_line
		end

	put_start is
			-- put start operation
		local
			i, count : INTEGER
			list_cursor : DS_LIST_CURSOR[STRING]
			pname : STRING
			pvalue : QA_VALUE
		do
			indent
			-- feature signature
			put_new_line
			put (indentation)
			put ("start ")
			-- parameter list
			from
				i := 0
				list_cursor := current_cursor.parameter_names.new_cursor
				list_cursor.start
				put ("(")
			until
				list_cursor.off
			loop
				pname := list_cursor.item
				pvalue := current_cursor.parameter(pname)
				if i > 1 then
					put ("; ")
				end
				put ("a_" + pname + " : " + pvalue.value_type)
				i := i + 1
				list_cursor.forth
			end
			if i > 0 then
				put (") ")
			end			
			put ("is")
			put_new_line
			indent
			-- feature comment
			indent
			put_line ("-- position cursor at first position of result-set obtained")
			put_line ("-- by applying actual parameters to definition")
			exdent
			-- feature body
			put_line ("do")
			indent
			-- set parameters with their value
			from
				i := 0
				list_cursor := current_cursor.parameter_names.new_cursor
				list_cursor.start
			until
				list_cursor.off
			loop
				pname := list_cursor.item
				put_line (pname + ".set_item (a_" + pname + ")")
				list_cursor.forth
			end
			-- execute and 'start'
			put_line ("implementation_start")
			exdent
			put_line ("end")
			exdent
			put_new_line
			exdent
			put_new_line
		end
						
	put_parameters is
			-- put visible representation of parameters
		local
			i, count : INTEGER
			list_cursor : DS_LIST_CURSOR[STRING]
			pname : STRING
			pdescription : ECLI_PARAMETER_DESCRIPTION
		do
			indent
			from
				i := 1
				list_cursor := current_cursor.parameter_names.new_cursor
				list_cursor.start
			until
				list_cursor.off
			loop
				pname := list_cursor.item
				put_line (pname + "%T: " + current_cursor.parameter (pname).ecli_type)
				i := i + 1
				list_cursor.forth
			end
			exdent
			put_new_line
		end
		
	put_results is
			-- put visible representation of results
		local
			i, count : INTEGER
			vname : STRING
			vdescription : ECLI_COLUMN_DESCRIPTION
		do
			indent
			from
				i := 1
				count := current_cursor.result_column_count
			until
				i > count
			loop
				vname := current_cursor.cursor_description.item (i).name
				vdescription := current_cursor.cursor_description.item (i)
				put_line (vname + "%T: " + current_cursor.cursor.item (i).ecli_type )
				i := i + 1
			end
			exdent
			put_new_line
		end
		

	put_setup is
		local
			i, count : INTEGER
			cd : ECLI_COLUMN_DESCRIPTION
			c : DS_LIST_CURSOR [STRING]
			a_qa_value : QA_VALUE
			a_call : STRING
		do
				indent
				put_line ("setup is")
				indent
				indent
				put_line ("-- setup all attribute objects")
				exdent
				put_line ("do")
				indent
				-- create cursor.make (1, <result_count>)
				put_line ("-- create cursor values array")
				put_line ("create cursor.make (1, " + current_cursor.result_column_count.out + ")")

				---- for each column in <column list>
				-- create <column>.make <corresponding creation parameters>
				-- cursor.put (<column>, rank)
				put_line ("-- setup result value object and put them in 'cursor' ")
				from
					i := 1
					count := current_cursor.result_column_count
				until
					i > count
				loop
					a_qa_value := current_cursor.cursor.item (i)
					a_call := a_qa_value.creation_call
					cd := current_cursor.cursor_description.item (i)
					put_line ("create " + cd.name + "." + a_call )
					put_line ("cursor.put (" + cd.name + ", " + i.out + ")")
					i := i + 1
				end
				---- for each parameter in <parameter list>
				-- create <parameter>.make <corresponding creation parameters>
				-- put_parameter (<parameter>, "<parameter>")
				put_line ("-- setup parameter value objects and put them, by name")
				from
					c := current_cursor.parameter_names.new_cursor
					c.start
				until
					c.off
				loop
					a_qa_value := current_cursor.parameter (c.item)
					a_call := a_qa_value.creation_call
					put_line ("create " + c.item + "." + a_qa_value.creation_call)
					put_line ("put_parameter (" + c.item + ", %"" + c.item + "%")" )
					c.forth
				end
				--
				exdent
				put_line ("end")
				exdent
				put_new_line
				exdent
		end
		
	put_closing is
			-- put closing of class
		do
			put_new_line
			put_line ("end -- class "+ class_name )
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	class_name : STRING is
		do
			Result := clone (current_cursor.name)
			Result.to_upper
		end

	put_line (s : STRING) is
		require
			s /= Void
		do
			current_file.put_string (indentation)
			put (s)
			put_new_line
		end

	put (s : STRING) is
		require
			s /= Void
		do
			current_file.put_string (s)
		end

	put_new_line is
		do
			current_file.put_character ('%N')
		end

	factory : QA_VALUE_FACTORY is
		once
			create Result.make
		end

invariant
	invariant_clause: -- Your invariant here

end -- class QA_CURSOR_GENERATOR
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
