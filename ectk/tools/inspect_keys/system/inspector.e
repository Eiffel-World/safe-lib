indexing
	description: "Ectk tool inspector"
	version: "$Revision: 1.1 $"
	date:	"$Date: 2001/09/15 07:17:35 $"
	Author: "Fafchamps Eric"
class
	INSPECTOR

inherit
	ECTK_APPLICATION

creation
	make

feature
	make is
			-- Initialize.			
		do
			initialize
			curses.disable_cr_nl_translation
			curses.enable_character_reading_mode
			if curses.has_colors then
				curses.use_colors
			end

			from						
				!!keyboard_inspector.make
			until
				keyboard_inspector.last_event.is_equal (events_catalog.terminate_event)
			loop
				keyboard_inspector.do_events
			end			
		end

feature {NONE} -- Implementation

	keyboard_inspector: KEYBOARD_INSPECTOR

end -- class INSPECTOR
	

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
