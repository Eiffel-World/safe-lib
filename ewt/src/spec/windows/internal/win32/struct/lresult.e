indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 19:59:01 $"
	revision: "$Revision: 1.1 $"

class
	LRESULT

inherit
	INTEGER_REF
		rename
			item as value, set_item as set_value
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

end -- class LRESULT
