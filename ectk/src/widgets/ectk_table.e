indexing
	description: "Containers of rows, Widget on a DS_BILINKED_LIST_CURSOR [T], items of list are instances of ECTK_ROW, ends with a footer provided by a footer_querist"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:15:23 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TABLE [T]

inherit
	ECTK_CONTAINER [ECTK_ROW]
		rename
			item as row,
			children as rows
		redefine
			initialize_behaviour, refresh, start, forth, back, is_last, is_first, off, is_ready
		end			

creation
	make

feature {NONE} -- Initialization

	make (parent: CURSES_WINDOW; a_height, a_width, y, x: INTEGER) is
			-- Make with origin coordinates relative to parent and for entry_widths.
		require
			window_exists: parent /= void;
			positive_size: a_width >= 0 and a_height >= 0;
			positive_origin: x >= 0 and y >= 0;
			inside_parent_size: parent.width >= a_width and parent.height >= a_height;
			width_in_parent: parent.width >= a_width + x;
			height_in_parent: parent.height >= a_height + y
		do
			row_scroll
			!!window.make_subwindow_relative (parent, a_height, a_width, y, x)
			initialize_widget
			window.memory_refresh
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = a_width and then window.height = a_height;
			exists: window.exists
			is_row_scrolled: is_row_scrolled
		end


feature -- Access

	model: T is
			-- Current model.
		require 
			not_off: not off
		do
			Result := model_querist.item.item
		end

feature -- Status report

	is_editable: BOOLEAN is
			 -- Is `Current' editable?
		do
			Result := True
		ensure then
			Result = True
		end

	is_last: BOOLEAN is
			-- Is current row the last row where it's model is updateable?
		do
			Result := model_querist.item.is_last
		end

	is_row_scrolled: BOOLEAN
			-- Is the row the scrolling unit?

	is_table_scrolled: BOOLEAN is
			-- Is the table the scrolling unit?
		do
			Result := not is_row_scrolled
		end

	is_first: BOOLEAN is 
			-- Is current row the first row where it's model is updateable?
		do
			Result := model_querist.item.is_first
		end

	off: BOOLEAN is
			-- Is there no current row?
		do
			Result := model_querist.item.off
		end

	is_ready: BOOLEAN is
			-- Is `Current' ready to handle events?
		do
			Result := Precursor and model_querist /= Void
		ensure then
			Result implies (model_querist /= Void)
		end

	is_model_extendible: BOOLEAN is
			-- Is model extendible:
		do
			Result := (item_factory /= Void)
		ensure
			Result = (item_factory /= Void)
		end

	item_factory: EMI_FACTORY[T]
			-- Factory for new items of type T.

	footer_querist: EMI_REFERENCE[ARRAY [STRING]]
			-- Querist for the strings that should be displayed after the last model items.


	model_querist: EMI_REFERENCE[DS_BILINKED_LIST_CURSOR[T]]
			-- Model querist.


feature -- Status setting

	define_model_querist (a_querist: EMI_REFERENCE[DS_BILINKED_LIST_CURSOR[T]]) is
			-- Define model querist with `a_querist'.
		require
			a_querist_exists: a_querist /= Void
		do
			model_querist := a_querist
		ensure
			querist_defined: model_querist = a_querist
		end	

	define_footer_querist (a_querist: EMI_REFERENCE[ARRAY[STRING]]) is
			-- Define footer querist with `a_querist'.
		require
			a_querist_exists: a_querist /= Void
		do
			footer_querist := a_querist
		ensure
			querist_defined: footer_querist = a_querist
		end

	define_item_factory (an_item_factory: EMI_FACTORY[T]) is
		require
			an_item_factory_exists: an_item_factory /= Void
		do
			item_factory := an_item_factory
		ensure
			factory_defined: item_factory = an_item_factory
		end

	row_scroll is
			-- Scroll by row.
		do
			is_row_scrolled := True
		ensure
			is_row_scrolled: is_row_scrolled
		end

	table_scroll is
			-- Scroll by table height.
		do
			is_row_scrolled := False
		ensure
			is_table_scrolled: is_table_scrolled
		end

		
