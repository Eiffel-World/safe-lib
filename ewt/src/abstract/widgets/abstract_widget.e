indexing
	description: "[

	This class is the abstraction for all user interface objects.  
	Widgets are created, disposed and issue notification to listeners when events occur which affect them.
	
	Styles:
	(none)
	
	Events:
	Dispose
	
	]"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.9 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_WIDGET
	
inherit
	
	DISPOSABLE_RESOURCE
	
	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		end
		
feature {NONE} -- Initialization

feature -- Access

	get_display : ABSTRACT_DISPLAY is
			-- Returns the Display that is associated with the receiver.
			--  A widget's display is either provided when it is created (for example, top level Shells) or is the
			-- same as its parent's display.
		deferred
		end

	state : INTEGER
	
	style : INTEGER
	
	event_table : EVENT_TABLE
	
	data : ANY
			-- Single attached data.
	
	property_table : DS_TABLE [ANY, STRING]
			-- Application defined properties.

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_resource_disposed : BOOLEAN is
			-- Is the operating system resource of `Current' disposed?
		do
			Result := UINT32_.u_and (state, DISPOSED_constant) /= 0
		end
		
	is_widget_released : BOOLEAN
	
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	add_listener (an_event_type : INTEGER; a_listener : LISTENER) is
			-- Add `a_listener' to the collection of listeners who will
			-- be notifed when an event of `an_event_type' occurs. When the
 			-- event does occur in the widget, the listener is notified by
 			-- calling it's handle_event routine.
 		require
 			not_is_resource_disposed : not is_resource_disposed
 			a_listener_defined : a_listener /= Void
		deferred
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	dispose_resource is
			-- Disposes of the operating system resource of `Current'.
		do
			if is_resource_disposed then
				do_nothing
			else
--			if (!isValidThread ()) error (SWT.ERROR_THREAD_INVALID_ACCESS);
				release_child
				release_widget
				destroy_widget		
			end			
		end

	release_child is
			-- * Releases the receiver, a child in a widget hierarchy,
			-- * from its parent.
			-- * <p>
			-- * When a widget is destroyed, it may be necessary to remove
			-- * it from an internal data structure of the parent. When
			-- * a widget has no handle, it may also be necessary for the
			-- * parent to hide the widget or otherwise indicate that the
			-- * widget has been disposed. For example, disposing a menu
			-- * bar requires that the menu bar first be released from the
			-- * shell when the menu bar is active.  This could not be done
			-- * in <code>destroyWidget</code> for the menu bar because the
			-- * parent shell as well as other fields have been null'd out
			-- * already by <code>releaseWidget</code>.
			-- * </p>
			-- * This method is called first when a widget is disposed.
		deferred
		end
		
	release_widget is
		deferred
		end
		
	destroy_widget is
			-- * Destroys the widget in the operating system and releases
			-- * the widget's handle.  If the widget does not have a handle,
			-- * this method may hide the widget, mark the widget as destroyed
			-- * or do nothing, depending on the widget.
			-- * <p>
			-- * When a widget is destroyed in the operating system, its
			-- * descendents are also destroyed by the operating system.
			-- * This means that it is only necessary to call <code>destroyWidget</code>
			-- * on the root of the widget tree.
			-- * </p><p>
		require
			is_widget_released: is_widget_released
		deferred
		end

	release_handle is
				-- * Releases the widget's handle by zero'ing it out.
				-- * Does not destroy or release any operating system
				-- * resources.
				-- * <p>
				-- * This method is called after <code>releaseWidget</code>
				-- * or from <code>destroyWidget</code> when a widget is being
				-- * destroyed to ensure that the widget is marked as destroyed
				-- * in case the act of destroying the widget in the operating
				-- * system causes application code to run in callback that
				-- * could access the widget.
				-- * </p>
		do
			state := UINT32_.u_or (state, DISPOSED_constant)
		ensure
			state_is_disposed: UINT32_.u_or (state, DISPOSED_constant) /= 0
		end

	release_resources is
		do
			release_widget
			release_handle
		end
		
	check_widget is
		do
--FIXME
--	if (!isValidThread ()) error (SWT.ERROR_THREAD_INVALID_ACCESS);
--	if (isDisposed ()) error (SWT.ERROR_WIDGET_DISPOSED);
		end

	send_event (event : EVENT) is
		do
--	Display display = event.display;
--	if (!display.filterEvent (event)) {
--		if (eventTable != null) eventTable.sendEvent (event);
--	}
		end
		
	send_event_by_type (event_type : INTEGER) is 
		do
			send_event_by_type_and_event_conditional (event_type, Void, True)
		end
		
	send_event_by_type_and_event (event_type : INTEGER; event : EVENT) is
		do
			send_event_by_type_and_event_conditional (event_type, event, True)
		end
		
	send_event_by_type_and_event_conditional (event_type : INTEGER; event : EVENT; send : BOOLEAN) is
		do
--	Display display = getDisplay ();
--	if (eventTable == null && !display.filters (eventType)) {
--		return;			
--	}
--	if (event == null) event = new Event ();
--	event.type = eventType;
--	event.display = display;
--	event.widget = this;
--	if (event.time == 0) {
--		event.time = display.getLastEventTime ();
--	}
--	if (send) {
--		sendEvent (event);
--	} else {
--		display.postEvent (event);
--	}
--}
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

	DISABLED_constant : INTEGER is 64 --	= 1<<6;
	HIDDEN_constant : INTEGER is 128 --			= 1<<7;
--//	static final int FOREGROUND		= 1<<8;
--//	static final int BACKGROUND		= 1<<9;
	DISPOSED_constant : INTEGER is 1024 --		= 1<<10;
--//	static final int HANDLE			= 1<<11;
	CANVAS_constant : INTEGER is 4096 --		= 1<<12;
--	
--	/* Default widths for widgets */
	DEFAULT_WIDTH_constant : INTEGER is 64 --	= 64;
	DEFAULT_HEIGHT_constant : INTEGER is 64 --	= 64;
	Mnemonic_constant : CHARACTER is '&'

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_WIDGET

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
