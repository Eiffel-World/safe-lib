indexing
	description:

		"Tests for MA_DECIMAL.* operations."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/04/27 19:13:15 $"

class TEST_MANY

inherit

	TEST_DECIMAL_GENERAL
		redefine
			make_file, do_operation
		end
		
creation

	make_file
	
feature {NONE} -- Initialization

	make_file (file_name : STRING) is
			-- Create test for reading `file_name'.
		local
			test : TEST_DECIMAL_GENERAL
		do
			Precursor (file_name)
			create operations.make (20)
			create {TEST_ABS} test.make; operations.put (test, "abs")
			create {TEST_ADD} test.make; operations.put (test, "add")
			create {TEST_COMPARE} test.make; operations.put (test, "compare")
			create {TEST_DIVIDE} test.make; operations.put (test, "divide")
			create {TEST_DIVIDE_INTEGER} test.make; operations.put (test, "divideint")
			create {TEST_MAX} test.make; operations.put (test, "max")
			create {TEST_MIN} test.make; operations.put (test, "min")
			create {TEST_MINUS} test.make; operations.put (test, "minus")
			create {TEST_MULTIPLY} test.make; operations.put (test, "multiply")
			create {TEST_PLUS} test.make; operations.put (test, "plus")
			create {TEST_REMAINDER} test.make; operations.put (test, "remainder")
			create {TEST_SUBTRACT} test.make; operations.put (test, "subtract")			
			create {TEST_TO_SCI}test.make; operations.put (test,"toSci")
			create {TEST_TO_ENG}test.make; operations.put (test,"toEng")
			create {TEST_NORMALIZE}test.make; operations.put (test,"normalize")
		end
		
feature -- Basic operations

	do_operation (a, b : STRING; a_ctx : MA_DECIMAL_CONTEXT) is
		do
			operations.search (operation)
			if operations.found then
				operations.found_item.do_operation (a, b, a_ctx)
				last_result := operations.found_item.last_result
				last_string_result := operations.found_item.last_string_result
				is_ok := True
			else
				is_ok := False
			end
		end

	execute_operation (a: MA_DECIMAL; b: MA_DECIMAL; a_ctx: MA_DECIMAL_CONTEXT) is
		do
			
		end
		
feature {NONE} -- Implementation


	operations : DS_HASH_TABLE [TEST_DECIMAL_GENERAL, STRING]
	
end


