indexing
	description: "EDA_DECIMAL.rescale tests."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/02/06 22:42:26 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	TEST_RESCALE

inherit
	TEST_DECIMAL_GENERAL
	
creation
	make_file, make
	
feature -- Basic operations

	execute_operation (a, b : EDA_DECIMAL; a_ctx : EDA_MATH_CONTEXT) is
			-- 
		do
			last_result := a.rescale_decimal (b, a_ctx)
			last_string_result := last_result.to_scientific_string
		end

end -- class TEST_RESCALE

--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
