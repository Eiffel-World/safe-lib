indexing
	description: "Objects that represents a text, a text is composed of 0 or more paragraphs of characters"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2007/11/15 10:01:58 $";
	revision: "$Revision: 1.4 $";
	author: "Fafchamps Eric"

class
	TEXT

inherit
	ANY
		redefine
			is_equal,
			copy,
			out
		end

create
	make

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty text and allocate
			-- memory space for at least `n' paragraphs
		require
			positive_n: n >= 0
		do
			create paragraphs_i.make (n)
		ensure
			is_empty: is_empty
		end	

feature {NONE} -- Initialization

feature -- Access

	paragraphs: DS_ARRAYED_LIST [STRING] is
			-- Paragraphs.
		do
			Result := paragraphs_i
		ensure
			defined: Result /= Void
		end
	
	paragraph (i: INTEGER): STRING is
			-- Paragraph at `i'-th position
		require
			valid_index: i >= 1 and i <= count
		do
			Result := paragraphs_i.item (i)
		ensure
			defined: Result /= Void
		end
		
	last_paragraph: STRING is
			-- Last paragraph.
		require
			not_is_empty: not is_empty
		do
			Result := paragraphs_i.last
		ensure
			defined: Result /= Void
		end

	last_position: TEXT_POSITION is
			-- Position of the last character in the text.
		require
			not_is_empty: not is_empty
		do
			create Result.make (paragraphs_i.count, paragraphs_i.item (paragraphs_i.count).count)
		ensure
			defined: Result /= Void
		end

	first_position_of_string (a_string: STRING): TEXT_POSITION is
			-- Position of first occurence of `a_string'.
		require
			string_not_empty: a_string /= Void and then not a_string.is_empty
			has_string: has_string (a_string)
		local
			substring_index : INTEGER
			paragraphs_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
		do
			from
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
			until
				paragraphs_cursor.off or Result /= Void
			loop
				substring_index := paragraphs_cursor.item.substring_index (a_string, 1)
				if  substring_index > 0 then
					create Result.make (paragraphs_cursor.index, substring_index)
				end
				paragraphs_cursor.forth
			end
		ensure
			defined: Result /= Void
		end

feature -- Measurement

	count: INTEGER is
			-- Number of paragraphs.
		do
			Result := paragraphs_i.count
		ensure
			valid_count: Result >= 0
		end
		
	average_paragraph_size: INTEGER is
			-- 	Average number of characters in the paragraphes of `Current'.
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]
		do
			from
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
			until
				paragraphs_cursor.off
			loop
				Result := Result + paragraphs_cursor.item.count
				paragraphs_cursor.forth
			end
			Result := Result // count
		ensure
			valid_size: Result >= 0
		end

	maximum_paragraph_size: INTEGER is
			-- Maximum number of characters in the paragraphs of `Current'.
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]
		do
			from
				Result := 0
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
			until
				paragraphs_cursor.off
			loop
				if paragraphs_cursor.item.count > Result then
					Result := paragraphs_cursor.item.count
				end
				paragraphs_cursor.forth
			end
		ensure
			valid_size: Result >= 0
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
			end
		end

feature -- Status report

	valid_position (a_text_position: TEXT_POSITION): BOOLEAN is
			-- Is `a_text_position' a valid position in `Current'?
		require
			a_text_position_defined: a_text_position /= Void
		do
			if a_text_position.paragraph_position <= count 
					and then a_text_position.character_position <= paragraphs_i.item (a_text_position.paragraph_position).count
					and then (a_text_position.character_position /= 0) or (paragraphs_i.item (a_text_position.paragraph_position).count = 0) then
				Result := True
			else
				Result := False
			end
		end

	has_string (a_string: STRING): BOOLEAN is
			-- Does text include `a_string' in one of it paragraphs?
		require
			a_string_defined: a_string /= Void
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]
		do
			from
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
				Result := False
			until
				paragraphs_cursor.off or Result
			loop
				Result := paragraphs_cursor.item.substring_index (a_string, 1) > 0
				paragraphs_cursor.forth
			end
		end

	is_empty: BOOLEAN is
			-- Are there no paragraphs.
		do
			Result := paragraphs_i.is_empty
		end

	is_same_paragraph_width: BOOLEAN is
			-- Is the width of all the paragraphs the same?
		local
			l_width: INTEGER
			paragraphs_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
		do
			from
				Result := True
				paragraphs_cursor := paragraphs.new_cursor
				paragraphs_cursor.start
			until
				paragraphs_cursor.off or not Result
			loop
				if not paragraphs_cursor.is_first and l_width /= paragraphs_cursor.item.count then
					Result := False
				end
				l_width := paragraphs_cursor.item.count
				paragraphs_cursor.forth
			end
		end

feature -- Status setting

feature -- Cursor movement

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
			valid_text_position: a_text_position /= Void and then valid_position (a_text_position)
		local
			elks_string: ELKS_STRING
		do
			create elks_string.make_from_string (paragraphs_i.item (a_text_position.paragraph_position))
			elks_string.insert_character (a_character, a_text_position.character_position)	
		ensure
			on_character_more: paragraphs_i.item (a_text_position.paragraph_position).count = old (paragraphs_i.item (a_text_position.paragraph_position).count) + 1	
		end

	insert_text (a_text: TEXT; a_text_position: TEXT_POSITION) is
			-- Insert `a_text' to the left of `a_text_position'.
		require
			non_empty_text: not a_text.is_empty
			valid_text_position: a_text_position /= Void  and then valid_position (a_text_position)
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]	--| cursor on paragraphs of a_text
			estring: ESTRING
			right: ESTRING 				--| substring to the right of a_text_position (position included)
			target_index: INTEGER		--| index in Current target
		do
			from
				paragraphs_cursor := a_text.paragraphs.new_cursor
				paragraphs_cursor.start
				target_index := a_text_position.paragraph_position
				
				create estring.make_from_string (paragraphs_i.item (target_index))
				if estring.is_empty then
					create right.make (1)
				else
					--| save right substring
					right := estring.substring (a_text_position.character_position, estring.count)
					--| remove right substring
					estring.head (a_text_position.character_position - 1)
				end
				estring.string.append_string (paragraphs_cursor.item)
				paragraphs_cursor.forth
			until
				paragraphs_cursor.off
			loop
				if target_index < count then
					insert_paragraph (paragraphs_cursor.item, target_index + 1)
				else
					append_paragraph (paragraphs_cursor.item)
				end
				target_index := target_index + 1
				paragraphs_cursor.forth
			end
			paragraphs_i.item (target_index).append_string (right.string)					
		ensure
			new_count: count = old count + a_text.count - 1
		end

	append_text (a_text: TEXT; a_paragraph_index: INTEGER) is
			-- Append `a_text' to the paragraph with `a_paragraph_index'.
		require
			valid_paragraph_index: a_paragraph_index > 0 and a_paragraph_index <= count
			non_empty_text: not a_text.is_empty
		local
			paragraphs_cursor: DS_BILINEAR_CURSOR [STRING]	--| cursor on paragraphs of a_text
			estring: ESTRING
			target_index: INTEGER		--| index in Current target
		do
			from
				paragraphs_cursor := a_text.paragraphs.new_cursor
				paragraphs_cursor.start
				target_index := a_paragraph_index
				
				create estring.make_from_string (paragraphs_i.item (target_index))
				estring.string.append_string (paragraphs_cursor.item)
				paragraphs_cursor.forth
			until
				paragraphs_cursor.off
			loop
				if target_index < count then
					insert_paragraph (paragraphs_cursor.item, target_index + 1)
				else
					append_paragraph (paragraphs_cursor.item)
				end
				target_index := target_index + 1
				paragraphs_cursor.forth
			end
		ensure
			new_count: count = old count + a_text.count - 1
		end

	put_character (a_character: CHARACTER; a_text_position: TEXT_POSITION) is
			-- Replace character at `a_text_position' with  `a_character'.
		require
			valid_text_position: a_text_position /= Void and then valid_position (a_text_position)
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

	replace_all_string_with_text (a_string: STRING; a_text: TEXT) is
			-- Replace every occurence of `a_string' with ´a_text'.
		require
			a_string_not_empty: a_string /= Void and then not a_string.is_empty
			text_defined: a_text /= Void
		local
			string_position: TEXT_POSITION
			estring: ESTRING
		do
			from		
			until
				not has_string (a_string)
			loop
				string_position := first_position_of_string (a_string)
				--| remove a_string from Current
				create estring.make_from_string (paragraphs_i.item (string_position.paragraph_position))
				estring.remove_substring (string_position.character_position, string_position.character_position + a_string.count - 1)
				if not a_text.is_empty then
					--| insert or append a_text
					if valid_position (string_position) then
						insert_text (a_text, string_position)
					else
						append_text (a_text, string_position.paragraph_position)
					end
				end
			end
		end

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
		require
			valid_text_position: a_text_position /= Void and then valid_position (a_text_position)
			valid_character_position: a_text_position.character_position /= 0
		local
			first: ESTRING
			second: ESTRING	
		do
			create first.make_from_string (paragraphs_i.item (a_text_position.paragraph_position))
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
			valid_text_position: a_text_position /= Void and then valid_position (a_text_position)
			valid_character_position: a_text_position.character_position /= 0
		do
			paragraphs_i.item (a_text_position.paragraph_position).remove (a_text_position.character_position)
		ensure
			one_character_less: paragraphs_i.item (a_text_position.paragraph_position).count = old (paragraphs_i.item (a_text_position.paragraph_position).count) - 1	
		end

	wipe_out is
			-- Remove all paragraphs.
		do
			paragraphs_i.wipe_out
		ensure
			is_empty : is_empty
		end

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

	copy (other: like Current) is
			-- Reinitialize by copying the paragraphs of `other'.
			-- (This is also used by `clone'.)
		do
			if other /= Current then
				create paragraphs_i.make (other.count)
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
				create Result.make (paragraphs.count * 40)
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

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {TEXT} -- Implementation

	paragraphs_i: DS_ARRAYED_LIST [STRING]
			-- List of paragraphs, implemented as an array for an optimal access by indice.

invariant
	paragraphs /= Void

end -- class CLASS_TEMPLATE

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

--