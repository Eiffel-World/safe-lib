indexing

	description:

		"Test features of class EFMT_TEXT_FORMATTER"

	author:     "Fafchamps Eric"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date: 2001/09/26 10:54:44 $"
	revision:   "$Revision: 1.1 $"

deferred class TEST_EFMT_TEXT_FORMATTER

inherit

	TS_TEST_CASE

feature -- Test

	test_format is
			-- Test feature `format'.
		local
			f: EFMT_TEXT_FORMATTER
			text: TEXT
		do
			!! text.make (1)
			!!f.make (5)
			f.format (text)
			assert_equal ("format empty text for a columnwidth of 5", "", f.last_formatted.out)

			!! text.make (1)			
			text.append_paragraph ("First paragraph")
			!!f.make (5)
			f.format (text)
			assert_equal ("format 'First paragraph' in a columnwidth of 5", "First%N para%Ngraph", f.last_formatted.out)

			!! text.make (2)			
			text.append_paragraph ("First")
			text.append_paragraph ("Second")
			!!f.make (3)
			f.format (text)
			assert_equal ("format 'First' and 'Second' in a column width of 3", "Fir%Nst%NSec%Nond", f.last_formatted.out)
	

			!! text.make (1)			
			text.append_paragraph ("aa bb cccc")
			!!f.make (8)
			f.enable_word_wrapping
			f.format (text)
			assert_equal ("format 'aa bb cccc' in a columnwidth of 8 with word wrapping", "aa bb %Ncccc", f.last_formatted.out)
			
		end

end -- class TEST_EFMT_TEXT_FORMATTER
