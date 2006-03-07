indexing
	description: "Objects that tests features of class FM_TIME_DURATION_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/07 17:10:10 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

deferred class TEST_TIME_DURATION_FORMAT

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
			l_format: FM_TIME_DURATION_FORMAT			
			l_time_duration: DT_TIME_DURATION
		do
			create l_time_duration.make_precise (96, 4, 56, 89)
			create l_format.make (25)

			assert_equal ("Check default format for not Void.", "          96:4           ", l_format.formatted (l_time_duration))

			assert_equal ("Check default format for Void.",     "                         ", l_format.formatted (Void))
			
			l_format.set_padding_character ('.')
			assert_equal ("Check set_padding_character of format.", "..........96:4...........", l_format.formatted (l_time_duration))

			l_format.set_prefix_string ("pre")
			assert_equal ("Check set_prefix_string of format.", ".........pre96:4.........", l_format.formatted (l_time_duration))

			l_format.set_suffix_string ("suf")
			assert_equal ("Check set_suffix_string of format.", ".......pre96:4suf........", l_format.formatted (l_time_duration))

			l_format.left_justify
			assert_equal ("Check left_justify of format.", 		"pre96:4suf...............", l_format.formatted (l_time_duration))

			l_format.center_justify
			assert_equal ("Check center_justify of format.", 	".......pre96:4suf........", l_format.formatted (l_time_duration))

			l_format.right_justify
			assert_equal ("Check right_justify of format.", 	"...............pre96:4suf", l_format.formatted (l_time_duration))

			l_format.no_justify
			assert_equal ("Check no_justify of format.", "pre96:4suf", l_format.formatted (l_time_duration))

			l_format.set_void_string ("UNDEFINED")
			assert_equal ("Check set_void_string of format for Void", "UNDEFINED", l_format.formatted (Void))

			l_format.set_time_separator ('-')
			assert_equal ("Check set_time_separator of format.", "pre96-4suf", l_format.formatted (l_time_duration))
			
			l_format.hide_time_separator
			assert_equal ("Check hide_time_separator of format.", "pre964suf", l_format.formatted (l_time_duration))

			l_format.show_seconds_part
			assert_equal ("Check show_seconds_part of format.", "pre96456suf", l_format.formatted (l_time_duration))

			l_format.show_milliseconds_part
			assert_equal ("Check show_milliseconds_part of format.", "pre9645689suf", l_format.formatted (l_time_duration))

			create l_time_duration.make_precise (1, 2, 6, 89)

			l_format.show_leading_zero
			assert_equal ("Check show_leading_zero of format.", "pre010206089suf", l_format.formatted (l_time_duration))

			l_format.enable_decimal_format
			assert_equal ("Check enable_decimal_format", "pre1.0suf", l_format.formatted (l_time_duration))

			l_format.set_decimals (4)
			assert_equal ("Check set_decimals", "pre1.0350suf", l_format.formatted (l_time_duration))

			l_format.set_decimal_character (',')
			assert_equal ("Check set_decimal_character", "pre1,0350suf", l_format.formatted (l_time_duration))

		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_TIME_DURATION_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
