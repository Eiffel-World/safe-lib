indexing
	description: "[

	This class is the abstraction for all user interface objects.  
	Widgets are created, disposed and issue notification to listeners when events occur which affect them.
	
	Styles:
	(none)
	
	Events:
	Dispose
	
	]"
	date: "$Date: 2004/06/29 16:49:46 $";
	revision: "$Revision: 1.7 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_WIDGET
	
feature {NONE} -- Initialization

feature -- Access

	get_display : ABSTRACT_DISPLAY is
			-- Returns the Display that is associated with the receiver.
			--  A widget's display is either provided when it is created (for example, top level Shells) or is the
			-- same as its parent's display.
		deferred
		end

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_resource_disposed : BOOLEAN
			-- Is the operating system resource of `Current' disposed?

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
--			FIXME
--			if (isDisposed ()) return;
--			if (!isValidThread ()) error (SWT.ERROR_THREAD_INVALID_ACCESS);
			if is_resource_disposed then
				do_nothing
			else
	--			release_child
	--			release_widget
	--			destroy_widget		
			end
			
		ensure
			is_resource_disposed : is_resource_disposed
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

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_WIDGET

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
