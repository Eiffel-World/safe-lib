indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:18 $"
	revision: "$Revision: 1.1 $"

class
	OSVERSIONINFO

inherit
	
	OSVERSIONINFOA_STRUCT
		export
			{ANY} sizeof
		end
	
creation
	make_new_unshared
	
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

end -- class OSVERSIONINFO
