indexing
	description: "Windows implementation of ABSTRACT_SCROLLABLE"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	SCROLLABLE

inherit
	CONTROL
		redefine
			create_widget
		end
		
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

	create_widget is
		do
			-- FIXME
			Precursor
			if UINT32_.u_and (style, swt.Style_event_h_scroll) /= 0 then
				-- horizontalBar = createScrollBar (swt.Style_event_h_scroll)
			end
			if UINT32_.u_and (style, swt.style_V_SCROLL) /= 0 then
				-- verticalBar = createScrollBar (swt.style_V_SCROLL)
			end
		end

	window_class : TCHAR is
		do		
			Result := get_display.window_class
		end

invariant
	invariant_clause: -- Your invariant here

end -- class SCROLLABLE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
