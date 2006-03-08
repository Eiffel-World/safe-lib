indexing
	description: "Objects that tests features of class FM_INTEGER_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:19 $";
	revision: "$Revision: 1.4 $";
	author: "Fafchamps Eric"

deferred class TEST_INTEGER_FORMAT

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
			l_format: FM_INTEGER_FORMAT
			l_integer: INTEGER
			l_integer_ref: INTEGER_REF
		do
			l_integer := 123
			create l_format.make (3)
			
			assert_equal ("Check default format for value 123", "123", l_format.formatted (l_integer))
			
			create l_format.make (21)
			assert_equal ("Check default padding character of format for value 123", "                  123", l_format.formatted (l_integer))
			
			l_format.set_padding_character ('-')
			assert_equal ("Check set_padding character of format for value 123", "------------------123", l_format.formatted (l_integer))
			
			l_format.set_prefix_string ("prefix")
			assert_equal ("Check set_prefix_string of format for value 123", "------------prefix123", l_format.formatted (l_integer))
			
			l_format.set_suffix_string ("suffix")
			assert_equal ("Check set_suffix_string of format for value 123", "------prefix123suffix", l_format.formatted (l_integer))
			
			l_format.left_justify
			assert_equal ("Check left_justify of format for value 123", "prefix123suffix------", l_format.formatted (l_integer))
			
			l_format.center_justify
			assert_equal ("Check center_justify of format for value 123", "---prefix123suffix---", l_format.formatted (l_integer))
			
			l_format.no_justify
			assert_equal ("Check no_justify of format for value 123", "prefix123suffix", l_format.formatted (l_integer))
			
			l_format.show_positive_sign
			assert_equal ("Check show_positive_sign of format for value 123", "prefix+123suffix", l_format.formatted (l_integer))

			l_format.hide_positive_sign
			assert_equal ("Check hide_positive_sign of format for value 123", "prefix123suffix", l_format.formatted (l_integer))

			create l_format.make (1)			
			l_format.show_zero
			assert_equal ("Check show_zero of format for value 0", "0", l_format.formatted (0))

			l_format.hide_zero
			assert_equal ("Check hide_zero of format for value 0", " ", l_format.formatted (0))

			create l_format.make (21)
			create l_integer_ref
			l_integer_ref.set_item (-12345)
			
			l_format.enable_zero_prefix
			assert_equal ("Check enable_zero_prefix of format for value -12345", "-0000000000000012,345", l_format.formatted (l_integer_ref))

			l_format.disable_zero_prefix
			assert_equal ("Check disable_zero_prefix of format for value -12345", "              -12,345", l_format.formatted (l_integer_ref))

			l_format.hide_negative_sign
			assert_equal ("Check hide_negative_sign of format for value -12345", "               12,345", l_format.formatted (l_integer_ref))

			l_format.show_negative_sign
			assert_equal ("Check show_negative_sign of format for value -12345", "              -12,345", l_format.formatted (l_integer_ref))

			l_format.hide_thousand_separator
			assert_equal ("Check hide_thousand_separator of format for value -12345", "               -12345", l_format.formatted (l_integer_ref))

			l_format.show_thousand_separator
			assert_equal ("Check show_thousand_separator of format for value -12345", "              -12,345", l_format.formatted (l_integer_ref))

			l_format.set_thousand_separator (' ')
			assert_equal ("Check set_thousand_separator of format for value -12345", "              -12 345", l_format.formatted (l_integer_ref))

		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_INTEGER_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
