indexing
	description: "Objects that formats TEXT objects "

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2008/03/18 09:18:43 $";
	revision: "$Revision: 1.6 $";
	author: "Fafchamps eric"

class
	FM_TEXT_FORMAT

inherit
	FM_MULTI_LINE_FORMAT [TEXT]
		redefine
			copy
		end
create
	make, make_word_wrapped, make_default

feature {NONE} -- Initialization

	make (a_width: INTEGER) is
			-- Initialize with `a_width'
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
			set_left_margin_width (shared_default_format.left_margin_width)
			set_right_margin_width (shared_default_format.right_margin_width)
			set_void_text (shared_default_format.void_text)
			is_word_wrapped := shared_default_format.is_word_wrapped
		ensure
			width_set: width = a_width
			default_left_margin_width: left_margin_width.is_equal (shared_default_format.left_margin_width)
			default_right_margin_width: right_margin_width.is_equal (shared_default_format.right_margin_width)
			void_text_default: equal (void_text, shared_default_format.void_text)
			default_is_word_wrapped: is_word_wrapped.is_equal (shared_default_format.is_word_wrapped)
		end

	make_word_wrapped (a_width: INTEGER) is
			-- Initialize with `a_width' and word wrap enabled.
		require
			a_width_strictly_positive: a_width > 0
		do
			make (a_width)
			enable_word_wrapping
		ensure
			width_set: width = a_width
			default_left_margin_width: left_margin_width.is_equal (shared_default_format.left_margin_width)
			default_right_margin_width: right_margin_width.is_equal (shared_default_format.right_margin_width)
			void_text_default: equal (void_text, shared_default_format.void_text)
			is_word_wrapped: is_word_wrapped
		end

	make_default is
			-- Make with default values.
			-- (used for the initialization of the shared_default_format)
		do
			width := 1
			left_margin_width := 0
			right_margin_width := 0
			set_void_text (Void)
			disable_word_wrapping
		ensure
			width_is_1: width = 1
			left_margin_width_is_0: left_margin_width = 0
			right_margin_width_is_0: right_margin_width = 0
			void_text_is_void : void_text = Void
			not_is_word_wrapped: not is_word_wrapped
		end

feature -- Access

	shared_default_format: FM_TEXT_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		end

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

	copy (other: like Current) is
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
		do
			Precursor (other)
			paragraphs_cursor := Void
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_text: TEXT): TEXT is
			-- Result of formatting `a_text'.
		do
			if a_text /= Void then
				paragraphs_cursor := a_text.paragraphs.new_cursor
				create last_formatted.make (a_text.count)
				format_all_paragraphs
			else
				if void_text /= Void then
					paragraphs_cursor := (void_text.twin).paragraphs.new_cursor
					create last_formatted.make (void_text.count)
					format_all_paragraphs
				else
					create last_formatted.make (0)
				end
			end
			Result := last_formatted
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	last_formatted: TEXT

	paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]
			-- Cursor on paragraphs to be formatted.

	character_position: INTEGER
			-- Current character position in current formatted paragraph.

	format_all_paragraphs is
			-- 	Format all paragraphs.
		do
			from
				paragraphs_cursor.start
				character_position := 1
			until
				paragraphs_cursor.off
			loop
				if not paragraphs_cursor.item.is_empty then
					format_current_paragraph
				else
					last_formatted.append_paragraph (create {STRING}.make(0))
				end
				paragraphs_cursor.forth
			end
		end

	format_current_paragraph  is
			-- Format current paragraph.
		local
			paragraph: STRING
			line: ESTRING
			count: INTEGER
			remaining: INTEGER
			last_character: CHARACTER
			after_character: CHARACTER
			index_last_space: INTEGER
			estring: ESTRING
		do
			from
				paragraph := paragraphs_cursor.item
				character_position := 1
			until
				character_position > paragraphs_cursor.item.count
			loop
				create line.make (width)

				--| Find how many remaining characters could fit in the column
				remaining := paragraph.count - character_position + 1

				if remaining <= available_width then
					count := remaining
				else
					count := available_width
					--| Decrease count if needed for word-wrapping
					if is_word_wrapped then
						last_character := paragraph.item (character_position + count - 1)
						after_character := paragraph.item (character_position + count)
						if	(last_character.is_alpha or last_character.is_digit) and (after_character.is_alpha or after_character.is_digit) then
							create estring.make_from_string (paragraph.substring (character_position, character_position + count - 1))
							index_last_space := estring.rightmost_index_of_character (' ')
							if index_last_space > 0 then
								count := index_last_space
							end
						end
					end
				end

				--| Skip left margin
				line.extend_to_count (' ', left_margin_width)

				--| Append paragraph part
				line.string.append_string (paragraph.substring (character_position, character_position + count - 1))
				last_formatted.append_paragraph (line.string)

				character_position := character_position + count
			end
		end

end -- class FM_TEXT_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
