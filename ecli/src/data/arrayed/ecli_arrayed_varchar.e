indexing
	description: "SQL VARCHAR (n) arrayed values"
	author: "Paul G. Crismer"
	date: "$Date: 2004/05/18 11:18:42 $"
	revision: "$Revision: 1.7 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_VARCHAR

inherit
	ECLI_ARRAYED_STRING_VALUE

creation
	make

feature -- Access

	max_content_capacity : INTEGER is
		do
			Result := 255
		end

feature -- Status report

	sql_type_code: INTEGER is
		once
			Result := sql_varchar
		end

end -- class ECLI_ARRAYED_VARCHAR
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
