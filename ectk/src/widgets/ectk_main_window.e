indexing
	description: "Top level windows that can hold several widgets, they are modal and can overlap"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.3 $"

deferred class
	ECTK_MAIN_WINDOW

inherit
	ECTK_CONTAINER [ECTK_WIDGET]
		redefine
			window, exit_condition, terminate, initialize
		end
		
feature -- Access

	window: CURSES_PANEL
			-- Window in which input/output occurs.

feature -- Status report

	is_editable: BOOLEAN is
			-- Is `Current' editable?
		do
			Result := True
		ensure then
			Result = True
		end

feature {NONE} -- Implementation of Event handling

	exit_condition : BOOLEAN is
			-- Has the exit condition been met ?
		do
			Result := last_event.is_equal (events_catalog.terminate_event)
		end

	initialize is
			-- initialize event loop
		do
			update
			window.refresh --| needed to reflect new desk of panels
			Precursor
		end;


	terminate is
			-- terminate event loop
		do
			Precursor
			--| Hide is needed because otherwise current remains above until dispose 
			--| and the underlying PANEL isn't updated
			--| Close can't be used since the client may perform queries on current after event loop.
			window.hide
			window.refresh			
		end

end -- class ECTK_MAIN_WINDOW

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
