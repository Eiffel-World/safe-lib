indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/06/11 13:14:36 $"
	revision: "$Revision: 1.1 $"

class
	RESULT_SET

inherit
	COLUMN_SET[ECLI_COLUMN_DESCRIPTION]
	
creation
	make, make_with_parent_name
	
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

end -- class RESULT_SET
