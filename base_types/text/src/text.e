indexing
	description: "Objects that represents a text, a text is composed of 0 or more paragraphs of characters"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 11:08:46 $"
	revision: "$Revision: 1.1 $"

class
	TEXT

inherit
	ANY
		redefine
			is_equal,
			copy,
			out
		end

creation
	make

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty text and allocate
			-- memory space for at least `n' paragraphs
		require
			positive_n: n >= 0
		do
			!!paragraphs_i.make (n)
		ensure
			is_empty: is_empty
		end	


feature -- Access

	paragraphs: DS_BILINEAR [STRING] is
			-- Paragraphs.
		do
			Result := paragraphs_i
		end
	
	paragraph (i: INTEGER): STRING is
			-- Paragraph at `i'-th position
		require
			valid_index: i >= 1 and i <= count
		do
			Result := paragraphs_i.item (i)
		end

feature -- Measurement

	count: INTEGER is
			-- Number of paragraphs.
		do
			Result := paragraphs_i.count
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Are there no paragraphs.
		do
			Result := paragraphs_i.is_empty
		end

	last_position: TEXT_POSITION is
			-- Position of the last character in the text.
		require
			not_is_empty: not is_empty
		do
			!!Result.make (paragraphs_i.count, paragraphs_i.item (paragraphs_i.count).count)
		end


feature -- Element change

	insert_paragraph (a_paragraph: STRING; a_paragraph_index: INTEGER) is
			-- Insert `a_paragraph' to the left of paragraph with `a_paragraph_index'.
		require
			valid_index: a_paragraph_index >= 1 and a_paragraph_index <= count
			paragraph_not_void: a_paragraph /= Void
		do
			paragraphs_i.force (a_paragraph, a_paragraph_index)
		ensure
			one_more: count = old count + 1
		end
		

	append_paragraph (a_paragraph: STRING) is
			-- Append a copy of `a_paragraph' at end.
		require
			not_void: a_paragraph /= Void
		do
			paragraphs_i.force_last (clone(a_paragraph))
		ensure
			one_more: count = old count +1
		end

	insert_character (a_character: CHARACTER; a_text_position: TEXT_POSITION) is
			-- Insert `a_character' to the left of `a_text_position'.
		require
			valid_text_position: a_text_position /= Void
		local
			elks_string: ELKS_STRING
		do
			!!elks_string.make_from_string (paragraphs_i.item (a_text_position.paragraph_position))
			elks_string.insert_character (a_character, a_text_position.character_position)	
		ensure
			on_character_more: paragraphs_i.item (a_text_position.paragraph_position).count = old (paragraphs_i.item (a_text_position.paragraph_position).count) + 1	
		end

	put_character (a_character: CHARACTER; a_text_position: TEXT_POSITION) is
			-- Replace character at `a_text_position' with  `a_character'.
		require
			valid_text_position: a_text_position /= Void

		do
			paragraphs_i.item (a_text_position.paragraph_position).put (a_character, a_text_position.character_position)	
		ensure
			character_is_put: paragraphs_i.item (a_text_position.paragraph_position).item (a_text_position.character_position) = a_character
			same_count: paragraphs_i.item (a_text_position.paragraph_position).count = old (paragraphs_i.item (a_text_position.paragraph_position).count)
		end

	append_character (a_character: CHARACTER; a_paragraph_index: INTEGER) is
			-- Append `a_character' to the paragraph with `a_paragraph_index'.
		require
			valid_paragraph_index: a_paragraph_index > 0 and a_paragraph_index <= count
		do
			paragraphs_i.item (a_paragraph_index).append_character (a_character)	
		ensure
			on_character_more: paragraphs_i.item (a_paragraph_index).count = old (paragraphs_i.item (a_paragraph_index).count) + 1	
		end

