indexing
	description: "Widgets that let you edit an object of type T in a single line of text"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.3 $"

deferred class
	ECTK_ENTRY [T]

inherit
	ECTK_EDITABLE [T]
		redefine
			initialize_widget, initialize,terminate, is_ready, is_editable
		end

feature {NONE} -- Initialization

	make (parent: CURSES_WINDOW; a_height, a_width, y, x: INTEGER) is
			-- Make with origin coordinates relative to parent.
		require
			window_exists: parent /= void;
			positive_size: a_width >= 0 and a_height >= 0;
			positive_origin: x >= 0 and y >= 0;
			inside_parent_size: parent.width >= a_width and parent.height >= a_height;
			width_in_parent: parent.width >= a_width + x;
			height_in_parent: parent.height >= a_height + y
		do
			!!string.make (a_width)
			!!window.make_subwindow_relative (parent, a_height, a_width, y, x)
			initialize_widget
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = a_width and then window.height = a_height;
			exists: window.exists
		end

	
feature -- Status report

	display_formatter: EFMT_FORMATTER [T]
			-- Data formatter used for displaying

	edit_formatter: EFMT_FORMATTER [T]
			-- Data Formatter used for editing.

	scanner: ESC_SCANNER [T]
			-- Data scanner.

	is_editable: BOOLEAN is
			-- Is the entry editable?
		do
			Result := Precursor and scanner /= Void
		ensure then
			Result implies (scanner /= Void)
		end

	is_ready: BOOLEAN is
			-- Is `Current' ready to handle events?
		do
			Result := Precursor and display_formatter /= Void and edit_formatter /= Void
		ensure then
			Result implies (display_formatter /= Void and edit_formatter /= Void)
		end

	is_full: BOOLEAN is
			-- Is entry full.
		do
			Result := string.count = window.width
		ensure
			full: Result = (string.count = window.width)
		end

	is_empty: BOOLEAN is
			-- Is entry empty.
		do
			Result := (string.count = 0)
		ensure
			Result = (string.count = 0)
		end

	is_first: BOOLEAN is
			-- Is the cursor on the first position of the entry?
		do
			Result := (cursor = 1)
		ensure
			Result = (cursor = 1)
		end 

	is_last: BOOLEAN is 
			-- Is the cursor on the last position of the entry?
		do
			Result := (cursor = cursor_last)
		ensure
			Result = (cursor = cursor_last)
		end

	is_cursor_within_string: BOOLEAN is
		do
			Result := cursor <= string.count
		ensure
			Result = (cursor <= string.count)
		end


feature -- Status setting

	define_display_formatter (a_formatter: EFMT_FORMATTER[T]) is
			-- Set display_formatter with `a_formattter'.
		require
			a_formatter_set: a_formatter /= Void
			within_width: a_formatter.width <= window.width
		do
			display_formatter := a_formatter
		ensure
			display_formatter_shared: display_formatter = a_formatter
		end

	define_edit_formatter (a_formatter: EFMT_FORMATTER[T]) is
			-- Set edit_formatter with `a_formattter'.
		require
			a_formatter_set: a_formatter /= Void
			within_width: a_formatter.width <= window.width
		do
			edit_formatter := a_formatter
		ensure
			edit_formatter_shared: edit_formatter = a_formatter
		end


	define_scanner (a_scanner: ESC_SCANNER[T]) is
			-- Set scanner with `a_scanner'.
		do
			scanner := a_scanner
		ensure
			scanner_shared: scanner = a_scanner
		end


feature -- Basic operations	

	update is
			-- Update entry.
		do
			if is_event_handler then
				format_for_edit
			else
				format_for_display
			end
		end
	
feature -- Cursor movement

	forth is
			-- Move cursor to the right.
		require
			not_is_cursor_last: not is_last
			is_ready: is_ready
		do
			cursor := cursor + 1
			refresh_cursor
		ensure
			new_cursor: cursor = old cursor + 1
		end

	back is
			-- Move cursor to the left.
		require
			not_is_cursor_first: not is_first
			is_ready: is_ready
		do
			cursor := cursor - 1
			refresh_cursor	
		ensure
			new_cursor: cursor = old cursor - 1
		end

	start is
			-- Move cursor to the first position.
		require
			is_ready: is_ready
		do
			cursor := 1
			refresh_cursor
		ensure
			cursor_on_first: cursor = 1
		end

	finish is
			-- Move cursor to the last position.
		require
			is_ready: is_ready
		do
			cursor := cursor_last
			refresh_cursor
		ensure
			cursor_on_last: cursor = cursor_last
		end

