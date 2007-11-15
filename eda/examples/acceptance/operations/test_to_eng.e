indexing
	description:

		"MA_DECIMAL.to_engineering_string."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2007/11/15 10:01:57 $"

class TEST_TO_ENG

inherit

	TEST_DECIMAL_GENERAL
		redefine
			create_operand, do_operation
		end
		
create

	make
	
feature -- Basic operations

	do_operation (a_string, b_string : STRING; a_ctx : MA_DECIMAL_CONTEXT) is
			-- Do operation.
		local
			a, b : MA_DECIMAL
		do
			a_ctx.reset_flags
			a:= create_operand (a_string, a_ctx)
			a.set_shared_decimal_context (a_ctx)
			execute_operation (a, b, a_ctx)
		end

	execute_operation (a, b : MA_DECIMAL; a_ctx : MA_DECIMAL_CONTEXT) is
		do
			last_result := a
			last_string_result := last_result.to_engineering_string
		end
	
	create_operand (s : STRING; a_ctx : MA_DECIMAL_CONTEXT) : MA_DECIMAL is
			-- Create operand from 's'
		do
				--| create operands
			create Result.make_from_string_ctx (s, a_ctx)
		end

end


