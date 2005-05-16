indexing
	description: "Objects that tests features of class FM_TEXT_FORMAT"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/05/16 18:03:44 $";
	revision: "$Revision: 1.2 $";
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
			f: FM_TEXT_FORMAT
			text: TEXT
		do
			Create  text.make (1)
			Create f.make (5)
			assert_equal ("format empty text for a columnwidth of 5", "", f.formatted (text).out)

			Create  text.make (1)			
			text.append_paragraph ("First paragraph")
			Create f.make (5)
			assert_equal ("format 'First paragraph' in a columnwidth of 5", "First%N para%Ngraph", f.formatted (text).out)

			Create  text.make (2)			
			text.append_paragraph ("First")
			text.append_paragraph ("Second")
			Create f.make (3)
			assert_equal ("format 'First' and 'Second' in a column width of 3", "Fir%Nst%NSec%Nond", f.formatted (text).out)

			Create  text.make (1)			
			text.append_paragraph ("aa bb cccc")
			Create f.make (8)
			f.enable_word_wrapping
			assert_equal ("format 'aa bb cccc' in a columnwidth of 8 with word wrapping", "aa bb %Ncccc", f.formatted (text).out)			
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
