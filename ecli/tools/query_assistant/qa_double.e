indexing
	description: "CLI SQL DOUBLE value"
	author: "Paul G. Crismer"
	date: "$Date: 2001/09/15 10:24:10 $"
	revision: "$Revision: 1.3 $"
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
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
