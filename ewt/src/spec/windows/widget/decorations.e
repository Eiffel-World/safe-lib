indexing
	description: "Windows implementation of ABSTRACT_DECORATIONS"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/10 22:15:04 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	DECORATIONS

inherit
	CANVAS
	
	ABSTRACT_DECORATIONS
	
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

end -- class DECORATIONS

--
--    copyright: "Groupe S (c) 1997-2003"
--    licence: "All rights reserved. Duplication and distribution prohibited."
--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/spec/windows/widget/Attic/decorations.e,v $";
-- $Log: decorations.e,v $
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
