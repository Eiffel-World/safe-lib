indexing
	description: "Windows implementation of ABSTRACT_DISPLAY"
	date: "$Date: 2003/12/13 22:30:48 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	DISPLAY

inherit
	ABSTRACT_DISPLAY
	
creation
	make
	
feature {NONE} -- Initialization

	make is
			-- Initialize.
		do
			--| FIXME
		end

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

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	read_and_dispatch : BOOLEAN is
			-- Reads an event from the operating system's event queue, dispatches it appropriately.
		do
			-- FIXME
		end

	sleep : BOOLEAN is
			-- Causes the user-interface process to sleep (that is, to be put in a state where it does not consume CPU cycles)
			-- until an event is received or it is otherwise awakened.
		do
			-- FIXME
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
