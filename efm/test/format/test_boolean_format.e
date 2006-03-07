indexing
	description: "Objects that tests features of class FM_BOOLEAN_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/07 17:10:10 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

deferred class TEST_BOOLEAN_FORMAT

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
			l_format: FM_BOOLEAN_FORMAT
		do
			create l_format.make_default
			assert_equal ("Check default format for value True", "1", l_format.formatted (True))
			assert_equal ("Check default format for value False", "0", l_format.formatted (False))
			assert_equal ("Check default format for Void", " ", l_format.formatted (Void))
			
			create l_format.make (21)
			assert_equal ("Check default padding character of format for value True", "          1          ", l_format.formatted (True))
			l_format.set_padding_character ('-')
			assert_equal ("Check other padding character of format for value True", "----------1----------", l_format.formatted (True))
			l_format.set_prefix_string ("prefix")
			assert_equal ("Check prefix string of format for value True", "-------prefix1-------", l_format.formatted (True))
			l_format.set_suffix_string ("suffix")
			assert_equal ("Check suffix_string of format for value True", "----prefix1suffix----", l_format.formatted (True))
			l_format.left_justify
			assert_equal ("Check is_left_justified of format for value True", "prefix1suffix--------", l_format.formatted (True))
			l_format.right_justify
			assert_equal ("Check is_right_justified of format for value True", "--------prefix1suffix", l_format.formatted (True))
			l_format.no_justify
			assert_equal ("Check is_not_justified of format for value True", "prefix1suffix", l_format.formatted (True))			
			l_format.set_false_string ("FALSE")
			assert_equal ("Check false_string of format for value True", "prefixFALSEsuffix", l_format.formatted (False))
			l_format.set_false_string ("TRUE")
			assert_equal ("Check false_string of format for value True", "prefixTRUEsuffix", l_format.formatted (False))
			l_format.set_void_string ("UNDEFINED")
			assert_equal ("Check void_string of format for Void", "UNDEFINED", l_format.formatted (Void))
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_BOOLEAN_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
