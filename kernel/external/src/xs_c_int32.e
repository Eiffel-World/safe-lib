indexing
	description: "C allocated 32 bits integer (int)."
	author: "Paul G. Crismer"
	
	library: "XS_C : eXternal Support C"
	
	date: "$Date: 2003/12/29 19:20:33 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	XS_C_INT32

inherit
	XS_C_ITEM[INTEGER]
	
creation
	make
					
feature -- Access

	item : INTEGER is
			-- item
		do
			Result := c_memory_get_int32 (handle)
		end

	as_pointer : POINTER is
		do
			Result := c_memory_get_pointer (handle)
		end
		
feature -- Measurement
	
	item_size : INTEGER is do Result := 4 end

	minimum_value : INTEGER is -2147483648
	maximum_value : INTEGER is 2147483647
	
feature -- Element change

	put (value : INTEGER) is
			-- put `value'
		do
			c_memory_put_int32 (handle, value)
		end
		
invariant
	handle_not_default_pointer: handle /= default_pointer
	
end -- class XS_C_INT32
--
-- Copyright: 2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
