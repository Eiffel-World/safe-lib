indexing
	description: "Windows implementation of ABSTRACT_CANVAS"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:50 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	CANVAS

inherit
	COMPOSITE
	
	ABSTRACT_CANVAS

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

end -- class CANVAS

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/spec/windows/widgets/canvas.e,v $";
-- $Log: canvas.e,v $
-- Revision 1.1  2003/12/13 19:34:50  efa
-- sp�cification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
