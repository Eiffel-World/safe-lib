indexing
	description: "Objects that represents a pair of positions, to locate a character within a paragraph"
			  	 "A character position within an empty paragraph equals 0"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/12 20:21:34 $";
	revision: "$Revision: 1.1 $";
	author: "Fafchamps Eric"

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
			strictly_positive_paragraph_position: a_paragraph_position > 0
			positive_character_position: a_character_position >= 0
		do
			set_paragraph_position (a_paragraph_position)
			set_character_position (a_character_position) 
		ensure
			paragraph_position_copied: paragraph_position = a_paragraph_position
			character_position_copied: character_position = a_character_position
		end

	make_last (a_text: TEXT) is
			-- Initialize with last position of `a_text'.
		require
			text_not_empty: a_text /= Void and then not a_text.is_empty
		do
			set_paragraph_position (a_text.count)
			set_character_position (a_text.paragraph (a_text.count).count)
		ensure
			paragraph_position: paragraph_position = a_text.count
			character_position: character_position = a_text.paragraph (a_text.count).count
		end

feature {NONE} -- Initialization

feature -- Access

	paragraph_position: INTEGER
			-- Position of paragraph.

	character_position: INTEGER
			-- Position of character.

feature -- Measurement

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current position before `other'?
		do
			Result := (paragraph_position < other.paragraph_position) 
				or ((paragraph_position = other.paragraph_position) and (character_position < other.character_position))
		end;

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_paragraph_position (a_paragraph_position: INTEGER) is
			-- Set paragraph_position with `a_paragraph_position'.
		require
			strictly_positive_paragraph_position: a_paragraph_position > 0
		do
			paragraph_position := a_paragraph_position
		ensure
			paragraph_position_copied: paragraph_position = a_paragraph_position
		end

	set_character_position (a_character_position: INTEGER) is
			-- Set character_position with `a_character_position'.
		require
			positive_character_position: a_character_position >= 0
		do
			character_position := a_character_position
		ensure
			character_position_copied: character_position = a_character_position
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	strictly_positive_paragraph_position: paragraph_position > 0
	positive_character_position: character_position >= 0

end -- class TEXT_POSITION

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
