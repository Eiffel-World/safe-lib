indexing
	description: "ISO CLI LONGVARCHAR (n) values"
	author: ""
	date: "$Date: 2002/09/27 14:16:58 $"
	revision: "$Revision: 1.5 $"

class
	QA_LONGVARCHAR

	-- Replace ANY below by the name of parent class if any (adding more parents
	-- if necessary); otherwise you can remove inheritance clause altogether.
inherit

	ECLI_LONGVARCHAR
	
	QA_VALUE
		
creation
	make

feature

	ecli_type : STRING is "ECLI_LONGVARCHAR"
		
	value_type : STRING is "STRING"
		
	creation_call : STRING is
		do
			Result := make_call_with_precision
		end

end -- class QA_LONGVARCHAR
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
