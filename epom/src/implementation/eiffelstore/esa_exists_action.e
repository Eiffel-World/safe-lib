indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

class
	ESA_EXISTS_ACTION

inherit
	ESA_ACTION
		redefine
			execute
		end

creation
	make
	
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

	execute is
		do
			adapter.execute_exists_procedure (adapter.row, adapter.last_object)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class ESA_EXISTS_ACTION
