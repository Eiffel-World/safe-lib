indexing

	description: 
	
		"Shared CLI environment"

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/06/24 19:40:42 $"

class ECLI_SHARED_ENVIRONMENT

feature -- Access

	shared_environment : ECLI_ENVIRONMENT is
		once
			!!Result.make
		end

end
