indexing
	description: "Windows implemenation of ABSTRACT_WIDGET"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:50 $";
	revision: "$Revision: 1.1 $";
	author: ""

class
	WIDGET

inherit
	ABSTRACT_WIDGET
	
feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_released : BOOLEAN is
			-- Are the operating system ressources associated with `Current' released?
		do
			-- FIXME
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	add_listener (an_event_type : INTEGER; a_listener : LISTENER) is
			-- Add `a_listener' to the collection of listeners who will
			-- be notifed when an event of `an_event_type' occurs. When the
 			-- event does occur in the widget, the listener is notified by
 			-- calling it's handle_event routine.
		do
			-- FIXME
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

end -- class WIDGET

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/spec/windows/widgets/widget.e,v $";
-- $Log: widget.e,v $
-- Revision 1.1  2003/12/13 19:34:50  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
