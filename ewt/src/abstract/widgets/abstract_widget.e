indexing
	description: "[

This class is the abstraction for all user interface objects.  
Widgets are created, disposed and issue notification to listeners when events occur which affect them.

Styles:
(none)

Events:
Dispose
	
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:21 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	ABSTRACT_WIDGET

feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_released : BOOLEAN is
			-- Are the operating system ressources associated with `Current' released?
		deferred
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	add_listener (an_event_type : INTEGER; a_listener : LISTENER) is
			-- Add `a_listener' to the collection of listeners who will
			-- be notifed when an event of `an_event_type' occurs. When the
 			-- event does occur in the widget, the listener is notified by
 			-- calling it's handle_event routine.
 		require
 			not_is_released : not is_released
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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_WIDGET

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widgets/abstract_widget.e,v $";
-- $Log: abstract_widget.e,v $
-- Revision 1.1  2003/12/13 19:34:21  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
