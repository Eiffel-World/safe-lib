indexing
	description: "Objects that describe an SQL Table"
	author: ""
	date: "$Date: 2002/09/28 10:51:18 $"
	revision: "$Revision: 1.2 $"

class
	ECLI_TABLE

inherit
	ECLI_NAMED_METADATA
		redefine
			out
		end
		
create
	make

feature {NONE} -- Initialization

	make (tables_cursor : ECLI_TABLES_CURSOR) is
			-- create table from `tables_cursor' item from `a_repository'
		require
			cursor_exists: tables_cursor /= Void
			cursor_not_off:  not tables_cursor.off
		do
			set_catalog (tables_cursor.buffer_catalog_name)
			set_schema (tables_cursor.buffer_schema_name)
			set_name (tables_cursor.buffer_table_name)
			if not tables_cursor.buffer_table_type.is_null then
				 type := tables_cursor.buffer_table_type.to_string
			end
			if not tables_cursor.buffer_description.is_null then
				description := tables_cursor.buffer_description.to_string
			end
		end
		
feature -- Access
	
	type : STRING
			-- table type
	
	description : STRING
			-- description, comment or remarks		
	
feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
			-- 
		do
			!!Result.make (128)
			Result.append (Precursor)
			Result.append ("%T")
			append_to_string (Result, type) Result.append ("%T")
			append_to_string (Result, description)
		end
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation
	
invariant
	invariant_clause: True -- Your invariant here

end -- class ECLI_TABLE
