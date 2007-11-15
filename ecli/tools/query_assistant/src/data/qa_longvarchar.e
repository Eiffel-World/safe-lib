indexing
	description: "SQL LONGVARCHAR (n) values."
	author: "Paul G. Crismer"
	date: "$Date: 2007/11/15 10:01:51 $"
	revision: "$Revision: 1.4 $"

class
	QA_LONGVARCHAR

	-- Replace ANY below by the name of parent class if any (adding more parents
	-- if necessary); otherwise you can remove inheritance clause altogether.
inherit

	ECLI_LONGVARCHAR
	
	QA_VALUE
		
create
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
-- Copyright (c) 2000-2006, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
