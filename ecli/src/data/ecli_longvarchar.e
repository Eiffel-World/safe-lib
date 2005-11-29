indexing

	description: 
	
		"SQL LONGVARCHAR (n) values."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2005, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2005/11/29 09:47:38 $"

class ECLI_LONGVARCHAR

inherit

	ECLI_STRING_VALUE
	
creation

	make, make_force_maximum_capacity
	
feature -- Access

	default_maximum_capacity : INTEGER is
		do
			Result := 1_000_000
		end

	sql_type_code: INTEGER is
		once
			Result := sql_longvarchar
		end
	
end
