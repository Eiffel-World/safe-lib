indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 16:49:48 $"
	revision: "$Revision: 1.1 $"

class
	MSGPROC_CALLBACK

inherit
	WNDPROC_CALLBACK

creation
	make
	
feature {NONE} -- Initialization

	make (the_target : MSGPROC_CALLBACKABLE) is
		do
			target := the_target
		ensure
			target_set: target = the_target
		end
		
feature -- Access

	target : MSGPROC_CALLBACKABLE
	
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

	on_callback (hwnd : POINTER; msg, wparam, lparam : INTEGER) : INTEGER is
		do
			Result := target.message_proc (hwnd,msg, wparam, lparam)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class MSGPROC_CALLBACK
