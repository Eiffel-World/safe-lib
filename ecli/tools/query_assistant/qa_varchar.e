indexing
	description: "ISO CLI VARCHAR (n) values"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/27 14:16:58 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	QA_VARCHAR
	
inherit

	ECLI_VARCHAR

	QA_VALUE

creation
	make

feature


	ecli_type : STRING is "ECLI_VARCHAR"
		
	value_type : STRING is "STRING"
		
	creation_call : STRING is
		do
			Result := make_call_with_precision
		end
		
end -- class QA_VARCHAR
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
