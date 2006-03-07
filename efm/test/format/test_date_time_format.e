indexing
	description: "Objects that tests features of class FM_DATE_TIME_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/07 17:10:10 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

deferred class TEST_DATE_TIME_FORMAT

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
			l_date_time: DT_DATE_TIME
			l_format: FM_DATE_TIME_FORMAT
		do
			create l_date_time.make_precise (2003, 12, 5, 23, 4, 56, 567)
			create l_format.make (30)

			assert_equal ("Check default format for not Void.", "       2003-12-05 23:04       ", l_format.formatted (l_date_time))

			assert_equal ("Check default format for Void.",     "                              ", l_format.formatted (Void))
			
			l_format.set_padding_character ('.')
			assert_equal ("Check set_padding_character of format.", ".......2003-12-05 23:04.......", l_format.formatted (l_date_time))

			l_format.set_prefix_string ("pre")
			assert_equal ("Check set_prefix_string of format.", ".....pre2003-12-05 23:04......", l_format.formatted (l_date_time))

			l_format.set_suffix_string ("suf")
			assert_equal ("Check set_suffix_string of format.", "....pre2003-12-05 23:04suf....", l_format.formatted (l_date_time))

			l_format.left_justify
			assert_equal ("Check left_justify of format.", "pre2003-12-05 23:04suf........", l_format.formatted (l_date_time))

			l_format.center_justify
			assert_equal ("Check center_justify of format.", "....pre2003-12-05 23:04suf....", l_format.formatted (l_date_time))

			l_format.right_justify
			assert_equal ("Check right_justify of format.", "........pre2003-12-05 23:04suf", l_format.formatted (l_date_time))

			l_format.no_justify
			assert_equal ("Check no_justify of format.", "pre2003-12-05 23:04suf", l_format.formatted (l_date_time))

			l_format.set_void_string ("UNDEFINED")
			assert_equal ("Check set_void_string of format for Void", "UNDEFINED", l_format.formatted (Void))

			l_format.set_date_separator ('/')
			assert_equal ("Check set_date_separator of format.", "pre2003/12/05 23:04suf", l_format.formatted (l_date_time))
			
			l_format.hide_date_separator
			assert_equal ("Check hide_date_separator of format.", "pre20031205 23:04suf", l_format.formatted (l_date_time))

			l_format.select_dmy_order
			assert_equal ("Check select_dmy_order of format.", "pre05122003 23:04suf", l_format.formatted (l_date_time))
			
			l_format.select_mdy_order
			assert_equal ("Check select_mdy_order of format.", "pre12052003 23:04suf", l_format.formatted (l_date_time))

			l_format.select_ymd_order
			assert_equal ("Check select_ymd_order of format.", "pre20031205 23:04suf", l_format.formatted (l_date_time))
			
			l_format.disable_four_digits_year
			assert_equal ("Check select_disable_four_digits of format.", "pre031205 23:04suf", l_format.formatted (l_date_time))

			create l_date_time.make_precise (2000, 4, 5, 1, 4, 6, 89)			
			l_format.hide_leading_zero_in_date

			assert_equal ("Check hide_leading_zero_in_date of format.", "pre045 01:04suf", l_format.formatted (l_date_time))

			l_format.set_time_separator ('-')
			assert_equal ("Check set_time_separator of format.", "pre045 01-04suf", l_format.formatted (l_date_time))
			
			l_format.hide_time_separator
			assert_equal ("Check hide_time_separator of format.", "pre045 0104suf", l_format.formatted (l_date_time))

			l_format.show_seconds_part
			assert_equal ("Check show_seconds_part of format.", "pre045 010406suf", l_format.formatted (l_date_time))

			l_format.show_milliseconds_part
			assert_equal ("Check show_milliseconds_part of format.", "pre045 010406089suf", l_format.formatted (l_date_time))

			l_format.hide_leading_zero_in_time
			assert_equal ("Check hide_leading_zero of format.", "pre045 14689suf", l_format.formatted (l_date_time))
			
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_DATE_TIME_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
