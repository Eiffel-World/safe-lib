indexing

	description:
	
			"Length indicator constants"

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/06/24 19:40:43 $"

class ECLI_LENGTH_INDICATOR_CONSTANTS

feature -- Status Report

	--  special length/indicator values 
	Sql_null_data	:	INTEGER is	-1
	Sql_data_at_exec	:	INTEGER is	-2

end
