indexing
	description: "Objects that represents a pair of positions, to locate a character within a paragraph"
			  "A character position within an empty paragraph equals 0"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 11:08:46 $"
	revision: "$Revision: 1.1 $"

class
	TEXT_POSITION
inherit
	COMPARABLE

creation
	make, make_last

feature {NONE} -- Initialization

	make (a_paragraph_position, a_character_position: INTEGER) is
			-- Initialize with `a_paragraph_position' and `a_character_position'.
		require
			strict_positif_paragraph_position: a_paragraph_position > 0
			positif_character_position: a_character_position >= 0
		do
			def_paragraph_position (a_paragraph_position)
			def_character_position (a_character_position) 
		ensure
			paragraph_position_copied: paragraph_position = a_paragraph_position
			character_position_copied: character_position = a_character_position
		end


	make_last (a_text: TEXT) is
			-- Initialize with last position of `a_text'.
		require
			text_not_empty: a_text /= Void and then not a_text.is_empty
		do
			def_paragraph_position (a_text.count)
			def_character_position (a_text.paragraph (a_text.count).count)
		ensure
			paragraph_position: paragraph_position = a_text.count
			character_position: character_position = a_text.paragraph (a_text.count).count
		end

feature -- Access

	paragraph_position: INTEGER
			-- Position of paragraph.

	character_position: INTEGER
			-- Position of character.

feature -- Element change

	def_paragraph_position (a_paragraph_position: INTEGER) is
			-- Define paragraph_position with `a_paragraph_position'.
		require
			strict_positif_paragraph_position: a_paragraph_position > 0
		do
			paragraph_position := a_paragraph_position
		ensure
			paragraph_position_copied: paragraph_position = a_paragraph_position
		end

	def_character_position (a_character_position: INTEGER) is
			-- Define character_position with `a_character_position'.
		require
			positif_character_position: a_character_position >= 0
		do
			character_position := a_character_position
		ensure
			character_position_copied: character_position = a_character_position
		end
	

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current position before `other'?
		do
			Result := (paragraph_position < other.paragraph_position) 
				or ((paragraph_position = other.paragraph_position) and (character_position < other.character_position))
		end;
	

invariant
	strict_positif_paragraph_position: paragraph_position > 0
	positif_character_position: character_position >= 0

end -- class TEXT_POSITION


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--