indexing
	description	: "System's root class for running General Decimal Arithmetic Specification test cases"

	library: "EDA"
	author: "Paul G. Crismer"

	date: "$Date: 2003/11/20 20:37:27 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	TEST_DECIMAL

inherit
	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

creation
	make

feature {NONE} -- Initialization

	make is
			-- create and run test cases.
		do
			io.put_string ("-- test_eda %N--  General Decimal Arithmetic tests cases%N")
			io.put_string ("-- for exercising the Eiffel Decimal Arithmetic library (EDA).%N")
			test_cases
		end


feature -- Access

	total : INTEGER

	errors : INTEGER

feature {NONE} -- Implementation

	test_cases is
			--
		local
			test_path : KL_PATHNAME
			eda_path_string, test_path_string : STRING
			environment : KL_EXECUTION_ENVIRONMENT
			test : TEST_DECIMAL_GENERAL
		do
			create environment
			eda_path_string := environment.variable_value ("EDA")
			test_path ?= File_system.string_to_pathname (eda_path_string)
			test_path.append_names (<<"examples", "acceptance", "test_cases">>)
			test_path_string := File_system.pathname_to_string (test_path)
--abs.decTest
--add.decTest
--base.decTest
--compare.decTest
--divide.decTest
--divideint.decTest
--double.decTest
--inexact.decTest
--integer.decTest
--max.decTest
--min.decTest
--minus.decTest
--multiply.decTest
--normalize.decTest
--plus.decTest
--randomBound32.decTest
--randomDouble.decTest
--randoms.decTest
--randomSingle.decTest
--remainder.decTest
--rescale.decTest
--rounding.decTest
--single.decTest
--subtract.decTest

			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "new.decTest"))
			do_case (test)
			create {TEST_ABS} test.make_file (File_system.pathname (test_path_string, "abs.decTest"))
			do_case (test)
			create {TEST_ADD} test.make_file (File_system.pathname (test_path_string, "add.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "base.decTest"))
			do_case (test)
			create {TEST_COMPARE} test.make_file (File_system.pathname (test_path_string, "compare.decTest"))
			do_case (test)
			create {TEST_DIVIDE} test.make_file (File_system.pathname (test_path_string, "divide.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "double.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "inexact.decTest"))
			do_case (test)
			create {TEST_DIVIDE_INTEGER} test.make_file (File_system.pathname (test_path_string, "divideint.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "integer.decTest"))
			do_case (test)
			create {TEST_MAX} test.make_file (File_system.pathname (test_path_string, "max.decTest"))
			do_case (test)
			create {TEST_MIN} test.make_file (File_system.pathname (test_path_string, "min.decTest"))
			do_case (test)
			create {TEST_MINUS} test.make_file (File_system.pathname (test_path_string, "minus.decTest"))
			do_case (test)
			create {TEST_MULTIPLY} test.make_file (File_system.pathname (test_path_string, "multiply.decTest"))
			do_case (test)
			create {TEST_NORMALIZE} test.make_file (File_system.pathname (test_path_string,  "normalize.decTest"))
			do_case (test)
			create {TEST_PLUS} test.make_file (File_system.pathname (test_path_string, "plus.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "randomBound32.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "randomDouble.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "randoms.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "randomSingle.decTest"))
			do_case (test)
			create {TEST_REMAINDER} test.make_file (File_system.pathname (test_path_string, "remainder.decTest"))
			do_case (test)
			create {TEST_RESCALE} test.make_file (File_system.pathname (test_path_string,  "rescale.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "rounding.decTest"))
			do_case (test)
			create {TEST_MANY} test.make_file (File_system.pathname (test_path_string, "single.decTest"))
			do_case (test)
			create {TEST_SUBTRACT} test.make_file (File_system.pathname (test_path_string, "subtract.decTest"))
			do_case (test)

			io.put_string ("All done !%N")
			io.put_string ("Total : ")
			io.put_integer (total)
			io.put_string ("%NErrors: ")
			io.put_integer (errors)
			io.put_new_line
		end

	do_case (test : TEST_DECIMAL_GENERAL) is
			--
		local
--			condition_met : BOOLEAN
		do
			print ("Test " + test.file.name + "%N")
--			test.set_start_tag ("basx528")
			from test.start
			until
				test.off
			loop
				test.execute
				test.forth
			end
			total := total + test.count
			errors := errors + test.errors
 			print (" -> " + test.errors.out + " errors / " + test.count.out + " cases%N")
 		end

	bcd_parser : EDA_DECIMAL_BCD_PARSER
	ctx : EDA_DECIMAL_MATH
	
end -- class TEST_DECIMAL

--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
