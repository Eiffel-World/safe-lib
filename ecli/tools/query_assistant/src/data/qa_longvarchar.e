indexing
	description: "SQL LONGVARCHAR (n) values."
	author: "Paul G. Crismer"
	date: "$Date: 2010/11/30 15:47:28 $"
	revision: "$Revision: 1.6 $"

class
	QA_LONGVARCHAR

inherit

	ECLI_LONGVARCHAR

	QA_CHAR_VALUE

create
	make, make_force_maximum_capacity

feature

	ecli_type : STRING is do Result := "ECLI_LONGVARCHAR" end

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
