indexing
	description: "ISO CLI CHAR (n) values"
	author: "Paul G. Crismer"
	date: "$Date: 2000/07/30 20:34:26 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	QA_CHAR

inherit
	ECLI_CHAR
	
	QA_VALUE
	

creation
	make
	
feature

	ecli_type : STRING is "ECLI_CHAR"
		
	value_type : STRING is "STRING"
		
	creation_call : STRING is
		do
			Result := make_call_with_precision
		end

end -- class QA_CHAR
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
