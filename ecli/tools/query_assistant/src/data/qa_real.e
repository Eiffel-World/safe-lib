indexing
	description: "CLI SQL REAL value"
	author: "Paul G. Crismer"
	date: "$Date: 2004/12/07 21:13:05 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	QA_REAL

inherit
	ECLI_REAL
	
	QA_VALUE
	
creation
	make
	
feature


	ecli_type : STRING is "ECLI_REAL"
		
	value_type : STRING is "REAL"
		
	creation_call : STRING is
		do
			Result := make_call
		end

end -- class QA_REAL
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
