indexing
	description: "System's root class";
	note: "Initial version automatically generated"

class
	SCAN_TEST

creation

	make

feature -- Initialization

	make is
		local
			text_scanner: ESC_TEXT_SCANNER
			text: TEXT
		do
			!!text_scanner.make
			text_scanner.scan ("%N%N")
			text := text_scanner.last_text
			io.read_line
			
		end;

end -- class SCAN_TEST


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--