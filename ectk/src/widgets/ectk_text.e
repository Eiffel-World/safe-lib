indexing
	description: "Widget that let you edit a TEXT optionally composed of multiple paragraphs"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/07 11:49:47 $"
	revision: "$Revision: 1.3 $"

class
	ECTK_TEXT

inherit
	ECTK_EDITABLE [TEXT]
		redefine
			initialize_widget, initialize, on_event
		end

creation
	make
		
feature {NONE} -- Initialization

	make (parent: CURSES_WINDOW; a_height, a_width, y, x: INTEGER) is
			-- Make with origin coordinates relative to parent.
		require
			window_exists: parent /= void;
			reasonable_size: a_width >= 2 and a_height >= 1;
			positive_origin: x >= 0 and y >= 0;
			inside_parent_size: parent.width >= a_width and parent.height >= a_height;
			width_in_parent: parent.width >= a_width + x;
			height_in_parent: parent.height >= a_height + y
		do
			!!window.make_subwindow_relative (parent, a_height, a_width, y, x)
			initialize_widget
			refresh_from_row (0)
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = a_width and then window.height = a_height;
			exists: window.exists
		end

feature -- Status report

	after_text: BOOLEAN is
			-- Is there no valid position after the cursor in the text?
		do
			if text.is_empty or (first_visible_row + cursor_position.y > map.count) then
				Result := True
			else
				Result := text_position > text.last_position
			end		 				
		end

	after_paragraph: BOOLEAN is
			-- Is there no valid position after the cursor in the paragraph?
		do
			if text.is_empty  or else text_paragraph.count = 0 then
				Result := True
			else
				Result := text_position.character_position > text_paragraph.count
			end 
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		do
			if text.is_empty then
				Result := True
			else
				if (first_visible_row + cursor_position.y <= map.count) then
					Result := (text_position.paragraph_position = 1) and (text_position.character_position <= 1)
				else
					Result := False
				end
			end
		end

feature -- Basic operations	

	refresh is
			-- Refresh with current model.
		local
			a_text_position: TEXT_POSITION
			a_length: INTEGER
		do
			text.copy (model_querist.item)
			initialize_map
			
			--| Restore cursor on first if current position is invalid now
			if  first_visible_row + cursor_position.y > map.count then
				!!cursor_position.make_origin
				first_visible_row := 1
			else
				a_text_position := map.item (first_visible_row + cursor_position.y)
				a_length := text.paragraph (a_text_position.paragraph_position).count - a_text_position.character_position + 1
				if cursor_position.x > a_length - 1 then					
					!!cursor_position.make_origin
					first_visible_row := 1
				end
			end
			
			refresh_from_row (0)
		end

feature -- Cursor movement

	start is
			-- Move cursor to the first position.
		do
			first_visible_row := 1
			cursor_position.set_y (0)
			cursor_position.set_x (0)
			refresh_from_row (0)
		end

	finish is
			-- Move cursor to the last position.
		do
			if text.is_empty then
				first_visible_row := 1
				cursor_position.set_y (0)
				cursor_position.set_x (0)
			else
				cursor_position.set_x (0)
				if map.count <= window.height then
					first_visible_row := 1
				else
					first_visible_row := map.count - window.height + 1
				end
				cursor_position.set_y (map.count - first_visible_row )
				cursor_position.set_x (last_valid_x)
			end
			refresh_from_row (0)
		end


	back is
			-- Move cursor to the prior character.
		require
			not_before: not before
		do
			if cursor_position.x = 0 then
				if cursor_position.is_origin then
					scroll_down
					cursor_position.set_x (last_valid_x)
				else
					cursor_position.set_y (cursor_position.y - 1)
					cursor_position.set_x (last_valid_x)
				end
			else
				cursor_position.set_x (cursor_position.x - 1)
			end
			refresh_cursor
		end

	forth is
			-- Move cursor forth.
		require
			not_after_text: not after_text
		do
			
			if after_paragraph or (cursor_position.x = window.width - 1)  then
				if cursor_position.y = window.height -1 then
					scroll_up
					cursor_position.set_x (0)
				else
					cursor_position.set_x (0)
					cursor_position.set_y (cursor_position.y + 1)
				end
			else
				cursor_position.set_x (cursor_position.x + 1)
			end
			refresh_cursor
		end

