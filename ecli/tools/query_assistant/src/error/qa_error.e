indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/12/07 21:13:05 $"
	revision: "$Revision: 1.1 $"

class
	QA_ERROR

inherit
	UT_ERROR

creation

feature -- Access

	default_template : STRING
	
	code : STRING
	
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

end -- class QA_ERROR
