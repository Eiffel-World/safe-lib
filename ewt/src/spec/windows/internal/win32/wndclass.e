indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 16:49:48 $"
	revision: "$Revision: 1.1 $"

class
	WNDCLASS

inherit
	TAG_WNDCLASSA_STRUCT
		rename
			get_cbclsextra as cbClsExtra,	
			get_cbwndextra as cbWndExtra,		
			get_hbrbackground as hbrBackground,		
			get_hcursor as hCursor,		
			get_hicon as hIcon,		
			get_hinstance as hInstance,		
			get_lpfnwndproc as lpfnWndProc,		
			get_lpszclassname as lpszClassName,		
			get_lpszmenuname as lpszMenuName,		
			get_style as style
		end
			
creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature -- Access

feature -- Measurement

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

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class WNDCLASS
