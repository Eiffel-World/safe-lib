indexing
	description: "Objects that let you inspect the keyboard"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:18:35 $"
	revision: "$Revision: 1.1 $"

class
	KEYBOARD_INSPECTOR

inherit
	ECTK_WIDGET
		redefine
			initialize_widget,
			on_event
		end
		
creation
	make

feature{NONE} -- Initialization

	make  is
			-- Initialize
		do
			!!window.make (24, 80, 0, 0)
			initialize_widget
		end

	initialize_widget is
			-- Initialise widget.
		do
			Precursor
			window.move (12, 20); 
			window.put_string ("Press a key (<Home> to quit)")			
		end

	initialize_behaviour is
			-- Initialise behaviour.
		local
			ectk_terminate_command: ECTK_TERMINATE_COMMAND
		do
			!!ectk_terminate_command.make (Current)
			add_action (events_catalog.home_event, ectk_terminate_command)
		end

feature -- Element change

	update_model_with_widget is
			-- Update model with widget.
		do
		end

	update_widget_with_model is
			-- Update widget with model.
		do
		end

feature -- Status report

	is_model_updateable_with_widget: BOOLEAN is
			-- Is model updateable with widget?
		do
			Result := False
		end

	is_widget_updateable_with_model: BOOLEAN is
			-- Is widget updateable with model?
		do
			Result := False
		end
		
feature {NONE} -- Event loop

	on_event is
			-- Process the last event.
		do
			Precursor
			if not last_event.is_processed then
				inspect_event
				last_event.set_processed
			end				
		end


	inspect_event is
			-- Inspect last event
		do
			window.move (13,0)
			window.clear_to_end
			window.move (13,0)
			window.put_string ("Key code : ")
			window.put_string (window.last_key.out)
			window.move (14,0)
			window.clear_to_end
			window.move (14,0) 
			window.put_string("Key name : ")
			window.put_string (curses.key_name (window.last_key))
		end

end -- class KEYBOARD_INSPECTOR


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
