indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:18 $"
	revision: "$Revision: 1.1 $"

class
	SHARED_DISPLAY

feature -- Access

	default_display : DISPLAY is
		do
			Result := default_display_cell.item
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

feature {DISPLAY} -- Implementation

	default_display_cell : DS_CELL[DISPLAY] is
		once
			create Result.make (Void)
		end
		
invariant
	invariant_clause: True -- Your invariant here

end -- class SHARED_DISPLAY
