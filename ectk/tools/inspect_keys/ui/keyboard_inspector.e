indexing
	description: "Objects that let you inspect the keyboard"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:53:45 $"
	revision: "$Revision: 1.2 $"

class
	KEYBOARD_INSPECTOR

inherit
	ECTK_MAIN_WINDOW
		redefine
			initialize_widget, on_event, initialize_behaviour
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

	initialize_child_widgets is
			-- Initialise child widgets.
		do
		end
		
	initialize_behaviour is
			-- Initialise behaviour.
		local
			ectk_terminate_command: ECTK_TERMINATE_COMMAND
		do
			!!ectk_terminate_command.make (Current)
			add_command (ectk_terminate_command, events_catalog.home_event)
		end

	initialize_child_widgets_behaviour is
			-- Initialise child widgets behaviour.
		do
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
			window.put_string (window.curses.key_name (window.last_key))
		end

end -- class KEYBOARD_INSPECTOR


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
