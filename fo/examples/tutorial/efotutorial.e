indexing

	description:

		"EFOTUTORIAL System's root class"

	library: "FO - Formatting Objects in Eiffel. Project SAFE."
	copyright: "Copyright (c) 2006 - , Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2006/11/14 15:50:50 $"

class
	EFOTUTORIAL

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_FILE_SYSTEM

creation
	make

feature -- Initialization

	make is
			-- Creation procedure.
		do
--			test_chapter_1
--			test_tables
			test_show_section
		end

	test_chapter_1 is
		do
			test_hello_world
		end

	test_hello_world is
		local
			test : TUTORIAL_HELLO_WORLD
		do
			create test.execute
		end

	test_tables is
		local
			test : TUTORIAL_SHOW_TABLES
		do
			create test.execute
		end

	test_show_section is
		local
			test : TUTORIAL_SHOW_SECTION
		do
			create test.execute
		end


	factory : FO_CONFIGURABLE_FACTORY

end -- class EFOTUTORIAL
