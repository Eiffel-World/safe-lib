indexing
	description: "Description of result-set column"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/27 14:19:13 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

class
	ECLI_COLUMN_DESCRIPTION

inherit
	ECLI_PARAMETER_DESCRIPTION
		rename
			make as make_parameter
		export {NONE} make_parameter
		end

	KL_IMPORTED_STRING_ROUTINES
creation
	make

feature {NONE} -- Initialization

	make (stmt : ECLI_STATEMENT; index : INTEGER; max_name_length : INTEGER) is
			-- Describe `index'th column of current result-set of `stmt', limiting the name length to `max_name_length'
		require
			stmt_prepared_or_executed : stmt /= Void and then stmt.is_prepared or stmt.is_executed
			valid_index: index > 0
			valid_maximum: max_name_length > 0
		local
			stat : INTEGER
		do
			name := STRING_.make_buffer (max_name_length + 1)
			stat := ecli_c_describe_column (stmt.handle,
				index,
				string_to_pointer (name),
				max_name_length,
				pointer ($actual_name_length),
				pointer ($sql_type_code),
				pointer ($size),
				pointer ($decimal_digits),
				pointer ($nullability))
			stmt.set_status (stat)
			name := pointer_to_string (string_to_pointer(name))
		end

feature -- Access

	name : STRING
			-- column name

feature {NONE} -- Implementation

	actual_name_length : INTEGER

	temporary_name : STRING is
			-- 
		once !!Result.make (100)
		end
		
end -- class ECLI_COLUMN_DESCRIPTION
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