feature -- Basic operations	

	refresh is
			-- Refresh widget with model.	
		local
			focus_index: INTEGER
			model_offset: INTEGER
			terminate_loop: BOOLEAN
			footer_strings: ARRAY [STRING]
			i: INTEGER
		do

			if rows.off or model_querist.item.off then
				model_querist.item.start
				rows.start
			end

			model_offset := 0
			focus_index := rows.index

			-- Go to first child and search corresponding model item
			from
			until
				rows.is_first
			loop
				rows.back
				model_querist.item.back
				model_offset := model_offset - 1
			end

			-- Update model items
			if not model_querist.item.container.is_empty  then
				from
					terminate_loop := False
				until
					terminate_loop
				loop
					rows.item_for_iteration.refresh
	
					if rows.is_last or model_querist.item.is_last then
						terminate_loop := True
					else
						rows.forth
						model_querist.item.forth
						model_offset := model_offset + 1
					end	
				end
			else
				rows.item_for_iteration.window.clear
				rows.item_for_iteration.window.memory_refresh
			end		

			if footer_querist /= Void then
				footer_strings := footer_querist.item
				if footer_strings /= Void then
					--| Fill remaining rows with footer text
					from
						i := footer_strings.lower 
					until
						rows.is_last or i > footer_strings.upper
					loop
						rows.forth
						rows.item_for_iteration.update_widget_with_string (footer_strings.item (i))
						i := i + 1
					end
				end
			end
			
			--| Clear remaining rows
			from
			until
				rows.is_last	
			loop
				rows.forth
				rows.item_for_iteration.window.clear
				rows.item_for_iteration.window.memory_refresh

			end
	
			--| Restore original focus on widget and model 
			rows.go_i_th (focus_index)
			from
			until
				model_offset = 0
			loop
				if model_offset < 0 then
					model_querist.item.forth
					model_offset := model_offset + 1
				else
					model_querist.item.back
					model_offset := model_offset - 1
				end
			end

			window.memory_refresh
		end

feature -- Cursor movement

	start is
			-- Move to the first row.
		do
			rows.start
			model_querist.item.start
			refresh
		end

	forth is
			-- Move to the first child of the row below the current row.
		do		
			model_querist.item.forth
			if not rows.is_last then
				rows.forth
			else
				if is_table_scrolled then
					rows.start
				end
				refresh
			end
			rows.item_for_iteration.start
		ensure then
			-- row_index = old row_index + 1
			-- item_index = first_index
		end

	down is
			-- Move to the child of the row below the current current row.
		local
			index_of_row: INTEGER
		do
			if not rows.item_for_iteration.off then
				index_of_row := rows.item_for_iteration.index
				forth
				rows.item_for_iteration.go_i_th (index_of_row)										
			else
				forth
			end
		ensure then
			-- row_index= old row_index + 1
			-- item_index = old item_index
		end


	back is
			-- Move to the last child of the row above the current row.
		do
			model_querist.item.back
			if not rows.is_first then
				rows.back
			else
				if is_table_scrolled then
					rows.finish
				end
				refresh
			end
			rows.item_for_iteration.finish
		ensure then
			-- row_index= old row_index - 1
			-- item_index = last_index
		end

	up is
			-- Move to the child of the row above the current row.
		require
			not_is_first: not off and then not is_first
		local
			index_of_row: INTEGER
		do
			if not rows.item_for_iteration.off then
				index_of_row := rows.item_for_iteration.index
				back
				rows.item_for_iteration.go_i_th (index_of_row)							
			else
				back
			end
		ensure
			-- row_index= old row_index - 1
			-- item_index = old item_index
		end				

feature -- Element change

	put_after  (an_item: T) is
			-- Add `an_item' after cursor position.
			-- Move cursor to added `an_item'
		require
			an_item_exists: an_item /= Void
			is_model_extendible: is_model_extendible
		do
			if model_querist.item.container.is_empty then
				model_querist.item.container.put_first (an_item)
			else
				model_querist.item.put_right (an_item)
				model_querist.item.forth
			end
			if not rows.is_last then
				rows.forth
			else
				if is_table_scrolled then
					rows.start
				end
			end
			refresh		
		ensure
			one_more: model_querist.item.container.count = old (model_querist.item.container.count) + 1	
		end


	put_before  (an_item: T) is
			-- Add `an_item' before cursor position.
			-- Move cursor to added `an_item'
		require
			an_item_exists: an_item /= Void
			is_model_extendible: is_model_extendible
		do
			if model_querist.item.container.is_empty then
				model_querist.item.container.put_first (an_item)
			else
				model_querist.item.put_left (an_item)
				model_querist.item.back
			end
			refresh		
		ensure
			one_more: model_querist.item.container.count = old (model_querist.item.container.count) + 1	
		end

feature -- Removal

	remove is
			-- Remove item at current cursor position
		require
			not_off: not off
		do
			if model_querist.item.is_last and model_querist.item.is_first then
				model_querist.item.remove
			else 
				if model_querist.item.is_last then
					model_querist.item.back
					model_querist.item.remove_right
					if not rows.is_first then
						rows.back
					else
						if is_table_scrolled and then rows.is_first then
							rows.finish
						end
					end
				else
					model_querist.item.forth
					model_querist.item.remove_left
				end
			end
			refresh
		ensure
			one_less: model_querist.item.container.count = old (model_querist.item.container.count) - 1
		end	


feature {NONE} -- Implementation of initialization and behaviour

	initialize_behaviour is
			-- Initialise behaviour.
		do		
		end
	
	initialize_child_widgets is
			-- Initialise child widgets.
		do
		end


	initialize_child_widgets_behaviour is
			-- Initialise behaviour of child widgets.
		do
		end

invariant 
	scroll_unit: is_row_scrolled xor is_table_scrolled

end -- class ECTK_TABLE


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
