indexing
	description: "Description of result-set column"
	author: "Paul G. Crismer"
	date: "$Date: 2000/07/30 20:34:09 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	ECLI_COLUMN_DESCRIPTION

inherit
	ECLI_PARAMETER_DESCRIPTION
		rename
			make as make_parameter
		export {NONE} make_parameter
		end

creation
	make

feature {NONE} -- Initialization
	
	make (stmt : ECLI_STATEMENT; index : INTEGER; max_name_length : INTEGER) is
		local
			temp_name : STRING
			p_temp_name : POINTER
		do
			create temp_name.make (max_name_length)
			p_temp_name := string_to_pointer (temp_name)
			stmt.set_status (
				ecli_c_describe_column (stmt.handle,
					index,
					p_temp_name,
					temp_name.capacity,
					pointer ($actual_name_length),
					pointer ($db_type_code),
					pointer ($column_precision),
					pointer ($decimal_digits),
					pointer ($nullability)))
			name := pointer_to_string (p_temp_name)			
		end

feature -- Status report

	name : STRING

	actual_name_length : INTEGER
	
end -- class ECLI_COLUMN_DESCRIPTION
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
