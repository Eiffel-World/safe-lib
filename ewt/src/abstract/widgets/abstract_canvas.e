indexing
	description: "[
	
Objets that provides a surface for drawing arbitrary graphics.

 Styles:
 (none)
 
 Events:
 (none)
 
 This class may be subclassed by custom control implementors who are building controls that are not constructed
 from aggregates of other controls.
 That is, they are either painted using EWT graphics calls or are handled by native methods.
 
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:21 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	ABSTRACT_CANVAS

inherit
	ABSTRACT_COMPOSITE

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

end -- class ABSTRACT_CANVAS

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widgets/abstract_canvas.e,v $";
-- $Log: abstract_canvas.e,v $
-- Revision 1.1  2003/12/13 19:34:21  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
