indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/20 09:16:50 $"
	revision: "$Revision: 1.2 $"

class
	MSG

inherit
	TAG_MSG_STRUCT

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared,
	make_from_integer
	
feature {NONE} -- Initialization

	make_from_integer (an_integer : INTEGER) is
			-- make from `an_integer'
		local
			integer_pointer : XS_C_INT32
		do
			create integer_pointer.make
			integer_pointer.put (an_integer)			
			make_shared (integer_pointer.as_pointer)
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

end -- class MSG
