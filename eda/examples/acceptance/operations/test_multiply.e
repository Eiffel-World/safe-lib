indexing
	description:

		"MA_DECIMAL.multiply tests"

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2007/11/15 10:01:56 $"

class TEST_MULTIPLY

inherit

	TEST_DECIMAL_GENERAL
	
create

	make_file, make
	
feature -- Basic operations

	execute_operation (a, b : MA_DECIMAL; a_ctx : MA_DECIMAL_CONTEXT) is
		do
			last_result := a.multiply (b, a_ctx)
			last_string_result := last_result.to_scientific_string
		end

end


