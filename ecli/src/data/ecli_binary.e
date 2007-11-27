indexing

	description:
	
			"SQL BINARY (n) data objects."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2006, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2007/11/27 10:56:34 $"

class ECLI_BINARY

inherit

	ECLI_BINARY_VALUE
		redefine
			valid_item
		end
		
creation

	make, make_force_maximum_capacity
	
feature -- Access

	default_maximum_capacity : INTEGER is
		do
			Result := 8_192
		end

	sql_type_code : INTEGER is
			-- 
		once
			Result := sql_binary
		end
		
feature -- Status report

	valid_item (value : STRING) : BOOLEAN is
		do
			Result := Precursor (value)
			Result := Result and value.count = capacity
		ensure then
			definition2: Result implies value.count = capacity
		end
		
end
