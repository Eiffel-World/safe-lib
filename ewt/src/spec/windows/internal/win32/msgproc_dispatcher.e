indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 16:49:48 $"
	revision: "$Revision: 1.1 $"

class
	MSGPROC_DISPATCHER

inherit
	WNDPROC_DISPATCHER
		rename
			on_callback as on_windowproc
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

end -- class MSGPROC_DISPATCHER
