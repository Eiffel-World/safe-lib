indexing
	description: "Objects that call the terminate_event_loop feature of ECTK_MAIN_WINDOW"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TERMINATE_COMMAND
inherit
	ECTK_COMMAND

creation
	make

feature {NONE} -- Initialization

	make (a_main_window: ECTK_MAIN_WINDOW) is
			-- Initialize with `a_main_window'.
		require
			a_main_window_defined: a_main_window /= Void
		do
			ectk_main_window := a_main_window
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			ectk_main_window.terminate_event_loop
		end

feature {NONE} -- Implementation

	ectk_main_window: ECTK_MAIN_WINDOW

end -- class ECTK_TERMINATE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
