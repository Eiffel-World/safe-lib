indexing
	description: "Windows implementation of ABSTRACT_CANVAS"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	CANVAS

inherit
	COMPOSITE
		redefine
			do_WM_WINDOWPOSCHANGING 
		end
	
	ABSTRACT_CANVAS
		undefine
			release_handle
		end

feature {NONE} -- Initialization

feature -- Access

	caret : CARET
	
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

	do_WM_WINDOWPOSCHANGING (wparam: INTEGER; lparam: INTEGER) : LRESULT is
			local
				is_focus : BOOLEAN
			do
				Result := Precursor (wparam, lparam)
				if Result /= Void then
					do_nothing
				else
					is_focus := UINT32_.u_and (style, swt.style_RIGHT_TO_LEFT) /= 0 and then caret /= Void and then caret.is_focus_caret
					if is_focus then
						caret.kill_focus
					end
				end
			end
			
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class CANVAS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
