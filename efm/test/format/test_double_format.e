indexing
	description: "Objects that tests features of class FM_DOUBLE_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/05/16 18:03:44 $";
	revision: "$Revision: 1.2 $";
	author: "Fafchamps Eric"

deferred class TEST_DOUBLE_FORMAT

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
			l_format: FM_DOUBLE_FORMAT
			l_double: DOUBLE
			l_double_ref: DOUBLE_REF
		do
			l_double := 123
			create l_format.make (3, 0)
			
			assert_equal ("Check default format for value 123", "123", l_format.formatted (l_double))
			assert_equal ("Check default format for Void", "   ", l_format.formatted (Void))
			
			create l_format.make (21, 0)
			assert_equal ("Check default padding character of format for value 123", "                  123", l_format.formatted (l_double))
			
			l_format.set_padding_character ('-')
			assert_equal ("Check set_padding character of format for value 123", "------------------123", l_format.formatted (l_double))
			
			l_format.set_prefix_string ("prefix")
			assert_equal ("Check set_prefix_string of format for value 123", "------------prefix123", l_format.formatted (l_double))
			
			l_format.set_suffix_string ("suffix")
			assert_equal ("Check set_suffix_string of format for value 123", "------prefix123suffix", l_format.formatted (l_double))
			
			l_format.left_justify
			assert_equal ("Check left_justify of format for value 123", "prefix123suffix------", l_format.formatted (l_double))
			
			l_format.center_justify
			assert_equal ("Check center_justify of format for value 123", "---prefix123suffix---", l_format.formatted (l_double))
			
			l_format.no_justify
			assert_equal ("Check no_justify of format for value 123", "prefix123suffix", l_format.formatted (l_double))
			
			l_format.set_void_string ("UNDEFINED")
			assert_equal ("Check set_void_string of format for Void", "UNDEFINED", l_format.formatted (Void))

			l_format.show_positive_sign
			assert_equal ("Check show_positive_sign of format for value 123", "prefix+123suffix", l_format.formatted (l_double))

			l_format.hide_positive_sign
			assert_equal ("Check hide_positive_sign of format for value 123", "prefix123suffix", l_format.formatted (l_double))

			create l_format.make (1, 0)			
			l_format.show_zero
			assert_equal ("Check show_zero of format for value 0", "0", l_format.formatted (0.0))

			l_format.hide_zero
			assert_equal ("Check hide_zero of format for value 0", " ", l_format.formatted (0.0))

			create l_format.make (21, 0)
			create l_double_ref
			l_double_ref.set_item (-12345)
			
			l_format.enable_zero_prefix
			assert_equal ("Check enable_zero_prefix of format for value -12345", "-0000000000000012,345", l_format.formatted (l_double_ref))

			l_format.disable_zero_prefix
			assert_equal ("Check disable_zero_prefix of format for value -12345", "              -12,345", l_format.formatted (l_double_ref))

			l_format.hide_negative_sign
			assert_equal ("Check hide_negative_sign of format for value -12345", "               12,345", l_format.formatted (l_double_ref))

			l_format.show_negative_sign
			assert_equal ("Check show_negative_sign of format for value -12345", "              -12,345", l_format.formatted (l_double_ref))

			l_format.hide_thousand_separator
			assert_equal ("Check hide_thousand_separator of format for value -12345", "               -12345", l_format.formatted (l_double_ref))

			l_format.show_thousand_separator
			assert_equal ("Check show_thousand_separator of format for value -12345", "              -12,345", l_format.formatted (l_double_ref))

			l_format.set_thousand_separator (' ')
			assert_equal ("Check set_thousand_separator of format for value -12345", "              -12 345", l_format.formatted (l_double_ref))
		
			l_double := -12345.67	
			create l_format.make (15, 3)
			l_format.hide_trailing_zero
			assert_equal ("Check hide_trailing_zero of format for value -12345.67", "     -12,345.67", l_format.formatted (l_double))

			create l_format.make (15, 3)
			l_format.show_trailing_zero
			assert_equal ("Check show_trailing_zero of format for value -12345.67", "    -12,345.670", l_format.formatted (l_double))

			l_format.set_decimals (0)
			assert_equal ("Check set_decimals (0) of format for value -12345.67", "        -12,346", l_format.formatted (l_double))

			l_format.set_decimals (4)
			assert_equal ("Check set_decimals (4) of format for value -12345.67", "   -12,345.6700", l_format.formatted (l_double))

			l_format.set_decimal_character (' ')
			assert_equal ("Check set_decimal_character (' ') of format for value -12345.67", "   -12,345 6700", l_format.formatted (l_double))

		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_DOUBLE_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
