indexing

	description:
	
			"SQL LONGVARBINARY data objects"

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/06/24 19:40:43 $"

class ECLI_LONGVARBINARY

inherit

	ECLI_BINARY_VALUE
		
creation

	make, make_force_maximum_capacity
	
feature -- Access

	default_maximum_capacity : INTEGER is
		do
			Result := 1_000_000
		end
		
	sql_type_code : INTEGER is
		once
			Result := sql_varbinary
		end

end
