indexing
	description: "Objects that shows a message and waits for a single character hit from the user"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:15:23 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_MESSAGE

inherit
	ECTK_MAIN_WINDOW
		redefine
			exit_condition
		end
	
creation
	make

feature {NONE} -- Initialisation

	make (a_message: STRING) is
			-- Initialize with `a_message'
		local
			text: ESTRING
			lines: ARRAY[ESTRING]
			a_height: INTEGER
			a_width: INTEGER
			y: INTEGER
			x: INTEGER
			i: INTEGER
		do
			a_width := 30
			!!text.make_from_string (a_message)
			lines := text.word_wrapped (a_width - 2)
			a_height := lines.count + 2
			y := 25 - (a_height // 2)
			x := 40 - (a_width // 2)
			!!window.make ( a_height, a_width, y, x)
			window.set_standard_border
			from
				i := lines.lower
				y := 1
			until
				i > lines.upper 	
			loop
				window.move (y ,1)
				window.put_string (lines.item (i).string)
				i := i + 1
				y := y + 1
			end
			initialize_widget
			do_events
			choice := window.last_character
		end

feature -- Access

	choice: CHARACTER
			-- User's choice

feature {NONE} -- Implementation of Event handling


	exit_condition: BOOLEAN is
			-- Has the exit condition been met ?
		do
			Result := not last_event.is_equal (events_catalog.idle_event)
		end;


feature {NONE} -- Implementation of initialization and behaviour


	initialize_child_widgets is
			-- Initialise child widgets.
		do
		end

	initialize_child_widgets_behaviour is
			-- Initialise behaviour of child widgets.
		do
		end

feature {NONE} -- Implementation.

	curses_error_handling: CURSES_ERROR_HANDLING is
		once
			!!Result
		end

end -- class ECTK_MESSAGE

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
