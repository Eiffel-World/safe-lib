indexing
	description:

		"Tests of DECIMAL.subtract operation."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/04/27 19:13:15 $"

class TEST_SUBTRACT

inherit

	TEST_DECIMAL_GENERAL

creation

	make_file, make
	
feature -- Inapplicable

	execute_operation (a, b : MA_DECIMAL; a_ctx : MA_DECIMAL_CONTEXT) is
		do
			last_result := a.subtract (b, a_ctx)
			last_string_result := last_result.to_scientific_string
		end

end


