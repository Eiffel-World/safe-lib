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
	date: "$Date: 2003/12/13 22:30:48 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

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

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
