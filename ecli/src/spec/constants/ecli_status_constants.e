indexing
	description: "Status constants"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/28 08:36:00 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_STATUS_CONSTANTS

feature -- Status Report

	--  return values from functions 
	Sql_success	:	INTEGER is	0
	Sql_success_with_info	:	INTEGER is	1
	Sql_no_data	:	INTEGER is	100 -- (ODBCVER >= 0x0300)
	Sql_error	:	INTEGER is	-1
	Sql_invalid_handle	:	INTEGER is	-2

	Sql_still_executing	:	INTEGER is	2
	Sql_need_data	:	INTEGER is	99

end -- class ECLI_STATUS_CONSTANTS
