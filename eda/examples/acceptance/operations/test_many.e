indexing
	description: "Tests for EDA_DECIMAL.* operations."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:05:39 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	TEST_MANY

inherit
	TEST_DECIMAL_GENERAL
		redefine
			make_file, do_operation
		end
		
creation
	make_file
	
feature {NONE} -- Initialization

	make_file (file_name : STRING) is
			-- create test for reading `file_name'
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

	do_operation (a, b : STRING; a_ctx : EDA_MATH_CONTEXT) is
			-- 
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

	execute_operation (a: EDA_DECIMAL; b: EDA_DECIMAL; a_ctx: EDA_MATH_CONTEXT) is
		do
			
		end
		
feature {NONE} -- Implementation


	operations : DS_HASH_TABLE [TEST_DECIMAL_GENERAL, STRING]
	
end -- class TEST_MANY

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
