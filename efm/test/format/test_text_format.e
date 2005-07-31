indexing
	description: "Objects that tests features of class FM_TEXT_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/07/31 18:22:28 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

deferred class TEST_TEXT_FORMAT

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

	test_text_format is
			-- Test feature `format'.
		local
			l_text_format: FM_TEXT_FORMAT
			l_text: TEXT
		do
			create  l_text.make (1)

			create l_text_format.make (5)
			assert_equal ("Check default format for empty text", "", l_text_format.formatted (l_text).out)

			l_text.wipe_out
			l_text.append_paragraph ("First paragraph")
			assert_equal ("Check default format for a text that exceeds the columnwidth", "First%N para%Ngraph", l_text_format.formatted (l_text).out)

			l_text.wipe_out
			l_text.append_paragraph ("First")
			l_text.append_paragraph ("Second")
			assert_equal ("Check default format for a text with multiple paragraphs", "First%NSecon%Nd", l_text_format.formatted (l_text).out)

			l_text.wipe_out
			l_text.append_paragraph ("aaa bb cccc")
			l_text_format.enable_word_wrapping
			assert_equal ("Check enable_word_wrapping", "aaa %Nbb %Ncccc", l_text_format.formatted (l_text).out)
			
			l_text_format.disable_word_wrapping
			assert_equal ("Check disable_word_wrapping", "aaa b%Nb ccc%Nc", l_text_format.formatted (l_text).out)

			l_text_format.set_left_margin_width (1)
			assert_equal ("Check set_left_margin_width (1)", " aaa %N bb c%N ccc", l_text_format.formatted (l_text).out)

			l_text_format.set_right_margin_width (2)
			assert_equal ("Check set_right_margin_width (2)", " aa%N a %N bb%N  c%N cc%N c", l_text_format.formatted (l_text).out)

			l_text.wipe_out
			l_text.append_paragraph ("UNDEFINED")
			l_text_format.set_void_text (l_text)
			assert_equal ("Check set_void_text ", " UN%N DE%N FI%N NE%N D", l_text_format.formatted (Void).out)
			
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class TEST_TEXT_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