feature -- Removal

	remove_paragraph (i: INTEGER) is
			-- Remove paragraph at `i'-th position.
		require
			valid_index: i >= 1 and i <= count
		do
			paragraphs_i.remove (i)
		ensure
			one_less: count = old count - 1
		end

	remove_character (a_text_position: TEXT_POSITION) is
			-- Remove character at `a_text_position'.
		require
			valid_character_position: a_text_position.character_position /= 0
		do
			paragraphs_i.item (a_text_position.paragraph_position).remove (a_text_position.character_position)
		ensure
			one_character_less: paragraphs_i.item (a_text_position.paragraph_position).count = old (paragraphs_i.item (a_text_position.paragraph_position).count) - 1	
		end

feature -- Duplication

	copy (other: like Current) is
			-- Reinitialize by copying the paragraphs of `other'.
			-- (This is also used by `clone'.)
		do
			if other /= Current then
				!!paragraphs_i.make (other.count)
				from
					other.paragraphs.start
				until
					other.paragraphs.off
				loop
					paragraphs_i.force_last (clone(other.paragraphs.item_for_iteration))
					other.paragraphs.forth
				end	
			end
		ensure then
			new_result_count: count = other.count;
			-- same_paragraphs: For every `paragraph' in 1..`count', `paragraph' (`i') equals `other'.`paragraph' (`i')
			-- paragraphs are not shared
		end;


feature -- Output

	out: STRING is
			-- Printable representation
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]
		do
			from
				!!Result.make (paragraphs.count * 40)
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
			until
				paragraphs_cursor.off
			loop
				Result.append_string (paragraphs_cursor.item)
				paragraphs_cursor.forth
				if not paragraphs_cursor.off then
					Result.append_string ("%N")
				end				
			end
		ensure then
			-- Paragraphs strings are concatenated, %N is used as separator between each paragraph
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is text made of same paragraphs as `other'?
		do
			if other = Current then
				Result := True
			elseif count = other.count then
				from
					other.paragraphs.start
					paragraphs_i.start
					Result := True
				until
					other.paragraphs.off or Result = False
				loop
					if not equal (paragraphs_i.item_for_iteration, other.paragraphs.item_for_iteration) then
						Result := False
					end
					other.paragraphs.forth
					paragraphs_i.forth
				end					
			end;
		end;


	

feature -- Basic operations

	join_next_paragraph (a_paragraph_index: INTEGER) is
		-- Join the paragraph at `a_paragraph_index' + 1 to the paragraph with `a_paragraph_index'.
		require
			multiple_paragraphs: count > 1
			not_last: a_paragraph_index /= count
		do
			paragraphs_i.item (a_paragraph_index).append_string (paragraphs_i.item (a_paragraph_index + 1))
				--| Replace with Void to allow carbage collection otherwise joined paragraph remains attached due to ARRAYED implementation of list.
			paragraphs_i.replace (Void, a_paragraph_index + 1) 
			paragraphs_i.remove (a_paragraph_index + 1)
		ensure
			one_paragraph_less: count = (old count - 1)
			-- paragraph at `a_paragraph_index' + 1 is appended to paragraph with `a_paragraph_index'
		end

	split_paragraph (a_text_position: TEXT_POSITION) is
			-- Split paragraph in one paragraph before `a_text_position' and one paragraph from `a_text_position' to the paragraph end.
		local
			first: ESTRING
			second: ESTRING	
		do
			!!first.make_from_string (paragraphs_i.item (a_text_position.paragraph_position))
			second := first.substring (a_text_position.character_position, first.count)
			first.head (a_text_position.character_position - 1)
			if a_text_position.paragraph_position < count then
				insert_paragraph (second.string, a_text_position.paragraph_position + 1)
			else
				append_paragraph (second.string)
			end
		ensure
			one_paragraph_more: count = (old count + 1)
		end

feature {NONE} -- Implementation

	paragraphs_i: DS_ARRAYED_LIST [STRING]
			-- List of paragraphs, implemented as an array for an optimal access by indice.


invariant
	paragraphs /= Void

end -- class TEXT

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--