indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 16:47:12 $"
	revision: "$Revision: 1.1 $"

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

end -- class MSG
