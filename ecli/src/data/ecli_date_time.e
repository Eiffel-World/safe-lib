indexing

	description: 
	
		"SQL DATETIME values."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2005, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2005/11/29 09:47:38 $"

class ECLI_DATE_TIME

inherit

	ECLI_TIMESTAMP
		redefine
			sql_type_code
		end
		
creation

	make, make_first, make_default

feature

	sql_type_code : INTEGER is
		once
			Result := Sql_type_timestamp
		end
		
end
