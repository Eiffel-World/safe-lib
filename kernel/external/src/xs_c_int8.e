indexing
	description: "C allocated 8 bits integer (char)."
	author: "Paul G. Crismer"
	
	library: "XS_C : eXternal Support C"
	
	date: "$Date: 2003/08/19 15:52:28 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	XS_C_INT8

inherit
	XS_C_ITEM[INTEGER]
	
creation
	make
					
feature -- Access

	item : INTEGER is
			-- item
		do
			Result := c_memory_get_int8 (handle)
		end
		
feature -- Measurement
	
	item_size : INTEGER is do Result := 1 end

	minimum_value : INTEGER is -128
	maximum_value : INTEGER is 127
	
feature -- Element change

	put (value : INTEGER) is
			-- put `value'
		do
			c_memory_put_int8 (handle, value)
		end
		
invariant
	handle_not_default_pointer: handle /= default_pointer
	
end -- class XS_C_INT8
--
-- Copyright: 2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
