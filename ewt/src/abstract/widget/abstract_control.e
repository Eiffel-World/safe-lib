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

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/10 22:15:04 $";
	revision: "$Revision: 1.1 $";
	author: ""

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

--
--    copyright: "Groupe S (c) 1997-2003"
--    licence: "All rights reserved. Duplication and distribution prohibited."
--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widget/Attic/abstract_control.e,v $";
-- $Log: abstract_control.e,v $
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
