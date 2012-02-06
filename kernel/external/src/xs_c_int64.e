note
	description: "Summary description for {XS_C_INT64}."
	author: ""
	date: "$Date: 2012/02/06 21:56:45 $"
	revision: "$Revision: 1.1 $"

class
	XS_C_INT64

inherit
	XS_C_ITEM[INTEGER_64]

create
	make

feature -- Access

	item : INTEGER_64 is
			-- item
		do
			Result := c_memory_get_int64 (handle)
		end

	as_pointer : POINTER is
		do
			Result := c_memory_get_pointer (handle)
		end

feature -- Measurement

	item_size : INTEGER is do Result := 8 end

	minimum_value : INTEGER_64 -- is -2147483648
	maximum_value : INTEGER_64 -- is 2147483647

feature -- Element change

	put (value : INTEGER_64) is
			-- put `value'
		do
			c_memory_put_int64 (handle, value)
		end

end
