indexing
	description: "ISO CLI TIME value"
	author: "Paul G. Crismer"
	date: "$Date: 2000/07/30 20:34:29 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	QA_TIME

inherit
	ECLI_TIME
	
	QA_VALUE

creation
	make
	
feature


	ecli_type : STRING is "ECLI_TIME"
		
	value_type : STRING is "ECLI_TIME"
		
end -- class QA_TIME
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
