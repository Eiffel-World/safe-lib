indexing
	description: "CLI SQL INTEGER value"
	author: "Paul G. Crismer"
	date: "$Date: 2001/05/16 13:56:51 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	QA_INTEGER

inherit
	ECLI_INTEGER
	
	QA_VALUE


creation
	make
	
feature

	ecli_type : STRING is "ECLI_INTEGER"
		
	value_type : STRING is "INTEGER"

	creation_call : STRING is
		do
			Result := make_call
		end
	
end -- class QA_INTEGER
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
