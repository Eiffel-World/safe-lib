indexing
	description: "SQL TIME value"
	author: "Paul G. Crismer"
	date: "$Date: 2003/07/25 18:24:24 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	QA_TIME

inherit
	ECLI_TIME
	
	QA_VALUE

creation
	make_default
	
feature

	ecli_type : STRING is "ECLI_TIME"
		
	value_type : STRING is "ECLI_TIME"

	creation_call : STRING is
		do
			Result := make_default_call
		end
		
end -- class QA_TIME
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
