indexing
	description: "EDA_DECIMAL.to_engineering_string."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/02/06 22:42:26 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	TEST_TO_ENG

inherit
	TEST_DECIMAL_GENERAL
		redefine
			create_operand, do_operation
		end
		
creation
	make
	
feature -- Basic operations

	do_operation (a_string, b_string : STRING; a_ctx : EDA_MATH_CONTEXT) is
			-- do operation
		local
			a, b : EDA_DECIMAL
		do
			a_ctx.reset_flags
			a:= create_operand (a_string, a_ctx)
			a.set_shared_decimal_context (a_ctx)
			execute_operation (a, b, a_ctx)
		end

	execute_operation (a, b : EDA_DECIMAL; a_ctx : EDA_MATH_CONTEXT) is
			-- 
		do
			last_result := a
			last_string_result := last_result.to_engineering_string
		end
	
	create_operand (s : STRING; a_ctx : EDA_MATH_CONTEXT) : EDA_DECIMAL is
			-- create operand from 's'
		do
				--| create operands
			create Result.make_from_string_ctx (s, a_ctx)
		end

end -- class TEST_TO_ENG

--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
