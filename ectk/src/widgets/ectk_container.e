indexing
	description: "Widgets that manages the traversal of their child widgets"
	author: "Fafchamps Eric"
	usage: "Inherit from this class, and in your make routine call in order make_curses_window (or make_subwindow_relative); initialize_widget and refresh"
	date: "$Date: 2001/11/21 08:26:15 $"
	revision: "$Revision: 1.2 $"

deferred class
	ECTK_CONTAINER [W->ECTK_WIDGET]

inherit
	ECTK_WIDGET
		redefine
			get_event, initialize_widget
		end	

feature -- Access

	item: W is
			-- Which is the current child widget that can update it's model?
		require
			not_off: not off
		do
			Result := children.item_for_iteration
		end 

	index: INTEGER is
			-- Which is the index of the current child widget that can update it's model?
		require	
			not_off: not off
		do
			Result := children.index	
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value for a child position?
		do
			Result := children.valid_index (i)
		end

	has (an_ectk_widget: W): BOOLEAN is
			-- Does this container has `an_ectk_widget'?
			-- (Shallow search only)
		do
			Result := children.has (an_ectk_widget)
		end

	off: BOOLEAN is
			-- Is there no current child?
		do
			Result := children.off
		end

	is_first: BOOLEAN is
			-- Is current child the first editable child widget?
		local
			children_cursor: DS_BILINKED_LIST_CURSOR [W]
		do
			from
				children_cursor := children.new_cursor
				children_cursor.go_i_th (children.index)
				Result := True
			until
				children_cursor.off or Result = False
			loop
				children_cursor.back
				if not children_cursor.off and then children_cursor.item.is_editable then
					Result := False
				end
			end
		end

	is_last: BOOLEAN is
			-- Is current child the last editable child widget?
		local
			children_cursor: DS_BILINKED_LIST_CURSOR [W]
		do
			from
				children_cursor := children.new_cursor
				children_cursor.go_i_th (children.index)
				Result := True
			until
				children_cursor.off or Result = False
			loop
				children_cursor.forth
				if not children_cursor.off and then children_cursor.item.is_editable then
					Result := False
				end
			end
		end

	
feature -- Element change

	force_last (a_child: W) is
			-- Add `a_child' to the end of the children list.
		require
			a_child_defined: a_child /= Void
		do
			children.force_last (a_child)
			start
		ensure
			-- Child added
			-- internal cursor is on first child 
		end

feature -- Basic operations	

	refresh is
			--Refresh the widgets of the container.			
		local
			children_cursor: DS_BILINKED_LIST_CURSOR [W]
			current_child: ECTK_WIDGET
		do
			!!children_cursor.make (children)
			from
				children_cursor.start	
			until
				children_cursor.off				
			loop
				current_child := children_cursor.item
				current_child.refresh
				children_cursor.forth
			end
		end

feature -- Cursor movement


	go_i_th (i: INTEGER) is
			-- Move child at `i'-th position.
		require
			valid_index: valid_index (i)
		do
			before_child_move
			children.go_i_th (i)
			after_child_move
		end

	start is
			-- Move to the first editable child widget.
		do
			before_child_move
			from
				children.start 
			until
				children.off or else children.item_for_iteration.is_editable
			loop
				children.forth	
			end
			after_child_move
		end
			

	move_to (an_ectk_widget: W) is
			-- Move to `an_ectk_widget'.
		require
			has_widget: has (an_ectk_widget)
			editable: an_ectk_widget.is_editable
		do
			before_child_move
			children.start
			children.search_forth (an_ectk_widget)
			after_child_move
		ensure
			moved: item = an_ectk_widget
		end
			

	forth is
			-- Move to next editable child widget.
		require
			not_is_last: not off and then not is_last
		do
			before_child_move
			from
				children.forth
			until
				children.item_for_iteration.is_editable
			loop
				children.forth	
			end
			after_child_move
		end

	back is
			-- Move to previous editable child widget.
		require
			not_is_first: not off and then not is_first
		do
			before_child_move
			from
				children.back
			until
				children.item_for_iteration.is_editable
			loop
				children.back
			end
			after_child_move
		end

	finish is
			-- Move to last editable child widget.
		do
			before_child_move
			from
				children.finish 
			until
				children.is_first or else children.item_for_iteration.is_editable
			loop
				children.back	
			end
			after_child_move
		end

		
feature {NONE} -- Implementation of initialization and behaviour

	initialize_widget is
			-- Initialise widget.
		do
			Precursor
			!!children.make
			initialize_child_widgets
			initialize_child_widgets_behaviour
			before_child_move
			children.start
			after_child_move
		end

	initialize_child_widgets is
			-- Initialise child widgets.
		deferred
		end

	initialize_child_widgets_behaviour is
			-- Initialise behaviour of child widgets.
		deferred
		end

	initialize_behaviour is
			-- Initialize behaviour.
		local
			emi_command: EMI_COMMAND [ECTK_CONTAINER[ECTK_WIDGET]]
			ectk_conditional_command: ECTK_CONDITIONAL_COMMAND	
			emi_cell: EMI_CELL [ECTK_CONTAINER[ECTK_WIDGET]]
		do
			!!emi_cell
			emi_cell.define (Current)
		
			!ECTK_CONTAINER_FORTH_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.tab_event)

			!ECTK_CONTAINER_BACK_COMMAND!emi_command.make (emi_cell)
			!!ectk_conditional_command.make (emi_command)
			add_command (ectk_conditional_command, events_catalog.btab_event)
		end

feature {NONE} -- Implementation of Event handling

		get_event is
			-- get an event
		do
			if not off and then item.is_editable then
				item.do_events
				last_event.copy (item.last_event)
			else
				Precursor
			end
		end

feature {NONE} -- Internal events

	before_child_move is
			-- Called before a new child becomes the current child
		do
			--| To be redefined by descendants if needed
		end
		
	
	after_child_move is
			-- Called after a new child becomes the current child
		do
			--| To be redefined by descendants if needed
		end

feature {NONE} -- Internal state

	children: DS_BILINKED_LIST[W]
			-- What are the child widgets?

end -- class ECTK_CONTAINER


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
