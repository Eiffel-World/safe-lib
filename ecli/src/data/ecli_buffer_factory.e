indexing
	description: 
		
		"Objects that create buffers for DB to application information exchange."

	author: "Paul G. Crismer."
	date: "$Date: 2003/02/25 21:00:58 $"
	revision: "$Revision: 1.4.2.1 $"

class
	ECLI_BUFFER_FACTORY

inherit
	ECLI_ABSTRACT_BUFFER_FACTORY [ECLI_VALUE]
	
feature
	
	value_factory : ECLI_VALUE_FACTORY is
			-- 
		once
			create Result.make
		end
		
	
end -- class ECLI_BUFFER_FACTORY
