indexing
	description: "Accesses to shared maximum length."
	author: "Paul G. Crismer"
	date: "$Date: 2008/05/16 07:39:37 $"
	revision: "$Revision: 1.3 $"

class
	SHARED_MAXIMUM_LENGTH

feature -- Access

	maximum_length : INTEGER is
		do
			Result := maximum_length_cell.item
		end

feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_maximum_length (new_length : INTEGER) is
		do
			Maximum_length_cell.put (new_length)
		ensure
			maximum_length_set: maximum_length = new_length
		end

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

	maximum_length_cell : DS_CELL [INTEGER] is
		once
			create Result.make (0)
		end


invariant
	maxumum_length_cell_not_void: maximum_length_cell /= Void

end -- class SHARED_MAXIMUM_LENGTH
