indexing
	description: "Windows implementation of an ABSTRACT_SHELL"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/10 22:15:04 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	SHELL

inherit
	ABSTRACT_SHELL
	
	DECORATIONS
	
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

end -- class SHELL

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/spec/windows/widget/Attic/shell.e,v $";
-- $Log: shell.e,v $
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
