indexing

	description: 
	
		"Errors related to Query Assistant."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/12/21 19:52:21 $"

class QA_ERROR

inherit
	
	UT_ERROR

feature -- Access

	default_template : STRING
	
	code : STRING
	
end -- class QA_ERROR
