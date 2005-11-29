indexing
	description: "SQL TIMESTAMP values."
	author: "Paul G. Crismer"
	date: "$Date: 2005/11/29 09:46:30 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	QA_TIMESTAMP

inherit
	ECLI_TIMESTAMP
	
	QA_VALUE
	
creation
	make, make_default

feature

	ecli_type : STRING is "ECLI_TIMESTAMP"
		
	value_type : STRING is "DT_DATE_TIME"
		
	creation_call : STRING is
		do
			Result := make_null_call
		end


end -- class QA_TIMESTAMP
--
-- Copyright: 2000-2005, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
