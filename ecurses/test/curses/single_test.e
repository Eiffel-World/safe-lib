indexing
	description: "Abstract class for a single test";
	date: "$Date: 2000/01/07 11:33:32 $";
	revision: "$Revision: 1.1 $"

deferred class 
	SINGLE_TEST
inherit
	SHARED_CURSES_SYSTEM
		export
			{NONE}
				all
		end;

	CURSES_TEST_SUPPORT
		export
			{NONE}
				all
		end;
		
	CURSES_ERROR_HANDLING
		export {NONE} all
		end

feature {NONE} -- Initialisation

	make_from_window (a_window: CURSES_WINDOW) is
			-- Make from 'a_window, 'a_window will be used for the test.
		do
			window := a_window
		end

feature -- Acces

	window: CURSES_WINDOW
			-- Window.


feature -- Commands

	execute is
			-- Execute the test
		deferred			
		end


end -- class SINGLE_TEST
-----------------------------------------------------------
-- Copyright (C) 1999 Paul G. Crismer, Eric Fafchamps
-- Licensed under Eiffel Forum Freeware License, version 1
-- (see forum.txt)
-----------------------------------------------------------
