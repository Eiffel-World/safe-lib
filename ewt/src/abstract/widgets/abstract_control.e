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
	date: "$Date: 2004/06/29 16:49:46 $";
	revision: "$Revision: 1.5 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_CONTROL

inherit
	ABSTRACT_WIDGET
	
	ABSTRACT_DRAWABLE
	
feature {NONE} -- Initialization

feature -- Access

	handle : POINTER is
			-- Handle to the OS ressource.
		deferred
		end

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

	set_visible (enable : BOOLEAN) is
			-- Marks the receiver as visible if the argument is <code>true</code>,
			-- and marks it invisible otherwise. 
			-- If one of the receiver's ancestors is not visible or some
			-- other condition makes the receiver not visible, marking
			-- it visible may not actually cause it to be displayed.
		deferred
		end

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature {DISPLAY} -- Basic operations

	window_proc (msg, wparam, lparam : INTEGER) : INTEGER is
		deferred
		end

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
