indexing
	description: "System's root class";
	note: "Initial version automatically generated"

class
	TEXT_TEST

creation

	make

feature -- Initialization

	make is
		local
			text_scanner: ESC_TEXT_SCANNER
			text1, text2: TEXT
		do
			!!text_scanner.make
			text_scanner.scan ("ligne1%Nligne2%N")
			text1 := text_scanner.last_text
	
			!!text2.make
			text2.copy (text1)
			refresh_with_text (text2)
			io.read_line	
		end;

	refresh_with_text (a_text: TEXT) is
			-- Refresh window with a_text.
		local
			line: INTEGER
			column: INTEGER
			c: CHARACTER
		do
			from
				line := 1
				column := 1
				a_text.start	
			until
				a_text.off
			loop
				if not a_text.is_empty_line then
				--	window.put_character (a_text.item)
					c := a_text.item
				end
				if a_text.is_last_of_line then
					line := line + 1
					column := 1
				end
				a_text.forth
			end
			
			--refresh_cursor
		end

end -- class SCAN_TEST

