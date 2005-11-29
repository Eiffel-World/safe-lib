indexing

	description:
	
			"SQL VARCHAR (n) values."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2005, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2005/11/29 09:47:38 $"

class ECLI_VARCHAR

inherit

	ECLI_STRING_VALUE
		
creation

	make

feature -- Constants

	default_maximum_capacity : INTEGER is
		do
			Result := 255
		end

	sql_type_code: INTEGER is
		once
			Result := sql_varchar
		end

end
