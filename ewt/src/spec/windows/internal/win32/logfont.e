indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 16:49:48 $"
	revision: "$Revision: 1.1 $"

class
	LOGFONT

inherit
	TAG_LOGFONTA_STRUCT
	
	
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

end -- class LOGFONT
