indexing
	description: "Windows implementation of an ABSTRACT_SHELL"
	date: "$Date: 2003/12/29 21:26:54 $";
	revision: "$Revision: 1.3 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHELL

inherit
	ABSTRACT_SHELL
	
	DECORATIONS

creation
	make_by_display
	
feature {NONE} -- Initialization

	make_by_display (a_display : ABSTRACT_DISPLAY) is
			-- Initialize by using `a_display'.			
		do
			-- FIXME
		end

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

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

	open is
			-- Moves `Current' to the top of the drawing order for the display on which it was created (so that all other
			-- shells on that display, which are not `Current' 's children will be drawn behind it), marks it visible, 
			-- and sets focus to its default button (if it has one) and asks the window manager to make the shell active.
		do
			-- FIXME
		end

	bring_to_top is
			-- 
		do
			--| FIXME
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class SHELL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
