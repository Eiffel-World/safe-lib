indexing
	description: "CLI SQL DOUBLE value"
	author: "Paul G. Crismer"
	date: "$Date: 2001/05/16 13:17:32 $"
	revision: "$Revision: 1.1.1.2 $"
	licensing: "See notice at end of class"

class
	QA_DOUBLE

inherit
	ECLI_DOUBLE
	
	QA_VALUE


creation
	make
	
feature


	ecli_type : STRING is "ECLI_DOUBLE"
		
	value_type : STRING is "DOUBLE"

	creation_call : STRING is
		do
			Result := make_call
		end

		
end -- class QA_DOUBLE
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
