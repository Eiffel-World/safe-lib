indexing
	description: "[

	Control is the abstraction for all windowed user interface classes.
	 
	Styles:
	BORDER,LEFT_TO_RIGHT, RIGHT_TO_LEFT
	
	Only one of LEFT_TO_RIGHT or RIGHT_TO_LEFT may be specified.
	 
	Events:
	FocusIn, FocusOut, Help, KeyDown, KeyUp, MouseDoubleClick, MouseDown, MouseEnter,
	MouseExit, MouseHover, MouseUp, MouseMove, Move, Paint, Resize
	
	]"
	date: "$Date: 2003/12/13 22:30:48 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_CONTROL

inherit
	ABSTRACT_WIDGET
	
--	DRAWABLE (for implementation only)
	
feature {NONE} -- Initialization

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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_CONTROL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
