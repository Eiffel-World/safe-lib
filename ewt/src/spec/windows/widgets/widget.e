indexing
	description: "Windows implemenation of ABSTRACT_WIDGET"
	date: "$Date: 2003/12/30 12:50:58 $";
	revision: "$Revision: 1.5 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	WIDGET

inherit
	ABSTRACT_WIDGET
	
feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

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

feature {NONE} -- Attributes

	style : INTEGER
			-- Style.
			
feature {NONE} -- Once features

	swt : SWT is
			-- Common constants and features.
		once
			Create Result
		end

	error (a_code : INTEGER) is
			-- Does whatever widget specific cleanup is required, and then uses the code in swt.error to handle the error.
		do
			swt.error(a_code)
		end



invariant
	invariant_clause: -- Your invariant here

end -- class WIDGET

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
