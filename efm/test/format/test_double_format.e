indexing
	description: "Objects that tests features of class FM_DOUBLE_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/12 20:21:35 $";
	revision: "$Revision: 1.1 $";
	author: "Fafchamps eric"

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

	test_double_format is
		local
			l_double_format : FM_DOUBLE_FORMAT
			l_double : DOUBLE
		do
			Create l_double_format.make (5, 2)
			l_double_format.set_padding_character (' ')
			l_double_format.right_justify
			l_double_format.hide_positive_sign
			l_double_format.hide_thousand_separator
			l_double_format.show_negative_sign
			l_double_format.hide_zero
			l_double_format.show_trailing_zero
			l_double_format.show_thousand_separator
			l_double_format.disable_zero_prefix

			assert_equal ("format_1", " 3.40", l_double_format.formatted (3.4))
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
