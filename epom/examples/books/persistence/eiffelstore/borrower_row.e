indexing
	description: "Virtual row on BORROWER table."
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 20:26:28 $"
	revision: "$Revision: 1.2 $"

class
	BORROWER_ROW

feature -- Access

	name : STRING
	
	address : STRING
	
	id : INTEGER
	
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

end
