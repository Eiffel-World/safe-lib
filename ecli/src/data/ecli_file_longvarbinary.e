indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/05/18 11:17:38 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_FILE_LONGVARBINARY

inherit

	ECLI_FILE_VALUE

creation
	make_input, make_output
	
feature -- Access
		
	sql_type_code : INTEGER is
		do
			Result := Sql_longvarbinary
		end

end -- class ECLI_FILE_LONGVARBINARY
