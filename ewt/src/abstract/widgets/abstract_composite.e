indexing
	description: "[

 Objets that are capable of containing other controls.
 
 Styles:
 NO_BACKGROUND, NO_FOCUS, NO_MERGE_PAINTS, NO_REDRAW_RESIZE, NO_RADIO_GROUP

 Events:
 (none)
 
 Note: The NO_BACKGROUND, NO_FOCUS, NO_MERGE_PAINTS, and NO_REDRAW_RESIZE styles are intended for use with Canvas.
 They can be used with Composite if you are drawing your own, but their behavior is undefined if they are used with subclasses
 of Composite other than Canvas.
 
 This class may be subclassed by custom control implementors who are building controls that are constructed from aggregates of other controls.
 	
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:21 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	ABSTRACT_COMPOSITE

inherit
	ABSTRACT_SCROLLABLE
	
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

end -- class ABSTRACT_COMPOSITE

--
--    copyright: "Groupe S (c) 1997-2003"
--    licence: "All rights reserved. Duplication and distribution prohibited."
--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widgets/abstract_composite.e,v $";
-- $Log: abstract_composite.e,v $
-- Revision 1.1  2003/12/13 19:34:21  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