feature -- Element change

	put (a_character: CHARACTER) is
			-- Insert `a_character' at cursor.
		require
			not_full: not is_full or is_overwrite_mode
			is_ready: is_ready
		local
			estring: ESTRING
		do
			if cursor > string.count then
				string.append_character (a_character)
			else
				if (ectk_system.is_insert_mode) then
					!!estring.make_from_string (string)
					estring.insert_character (a_character, cursor)
				else
					string.put (a_character, cursor)
				end
			end
			if cursor < window.width then
				cursor := cursor + 1
			end
			is_modified := True
			refresh_with_string (string)
		ensure
			cursor: old cursor < window.width implies (cursor = old cursor + 1)
			new_count: ectk_system.is_insert_mode implies (string.count = old string.count + 1)
		end

feature -- Removal

	clear is
			-- Clear entry.
		require
			is_ready: is_ready
		do	
			cursor := 1
			string.wipe_out
			refresh_with_string (string)
		end

	remove is
			-- Remove character at current cursor.
		require
			is_cursor_within_string: is_cursor_within_string
			is_ready: is_ready
		do
			string.remove (cursor)
			is_modified := True
			refresh_with_string (string)
		ensure
			same_cursor: cursor = old cursor
			new_count: string.count = old string.count - 1;			
		end

	remove_left is
			-- Remove character to the left of the current cursor.
		require
			not_is_empty: not is_empty
			not_is_cursor_first: not is_first
			is_ready: is_ready
		do
			cursor := cursor - 1
			string.remove (cursor)
			is_modified := True
			refresh_with_string (string)				
		ensure
			new_cursor: cursor = old cursor - 1
			new_count: string.count = old string.count - 1;			
		end

feature {NONE} -- Implementation of Event handling
	
	initialize is
			-- Initialize event loop.
		do
			Precursor
			format_for_edit
			refresh_cursor
		end
	
	terminate is
			-- Terminate the event loop.
		do
			Precursor
			format_for_display
		end



feature {NONE} -- Implementation

	format_for_edit is
			-- Format entry data with edit_formatter.
		do
			edit_formatter.format (model_querist.item)
			string.copy (edit_formatter.last_formatted)
			refresh_with_string (string)
		end

	format_for_display is
			-- Format entry data with display_formatter.
		do
			display_formatter.format (model_querist.item)
			string.copy (display_formatter.last_formatted)
			refresh_with_string (string)
		end

	update_model is
			-- Update the model.
		do
			scanner.scan (string)
			if scanner.is_scanned then
				model_modifier.set_argument_1 (scanner.last_object)
				if model_modifier.check_precondition then
					model_modifier.execute	
					last_error := model_modifier.last_error
				else
					last_error := model_modifier.last_precondition_error
				end
			else
				last_error := scanner.error
			end
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_widget is
			-- Initialise widget.
		do
			Precursor
			cursor := 1
			window.set_current_background (ut_character_codes.Space_code + curses_attribute_constants.Attribute_reverse)
			window.apply_current_background
			window.enable_attribute (curses_attribute_constants.Attribute_reverse)
		end

	initialize_behaviour is
			-- Initialise behaviour.
		local
			epat_command: EPAT_COMMAND
		do

			!ECTK_ENTRY_PUT_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.character_event)

			!ECTK_ENTRY_REMOVE_LEFT_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.back_space_event)

			!ECTK_ENTRY_BACK_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.left_event)

			!ECTK_ENTRY_FORTH_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.right_event)

			!ECTK_ENTRY_REMOVE_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.delete_event)

			!ECTK_ENTRY_START_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.home_event)

			!ECTK_ENTRY_FINISH_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.end_event)
			
			!ECTK_WIDGET_CANCEL_COMMAND!epat_command.make (Current)
			add_command (epat_command, events_catalog.esc_event)

		end


feature {NONE} -- Implementation

	cursor_last: INTEGER is
			-- Cursor of rightmost valid position.
		do	
			Result := window.width.min (string.count + 1)
		ensure
			Result = (window.width.min (string.count + 1))
		end

	refresh_with_string (a_string: STRING) is
			-- Refresh window with a_string.
		do
			window.clear
			window.move (0,0)
			window.put_string (a_string)
			if cursor > cursor_last then
				cursor := cursor_last
			end
			refresh_cursor
		end

	refresh_cursor is
			-- Refresh cursor position
		do
			window.move (0, cursor - 1)
			window.memory_refresh	
		end


feature {NONE} -- Internal state

	string: STRING
			-- String actually contained by the widget.

	cursor: INTEGER
			-- Current cursor position in entry.
			

invariant
	string_within_width: string.count <= window.width
	cursor_within_range: cursor >= 1 and cursor <= cursor_last

end -- class ECTK_ENTRY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
