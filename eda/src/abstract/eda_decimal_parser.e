indexing

	description: "Decimal number parsers"

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/11/20 20:33:15 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

deferred class
	EDA_DECIMAL_PARSER
	
feature -- Access		
	
	last_decimal : EDA_DECIMAL
	
feature -- Status report
		
 	error : BOOLEAN is
 			-- has an error occured during the last `parse'
 		deferred
 		end
			
feature -- Basic operations

	parse (string : STRING) is
		require
			string_exists: string /= Void
		deferred
		ensure
			last_decimal_not_void_when_no_error: not error implies last_decimal /= Void
		end

feature {NONE} -- Implementation

end -- class EDA_DECIMAL_PARSER

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
