indexing
	description: "Command to terminate the event loop of a widget"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/21 08:26:15 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_WIDGET_TERMINATE_EVENT_LOOP_COMMAND

inherit
	ECTK_COMMAND

creation
	make

feature {NONE} -- Initialization

	make (a_widget: ECTK_WIDGET) is
			-- Initialize with `a_widget'.
		require
			widget_exists: a_widget /= Void
		do
			widget := a_widget
		end
		
	
feature -- Basic operation

	execute is
			-- Execute command.
		do
			widget.terminate_event_loop
		end

feature {NONE} -- Implementation

	widget: ECTK_WIDGET
	
end -- class ECTK_WIDGET_TERMINATE_EVENT_LOOP_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
