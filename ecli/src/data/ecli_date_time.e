indexing
	description: "Date and time objects - SQL: DATETIME"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/22 19:31:05 $"
	revision: "$Revision: 1.5 $"
	licensing: "See notice at end of class"

class
	ECLI_DATE_TIME

inherit
	ECLI_TIMESTAMP
		redefine
			sql_type_code
		end
		
creation
	make, make_first

feature

	sql_type_code : INTEGER is
		once
			Result := Sql_datetime
		end
		
end -- class ECLI_DATE_TIME
--
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
