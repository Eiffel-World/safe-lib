indexing
	description: "Container for widgets, arranged horizontally"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.3 $"

class
	ECTK_ROW

inherit
	ECTK_CONTAINER[ECTK_WIDGET]
		redefine
			update
		end

creation
	make

feature {NONE} -- Initialisation

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
			!!window.make_subwindow_relative (parent, a_height, a_width, y, x)
			initialize_widget
			window.memory_refresh
		ensure
			parent_set: window.parent_window = parent;
			origin_set: window.origin_x = x + window.parent_window.origin_x and then window.origin_y = y + window.parent_window.origin_y;
			size_set: window.width = a_width and then window.height = a_height;
			exists: window.exists
		end


feature -- Status report

	is_editable: BOOLEAN is
			-- Is `Current' editable?
		do
			Result := True
		ensure then
			Result = True
		end


feature -- Basic operations	

	update is
			-- Update widget.		
		local
			children_cursor: DS_BILINKED_LIST_CURSOR [ECTK_WIDGET]
		do
			!!children_cursor.make (children)
			from
				children_cursor.start	
			until
				children_cursor.off				
			loop
				children_cursor.item.update
				children_cursor.forth
			end
		end


	update_widget_with_string (a_string: STRING) is
			-- Update widget with `a_string'.
		require
			string_exists: a_string /= Void
		local
			children_cursor: DS_BILINKED_LIST_CURSOR [ECTK_WIDGET]
			an_estring: ESTRING
			child_estring: ESTRING
			i1,i2: INTEGER
		do
			!!children_cursor.make (children)
			from
				children_cursor.start
				!!an_estring.make_from_string (a_string)	
			until
				children_cursor.off
			loop
				i1 := children_cursor.item.window.origin_x - children_cursor.item.window.parent_window.origin_x + 1
				i2 := (i1 + children_cursor.item.window.width - 1).min (an_estring.count)
				if i1 <= i2 then
					child_estring := an_estring.substring (i1, i2)
					children_cursor.item.window.clear
					children_cursor.item.window.move (0,0)
					children_cursor.item.window.put_string (child_estring.string)
					children_cursor.item.window.memory_refresh			
				else
					children_cursor.item.window.clear
					children_cursor.item.window.memory_refresh
				end
				children_cursor.forth
			end
			window.memory_refresh			
		ensure then
			-- characters of a_string are spread over the child widgets
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_child_widgets is
			-- Initialise child widgets.
		do
		end

	initialize_child_widgets_behaviour is
			-- Initialise behaviour of child widgets.
		do
		end


end -- class ECTK_ROW

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
