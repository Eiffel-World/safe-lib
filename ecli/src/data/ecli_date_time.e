indexing
	description: "Date and time objects - SQL: DATETIME"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/28 08:52:04 $"
	revision: "$Revision: 1.7 $"
	licensing: "See notice at end of class"

class
	ECLI_DATE_TIME

inherit
	ECLI_TIMESTAMP
		redefine
			sql_type_code
		end
		
creation
	make, make_first, make_default

feature

	sql_type_code : INTEGER is
		once
			Result := Sql_datetime
		end
		
end -- class ECLI_DATE_TIME
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
