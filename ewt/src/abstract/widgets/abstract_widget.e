indexing
	description: "[

	This class is the abstraction for all user interface objects.  
	Widgets are created, disposed and issue notification to listeners when events occur which affect them.
	
	Styles:
	(none)
	
	Events:
	Dispose
	
	]"
	date: "$Date: 2003/12/28 22:04:41 $";
	revision: "$Revision: 1.3 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_WIDGET

feature {NONE} -- Initialization

feature -- Access

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
--			releaseChild ();
--			releaseWidget ();
--			destroyWidget ();		
		ensure
			is_resource_disposed : is_resource_disposed
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
