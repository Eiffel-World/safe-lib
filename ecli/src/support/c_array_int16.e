indexing
	description: "C allocated arrays of 16bits integer (short)."
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 19:39:56 $"
	revision: "$Revision: 1.3 $"

class
	C_ARRAY_INT16

inherit
	C_ARRAY [INTEGER]
	
creation
	make
			
feature -- Access

	item (index : INTEGER) : INTEGER is
			-- item at `index'
		local
			item_ptr : POINTER
		do
			item_ptr := item_pointer (index)
			Result := c_memory_short_to_integer (item_ptr)
		end
		
feature -- Measurement
	
	item_size : INTEGER is do Result := 2 end

feature -- Element change

	put (value : like item; index : INTEGER) is
			-- 
		require
			valid_index: index > 0 and index <= capacity
		local
			item_ptr : POINTER
		do
			item_ptr := item_pointer (index)
			c_memory_copy (item_ptr, $value, item_size)
		ensure
			item_set: item (index).is_equal (value)
		end
		
end -- class C_ARRAY_INT16