feature -- Element change	

	put (a_character: CHARACTER) is
			-- Put's `a_character' at cursor.
		local
			an_empty_paragraph: STRING
		do
			if ectk_system.is_overwrite_mode and not after_paragraph then
				text.put_character (a_character, text_position)
				refresh_from_row (0)			
			else

				if text.is_empty then
					!!an_empty_paragraph.make (80) 
					text.append_paragraph (an_empty_paragraph)
					initialize_map
				end
				if text_position.character_position >= text_paragraph.count	then
					text.append_character (a_character, text_position.paragraph_position)
				else
					text.insert_character (a_character, text_position)
				end
				initialize_map
				refresh_from_row (0)
				if cursor_position.x = window.width - 1 then
					forth --| skip last column
				end
			end
			forth
			is_modified := True
		end

	new_paragraph is
			-- Inserts a new paragraph at cursor.
		local
			a_new_paragraph: STRING
		do	
			if text.is_empty then
				!!a_new_paragraph.make (80) 
				text.append_paragraph (a_new_paragraph)
			else
				if after_paragraph then
					!!a_new_paragraph.make (80)
					if text_position.paragraph_position = text.count then
						text.append_paragraph (a_new_paragraph)
					else
						text.insert_paragraph (a_new_paragraph, text_position.paragraph_position + 1)
					end
				else
					text.split_paragraph (text_position)
				end
			end
			initialize_map
			refresh_from_row (0)
			forth
			is_modified := True
		end

feature -- Removal

	remove_at is
			-- Remove item at cursor position.
		require
			not_after_text: not after_text	
		do
			if after_paragraph then
				if text_paragraph.count = 0  then
					text.remove_paragraph (text_position.paragraph_position)
				else
					text.join_next_paragraph (text_position.paragraph_position)
				end
			else
				text.remove_character (text_position)
			end
			is_modified := True
			initialize_map
			refresh_from_row (0)
		end

	remove_left is
			-- Remove item to left of cursor position.
		require
			not_before: not before
		do
			back
			if not after_text then
				remove_at
			end
		end	

feature {NONE} -- Implementation

	last_valid_x: INTEGER is
			-- Last valid x coordinate of cursor within current row.
		do
			if text.is_empty or (first_visible_row + cursor_position.y > map.count) then
				Result := 0
			else
				if text_paragraph.count = 0 then
					Result := 0
				else
					Result := (window.width - 1).min (text_paragraph.count - text_position.character_position + 1)
				end
			end
		end

	cursor_position: ECTK_POSITION
			-- Position of cursor within window.

	text_position: TEXT_POSITION is
			-- Text position corresponding to cursor_position.
		require
			not_text_is_empty: not text.is_empty 
			mapped: first_visible_row + cursor_position.y <= map.count
		do
			Result := clone (map.item (first_visible_row + cursor_position.y))
			Result.set_character_position (Result.character_position + cursor_position.x)
		end

	text_paragraph: STRING is
			-- paragraph within text corresponding to cursor_position.
		require 
			not_text_is_empty: not text.is_empty
		do
			Result := text.paragraph (map.item (first_visible_row + cursor_position.y).paragraph_position)
		end

	first_visible_row: INTEGER
			-- First visible row in map. 

	lower_right_position: ECTK_POSITION is
			-- Position of lower right corner of window.
		do
			!!Result.make_lower_right_corner (window)
		end

feature {NONE} -- Implementation of Event handling
	
	initialize is
			-- Initialize event loop.
		do
			Precursor
			refresh
			window.memory_refresh
			window.do_update
		end
	
	on_event is
			-- Process the last event.
		do
			Precursor
			window.do_update
		end;

