indexing
	description: "SQL CHAR (n) values."
	author: "Paul G. Crismer"
	date: "$Date: 2007/11/15 10:01:50 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	QA_CHAR

inherit
	ECLI_CHAR
	
	QA_VALUE
	

create
	make
	
feature

	ecli_type : STRING is "ECLI_CHAR"
		
	value_type : STRING is "STRING"
		
	creation_call : STRING is
		do
			Result := make_call_with_precision
		end

end -- class QA_CHAR
--
-- Copyright (c) 2000-2006, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
