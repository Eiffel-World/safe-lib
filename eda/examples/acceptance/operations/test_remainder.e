indexing
	description: "EDA_DECIMAL.remainder tests."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:05:39 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	TEST_REMAINDER

inherit
	TEST_DECIMAL_GENERAL
	
creation
	make_file, make
	
feature -- Basic operations

	execute_operation (a, b : EDA_DECIMAL; a_ctx : EDA_MATH_CONTEXT) is
			-- 
		do
			last_result := a.remainder (b, a_ctx)
			last_string_result := last_result.to_scientific_string
		end

end -- class TEST_REMAINDER

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
