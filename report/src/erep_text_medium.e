indexing
	description: "Objects that can output characters in a TEXT object"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/26 11:03:29 $"
	revision: "$Revision: 1.1 $"

class
	EREP_TEXT_MEDIUM

inherit
	EREP_OUTPUT_MEDIUM

creation	
	make

feature {NONE} -- Initialization

	make (a_text: TEXT) is
			-- Initialize with `a_text'.
		require
			text_defined: a_text /= Void
		do
			text := a_text
		ensure
			shared_text: text = a_text
		end

feature -- Access
	
	name: STRING is
			-- Medium name
		do
			Result := text.generator
		end

	text: TEXT
			-- Text to write

feature -- Element change

	put_new_line is
			-- Write a new line character to medium
		local
			a_paragraph: STRING
		do
			!!a_paragraph.make (80)
			text.append_paragraph (a_paragraph)
		end;

	put_string (a_string: STRING) is
			-- Write `a_string' to medium.
		do
			if text.is_empty then
				text.append_paragraph (a_string)
			else
				text.last_paragraph.append_string (a_string)
			end	
		end;

	put_character (a_character: CHARACTER) is
			-- Write `a_character' to medium.
		do
			if text.is_empty then
				text.append_character (a_character, text.count)
			else
				text.last_paragraph.append_character (a_character)
			end				
		end;

feature -- Status report

	is_open_write: BOOLEAN is
			-- Is this medium opened for output
		do
			Result := not is_closed
		end

	is_closed: BOOLEAN is
			-- Is the I/O medium open
		do
			result := closed_i
		end;

feature -- Status setting

	open_write is
			-- Open medium for write.
		require
			not_is_open_write: not is_open_write
		do
			closed_i := False
		end			

	close is
			-- Close medium.
		do
			closed_i := True
		end;

feature {NONE} -- Implementation

	closed_i: BOOLEAN
			-- Internal status.
			
end -- class EREP_TEXT_MEDIUM


--
-- Copyright: 2001, Paul G. Crismer, Eric Fafchamps
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
