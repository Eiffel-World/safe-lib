indexing
	description: "ISO CLI VARCHAR (n) values"
	author: "Paul G. Crismer"
	date: "$Date: 2002/03/21 20:34:30 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_VARCHAR

inherit
	ECLI_ARRAYED_LONGVARCHAR
		redefine
			max_content_capacity, db_type_code
		end

creation
	make

feature -- Access

	max_content_capacity : INTEGER is
		do
			Result := 255
		end

feature -- Status report

	db_type_code: INTEGER is
		once
			Result := sql_varchar
		end

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_ARRAYED_VARCHAR
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
