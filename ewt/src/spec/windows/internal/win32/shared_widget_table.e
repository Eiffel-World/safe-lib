indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 19:57:56 $"
	revision: "$Revision: 1.1 $"

class
	SHARED_WIDGET_TABLE

feature -- Access

	widget_table : WIDGET_TABLE is
		once
			create Result.make
		end
		
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

end -- class SHARED_WIDGET_TABLE
