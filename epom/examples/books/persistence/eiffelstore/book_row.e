indexing
	description: "Virtual Row on BOOK table "
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

class
	BOOK_ROW

feature -- Access

	isbn : STRING
	
	title : STRING
	
	author : STRING
	
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

end -- class BOOK_ROW
