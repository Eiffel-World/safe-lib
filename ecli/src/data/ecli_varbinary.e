indexing
	description: "SQL VARBINARY (n) values."
	author: "Paul G. Crismer"
	
	library: "ECLI"
	date: "$Date: 2003/09/16 18:52:25 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_VARBINARY

inherit
	ECLI_LONGVARBINARY
		redefine
			max_capacity, sql_type_code
		end
		
creation
	make
	
feature -- Access

	max_capacity : INTEGER is
			-- 
		once
			Result := 8_192
		end
		
	sql_type_code : INTEGER is
			-- 
		once
			Result := sql_varbinary
		end
		
end -- class ECLI_VARBINARY
