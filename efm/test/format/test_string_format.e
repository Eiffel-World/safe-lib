indexing
	description: "Objects that tests features of class FM_STRING_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/07 17:10:10 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

deferred class TEST_STRING_FORMAT

inherit
	TS_TEST_CASE
	
feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	test_formatted is
			-- Test formatted
		local
			l_string: STRING
			l_format: FM_STRING_FORMAT
		do
			create l_string.make_from_string ("test")
			create l_format.make (25)

			assert_equal ("Check default format for not Void.", "test                     ", l_format.formatted (l_string))

			assert_equal ("Check default format for Void.",     "                         ", l_format.formatted (Void))
			
			l_format.set_padding_character ('.')
			assert_equal ("Check set_padding_character of format.", "test.....................", l_format.formatted (l_string))

			l_format.set_prefix_string ("pre")
			assert_equal ("Check set_prefix_string of format.", "pretest..................", l_format.formatted (l_string))

			l_format.set_suffix_string ("suf")
			assert_equal ("Check set_suffix_string of format.", "pretestsuf...............", l_format.formatted (l_string))

			l_format.center_justify
			assert_equal ("Check center_justify of format.", 	".......pretestsuf........", l_format.formatted (l_string))

			l_format.left_justify
			assert_equal ("Check left_justify of format.", 		"pretestsuf...............", l_format.formatted (l_string))

			l_format.right_justify
			assert_equal ("Check right_justify of format.", 	"...............pretestsuf", l_format.formatted (l_string))

			l_format.no_justify
			assert_equal ("Check no_justify of format.", "pretestsuf", l_format.formatted (l_string))

			l_format.set_void_string ("UNDEFINED")
			assert_equal ("Check set_void_string of format for Void", "UNDEFINED", l_format.formatted (Void))

			create l_string.make_empty
			l_format.left_justify
			l_format.set_padding_character_for_empty_string ('_')
			assert_equal ("Check set_padding_character_for_empty_string ('_') of format", "presuf___________________", l_format.formatted (l_string))

			l_format.set_string_for_empty_string ("EMPTY")
			assert_equal ("Check set_string_for_empty_string (%"EMPTY%") of format", "preEMPTYsuf______________", l_format.formatted (l_string))

		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_STRING_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