feature {NONE} -- Implementation

	update_model is
			-- Update the model.
		do
			model_modifier.set_argument_1 (clone (text))
			model_modifier.check_precondition
			if model_modifier.last_precondition_error = Void then
				model_modifier.execute	
				last_error := model_modifier.last_error
			else
				last_error := model_modifier.last_precondition_error
			end			
		end

	initialize_map is
			--| Initialize map for the contents of the text attribute.
		local
			row: INTEGER
			paragraph: STRING
			character_position: INTEGER
			index: INTEGER
			a_text_position: TEXT_POSITION
		do
			!!map.make (text.count // window.width)

			row := 0

			--| Iterate on the paragraphs of the text
			from
				text.paragraphs.start
				index := 1	
			until
				text.paragraphs.off
			loop
				paragraph := text.paragraphs.item_for_iteration
				if paragraph.count = 0 then
					!!a_text_position.make (index, 0)
					row := row + 1
					map.force (a_text_position, row)
				else
					--| Iterate on the characters of the paragraph
					from
						character_position := 1
					until
						character_position > paragraph.count
					loop
						!!a_text_position.make (index, character_position)
						row := row + 1
						map.force (a_text_position, row)
						character_position := character_position + window.width - 1
					end
				end	
				text.paragraphs.forth
				index := index + 1
			end
		end

	refresh_from_row (a_row_coordinate: INTEGER) is
			--| Refresh the textview from `a_row_coordinate' to the last visible row.
		require
			within_height: a_row_coordinate >= 0 and a_row_coordinate < window.height
		local
			x,y: INTEGER
			paragraph: STRING
			character_position: INTEGER
		do
			y := a_row_coordinate

			window.move (y, 0)
			window.clear_to_bottom

			if map.valid_index (first_visible_row + y) then
				-- Iterate on visible part
				from
					map.go_i_th (first_visible_row + y)
				until
					(y = window.height) or map.off
				loop
					paragraph := text.paragraph (map.item_for_iteration.paragraph_position)
					character_position := map.item_for_iteration.character_position
	
					if paragraph.count /= 0 then 
						-- Iterate on characters of the paragraph
						from
							x := 0
							window.move (y, x)
						until
							(x = window.width - 1) or (character_position > paragraph.count)	
						loop
							window.put_character (paragraph.item (character_position))
							character_position := character_position + 1
							x := x + 1	
						end
					end
					y := y + 1
					map.forth
				end
			end

			refresh_cursor
		end

	scroll_up is
			-- Scroll text one paragraph up in window.
		do
			first_visible_row := first_visible_row + 1
			refresh_from_row (0)
		end
	
	scroll_down is
			-- Scroll text 1 paragraph down
		do
			first_visible_row := first_visible_row - 1
			refresh_from_row (0)			
		end

	refresh_cursor is
			--| Refresh window cursor with cursor position.
		do
			window.move (cursor_position.y, cursor_position.x)
			window.memory_refresh
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_widget is
			-- Initialise widget.
		do
			Precursor
			window.set_current_background (ut_character_codes.Space_code + curses_attribute_constants.Attribute_reverse)
			window.apply_current_background
			window.enable_attribute (curses_attribute_constants.Attribute_reverse)
			!!text.make (20)
			!!cursor_position.make_origin
			first_visible_row := 1
			initialize_map
		end

	initialize_behaviour is
			-- Initialise behaviour.
		local
			ectk_conditional_command: ECTK_CONDITIONAL_COMMAND
			emi_command: EMI_COMMAND [ECTK_TEXT]
			widget_emi_command: EMI_COMMAND [ECTK_WIDGET]
			emi_cell: EMI_CELL [ECTK_TEXT]
		do

			!!emi_cell
			emi_cell.define (Current)

			!ECTK_TEXT_PUT_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.character_event)

			!ECTK_TEXT_REMOVE_LEFT_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.back_space_event)

			!ECTK_TEXT_BACK_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.left_event)

			!ECTK_TEXT_FORTH_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.right_event)

			!ECTK_TEXT_NEW_PARAGRAPH_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.carriage_return_event)

			!ECTK_TEXT_REMOVE_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.delete_event)

			!ECTK_TEXT_START_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.home_event)

			!ECTK_TEXT_FINISH_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.end_event)
			
			!ECTK_WIDGET_CANCEL_COMMAND!widget_emi_command.make (emi_cell)
			!!ectk_conditional_command.make (widget_emi_command)
			add_command (ectk_conditional_command, events_catalog.esc_event)
		end

feature {NONE} -- Internal state

	text: TEXT
			-- Text of the widget.

	map: DS_ARRAYED_LIST [TEXT_POSITION]
			-- Maps the first column of each row on a position within the text.

invariant
	cursor_position_exists: cursor_position /= Void
	text_exists: text /= Void
	map_exists: map /= Void

end -- class ECTK_TEXT

--| association between text cursor/window cursor and events
--| 
--|	text cursor		window cursor
--|  	-----------		-------------
--|	before		first			
--|	first			second
--|	...
--|	last			last + 1
--|	


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
