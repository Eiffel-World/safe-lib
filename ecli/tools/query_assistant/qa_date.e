indexing
	description: "ISO CLI DATE value"
	author: "Paul G. Crismer"
	date: "$Date: 2002/10/17 07:07:29 $"
	revision: "$Revision: 1.5 $"
	licensing: "See notice at end of class"

class
	QA_DATE

inherit
	ECLI_DATE
	
	QA_VALUE

creation
	make, make_default
	
feature


	ecli_type : STRING is "ECLI_DATE"
			
	value_type : STRING is "ECLI_DATE"		

	creation_call : STRING is
		do
			Result := make_first_call
		end

end -- class QA_DATE
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
