indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 21:32:33 $"
	revision: "$Revision: 1.1 $"

class
	MSG

inherit
	TAG_MSG_STRUCT
		rename
			get_hwnd as hwnd,
			get_lparam as lParam,
			get_message as message,
			get_time as time,
			get_wparam as wParam
		end

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared,
	make_from_integer
	
feature {NONE} -- Initialization

	make_from_integer (an_integer : INTEGER) is
			-- make from `an_integer'
		local
			integer_pointer : XS_C_INT32
		do
			create integer_pointer.make
			integer_pointer.put (an_integer)			
			make_shared (integer_pointer.as_pointer)
		end
		
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

end -- class MSG
