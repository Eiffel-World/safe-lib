indexing
	description: "Objects that tests features of class FM_TIME_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:19 $";
	revision: "$Revision: 1.4 $";
	author: "Fafchamps Eric"

deferred class TEST_TIME_FORMAT

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
			-- Test formatted.
		local
			l_time: DT_TIME
			l_format: FM_TIME_FORMAT
		do
			create l_time.make_precise (23, 4, 56, 89)
			create l_format.make (25)

			assert_equal ("Check default format for not Void.", "          23:04          ", l_format.formatted (l_time))

			assert_equal ("Check default format for Void.",     "                         ", l_format.formatted (Void))
			
			l_format.set_padding_character ('.')
			assert_equal ("Check set_padding_character of format.", "..........23:04..........", l_format.formatted (l_time))

			l_format.set_prefix_string ("pre")
			assert_equal ("Check set_prefix_string of format.", "........pre23:04.........", l_format.formatted (l_time))

			l_format.set_suffix_string ("suf")
			assert_equal ("Check set_suffix_string of format.", ".......pre23:04suf.......", l_format.formatted (l_time))

			l_format.left_justify
			assert_equal ("Check left_justify of format.", 		"pre23:04suf..............", l_format.formatted (l_time))

			l_format.center_justify
			assert_equal ("Check center_justify of format.", 	".......pre23:04suf.......", l_format.formatted (l_time))

			l_format.right_justify
			assert_equal ("Check right_justify of format.", 	"..............pre23:04suf", l_format.formatted (l_time))

			l_format.no_justify
			assert_equal ("Check no_justify of format.", "pre23:04suf", l_format.formatted (l_time))

			l_format.set_time_separator ('-')
			assert_equal ("Check set_time_separator of format.", "pre23-04suf", l_format.formatted (l_time))
			
			l_format.hide_time_separator
			assert_equal ("Check hide_time_separator of format.", "pre2304suf", l_format.formatted (l_time))

			l_format.show_seconds_part
			assert_equal ("Check show_seconds_part of format.", "pre230456suf", l_format.formatted (l_time))

			l_format.show_milliseconds_part
			assert_equal ("Check show_milliseconds_part of format.", "pre230456089suf", l_format.formatted (l_time))

			create l_time.make_precise (1, 2, 6, 89)

			l_format.hide_leading_zero
			assert_equal ("Check hide_leading_zero of format.", "pre12689suf", l_format.formatted (l_time))
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_TIME_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
