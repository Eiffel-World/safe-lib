indexing
	description: "Widget for a binary value"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/21 08:26:15 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_CHECK_BOX
	
inherit
	ECTK_EDITABLE [BOOLEAN]
		redefine
			initialize
		end
		
creation
	make

feature {NONE} -- Initialisation

	make (parent: CURSES_WINDOW; y, x: INTEGER) is
			-- Make with origin coordinates relative to parent.
		require
			window_exists: parent /= void;
			positive_origin: x >= 0 and y >= 0;
			width_in_parent: parent.width > x;
			height_in_parent: parent.height > y
		do
			!!window.make_subwindow_relative (parent, 1, 1, y, x)
			initialize_widget
			is_checked := False
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = 1 and then window.height = 1;
			exists: window.exists
			not_is_checked: not is_checked
		end
	
feature	-- Status report

	is_checked: BOOLEAN
			-- Is current checked?
	
feature -- Basic operations

	refresh is
			-- Refresh current widget.
		do
			if is_checked then
				window.move (0, 0)
				window.put_character ('V')
			else
				window.move (0, 0)
				window.put_character ('O')
			end
			window.memory_refresh
		end

	toggle is
			-- Toggle the state.
		do
			is_checked := not is_checked	
		ensure
			is_checked = not (old is_checked)
		end
		

feature {NONE} -- Implementation of Event handling
	
	initialize is
			-- Initialize event loop.
		do
			Precursor
			is_checked := model_querist.item	
			refresh_cursor
			refresh
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_behaviour is
			-- Initialise behaviour.
		local
			ectk_command: ECTK_COMMAND
		do
			!ECTK_CHECK_BOX_TOGGLE_COMMAND!ectk_command.make (Current)
			add_command (ectk_command, events_catalog.character_event)
		end

feature {NONE} -- Implementation

	update_model is
			-- Update the model.
		do
			model_modifier.set_argument_1 (is_checked)
			model_modifier.check_precondition
			if model_modifier.last_precondition_error = Void then
				model_modifier.execute
				last_error := model_modifier.last_error
			else
				last_error := model_modifier.last_precondition_error
			end
		end

	refresh_cursor is
			-- Refresh current cursor position.
		do
			window.move (0,0)
			window.memory_refresh
		end

			
end -- class ECTK_CHECK_BOX

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
