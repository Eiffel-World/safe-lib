indexing
	description: "Windows implementation of ABSTRACT_COMPOSITE"
	date: "$Date: 2004/06/20 09:16:51 $";
	revision: "$Revision: 1.5 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	COMPOSITE

inherit	
	ABSTRACT_COMPOSITE
	
	SCROLLABLE
		redefine
			widget_style
		end
	
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

	widget_style : INTEGER is
		do
		--	/* Force clipping of children by setting WS_CLIPCHILDREN */
			Result := UINT32_.u_or (Precursor, OS.WS_CLIPCHILDREN)
		end
		
invariant
	invariant_clause: -- Your invariant here

end -- class COMPOSITE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
