indexing
	description: "EDA_DECIMAL.to_scientific_string"
	
	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:05:40 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	TEST_TO_SCI

inherit
	TEST_TO_ENG
		redefine
			execute_operation
		end
	
creation
	make
	
feature -- Basic operations

	execute_operation (a, b : EDA_DECIMAL; a_ctx : EDA_MATH_CONTEXT) is
			-- 
		do
			last_result := a
			last_string_result := last_result.to_scientific_string
		end
		
end -- class TEST_TO_SCI

--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
