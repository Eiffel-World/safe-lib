indexing
	description: "Widget that shows a string, it can be selected"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/21 08:26:15 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_MENU_ITEM

inherit
	ECTK_WIDGET
		redefine
			initialize
		end
		
creation
	make_with_label
	

feature {NONE} -- Initialisation

	make_with_label (parent: CURSES_WINDOW; a_height, a_width, y, x: INTEGER; a_label: STRING) is
			-- Make with origin coordinates relative to parent with `a_label.
		require
			window_exists: parent /= void;
			reasonable_size: a_width >= a_label.count and a_height >= 1;
			positive_origin: x >= 0 and y >= 0;
			inside_parent_size: parent.width >= a_width and parent.height >= a_height;
			width_in_parent: parent.width >= a_width + x;
			height_in_parent: parent.height >= a_height + y
		do
			!!window.make_subwindow_relative (parent, a_height, a_width, y, x)
			label := a_label
			initialize_widget
			refresh
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = a_width and then window.height = a_height;
			exists: window.exists
		end
		
feature -- Status report

	is_editable: BOOLEAN is
			-- Is the data of the current widget editable?
		do
			Result := True
		ensure then
			not_editable: Result = True
		end

	selected: BOOLEAN
			-- Is current selected?
	
feature -- Basic operations

	refresh is
			-- Refresh current widget.
		do
			if selected then
				window.enable_attribute (curses_attribute_constants.Attribute_reverse)
				window.clear
				window.move (0, 0)
				window.put_string (label)
			else
				window.disable_attribute (curses_attribute_constants.Attribute_reverse)
				window.clear
				window.move (0, 0)
				window.put_string (label)
			end
			window.memory_refresh
		end

	select_it is
			-- Select current.
		do
			selected := True
			Refresh
		ensure
			selected: selected
		-- refreshed
		end
		
	deselect_it is
			-- Deselect current.
		do
			selected := False
			refresh
		ensure
			not_selected: not selected
		-- refreshed
		end

feature {NONE} -- Implementation of Event handling
	
	initialize is
			-- Initialize event loop.
		do
			Precursor
			window.move (0,0)
			window.memory_refresh
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_behaviour is
			-- Initialise behaviour.
		do
		end

feature {NONE} -- Internal state

	label: STRING
			-- Label string showed in item.
			
end -- class ECTK_MENU_ITEM
