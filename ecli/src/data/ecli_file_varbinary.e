indexing

	description:
	
			"VARBINARY large data"

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/09/01 19:49:41 $"

class ECLI_FILE_VARBINARY

inherit

	ECLI_FILE_VALUE

creation

	make_input, make_output
	
feature -- Access
		
	sql_type_code : INTEGER is
		do
			Result := Sql_varbinary
		end

end
