indexing
	description: "ISO CLI TIMESTAMP values"
	author: "Paul G. Crismer"
	date: "$Date: 2001/09/15 10:24:10 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

class
	QA_TIMESTAMP

inherit
	ECLI_TIMESTAMP
	
	QA_VALUE
	
creation
	make, make_first

feature

	ecli_type : STRING is "ECLI_TIMESTAMP"
		
	value_type : STRING is "ECLI_TIMESTAMP"
		
	creation_call : STRING is
		do
			Result := make_first_call
		end


end -- class QA_TIMESTAMP
--
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
