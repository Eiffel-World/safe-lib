indexing
	description: "Objects that tests features of class FM_DATE_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:19 $";
	revision: "$Revision: 1.4 $";
	author: "Fafchamps Eric"

deferred class TEST_DATE_FORMAT

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
			l_date: DT_DATE
			l_format: FM_DATE_FORMAT
		do
			create l_date.make (2003, 12, 5)
			create l_format.make (18)

			assert_equal ("Check default format for not Void.", "    2003-12-05    ", l_format.formatted (l_date))

			assert_equal ("Check default format for Void.",     "                  ", l_format.formatted (Void))
			
			l_format.set_padding_character ('.')
			assert_equal ("Check set_padding_character of format.", "....2003-12-05....", l_format.formatted (l_date))

			l_format.set_prefix_string ("pre")
			assert_equal ("Check set_prefix_string of format.", "..pre2003-12-05...", l_format.formatted (l_date))

			l_format.set_suffix_string ("suf")
			assert_equal ("Check set_suffix_string of format.", ".pre2003-12-05suf.", l_format.formatted (l_date))

			l_format.left_justify
			assert_equal ("Check left_justify of format.", "pre2003-12-05suf..", l_format.formatted (l_date))

			l_format.center_justify
			assert_equal ("Check center_justify of format.", ".pre2003-12-05suf.", l_format.formatted (l_date))

			l_format.right_justify
			assert_equal ("Check right_justify of format.", "..pre2003-12-05suf", l_format.formatted (l_date))

			l_format.no_justify
			assert_equal ("Check no_justify of format.", "pre2003-12-05suf", l_format.formatted (l_date))

			l_format.set_date_separator ('/')
			assert_equal ("Check set_date_separator of format.", "pre2003/12/05suf", l_format.formatted (l_date))
			
			l_format.hide_date_separator
			assert_equal ("Check hide_date_separator of format.", "pre20031205suf", l_format.formatted (l_date))

			l_format.select_dmy_order
			assert_equal ("Check select_dmy_order of format.", "pre05122003suf", l_format.formatted (l_date))
			
			l_format.select_mdy_order
			assert_equal ("Check select_mdy_order of format.", "pre12052003suf", l_format.formatted (l_date))

			l_format.select_ymd_order
			assert_equal ("Check select_ymd_order of format.", "pre20031205suf", l_format.formatted (l_date))
			
			l_format.disable_four_digits_year
			assert_equal ("Check select_disable_four_digits of format.", "pre031205suf", l_format.formatted (l_date))

			create l_date.make (2000, 4, 5)
			
			l_format.hide_leading_zero
			assert_equal ("Check hide_leading_zero of format.", "pre045suf", l_format.formatted (l_date))
			
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	

end -- class TEST_DATE_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
