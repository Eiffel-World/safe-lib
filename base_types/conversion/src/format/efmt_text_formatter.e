indexing
	description: "Objects that formats TEXT objects "
	author: "Fafchamps eric"
	date: "$Date: 2001/09/26 10:48:41 $"
	revision: "$Revision: 1.1 $"

class
	EFMT_TEXT_FORMATTER

creation
	make
	
feature {NONE} -- Initialization	

	make (a_width: INTEGER) is
			-- Initialize with `a_width'
		require
			a_width_strict_positif: a_width > 0
		do
			column_width := a_width
			left_margin_width := 0
			right_margin_width := 0
			disable_word_wrapping
		ensure
			width_set: column_width = a_width
			left_margin_width: left_margin_width = 0
			right_margin_width: right_margin_width = 0
			not_is_word_wrapped: not is_word_wrapped
		end
	
feature -- Access

	last_formatted: TEXT
			-- Last formatted object.

	column_width: INTEGER
			-- Width of column to format text within.

	left_margin_width: INTEGER
			-- Width of left margin.

	right_margin_width: INTEGER
			-- Width of right margin.


feature -- Status report

	is_word_wrapped: BOOLEAN
			-- Is word wrapped?

feature -- Status setting

	enable_word_wrapping is
			-- Enable word wrapping.
		do
			is_word_wrapped := True
		ensure
			is_word_wrapped: is_word_wrapped
		end


	disable_word_wrapping is
			-- Disable word wrapping.
		do
			is_word_wrapped := False
		ensure
			is_word_wrapped: not is_word_wrapped
		end

feature -- Element change

	set_left_margin_width (a_width: INTEGER) is
			-- Set left_margin_width with `a_width'.
		require
			valid_width: a_width < column_width - right_margin_width
		do
			left_margin_width := a_width
		ensure
			left_margin_width_copied: left_margin_width = a_width
		end

	set_right_margin_width (a_width: INTEGER) is
			-- Set right_margin_width with `a_width'.
		require
			valid_width: a_width < column_width - left_margin_width
		do
			right_margin_width := a_width
		ensure
			right_margin_width_copied: right_margin_width = a_width
		end
			
feature -- Basic operations

	format (a_text: TEXT) is
			-- Format `a_text'.
		do
			paragraphs_cursor := a_text.paragraphs.new_cursor
			!!last_formatted.make (a_text.count)
			format_all_paragraphs
		end

feature {NONE} -- Implementation

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
				format_current_paragraph
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
				!!line.make (column_width)

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
							!!estring.make_from_string (paragraph.substring (character_position, character_position + count - 1))
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


	available_width: INTEGER is
			-- Available width for the paragraph.
		do
			Result := column_width - right_margin_width - left_margin_width
		ensure
			Result = (column_width - right_margin_width - left_margin_width)
		end
		
end -- class EFMT_TEXT_FORMATTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

