indexing
	description: "ISO CLI VARCHAR (n) values"
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 09:23:32 $"
	revision: "$Revision: 1.7 $"
	licensing: "See notice at end of class"

class
	ECLI_VARCHAR

inherit
	ECLI_LONGVARCHAR
		redefine
			max_capacity, sql_type_code
		end

creation
	make

feature -- Access

	max_capacity : INTEGER is
		do
			Result := 255
		end

feature -- Status report

	sql_type_code: INTEGER is
		once
			Result := sql_varchar
		end

end -- class ECLI_VARCHAR
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
