indexing

	description:

		"Objects wrapping C pointer arrays."

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class EWG_POINTER_ARRAY

inherit
	
	EWG_ARRAY

creation

	make_unshared,
	make_shared,
	make_new_unshared,
	make_new_shared

feature {ANY} -- Access

	item (i: INTEGER): POINTER is
			-- Return the address of the `i'-th item
		require
			exists: exists
			valid_index: is_valid_index (i)
		do
			Result := managed_data.read_pointer (i * item_size)
		ensure
			item_address_not_default_pointer: Result /= Void
		end

	put (a_value: POINTER; i: INTEGER) is
			-- Put `a_value' at the `i'-th position in the array.
		require
			exists: exists
			valid_index: is_valid_index (i)
		do
			managed_data.put_pointer (a_value, i * item_size)
		ensure
			written: item (i) = a_value
		end


feature {NONE} -- Implementation

	item_size: INTEGER is
			-- Size of one element
			-- In C thats: sizeof (void*)
		once
			Result := EXTERNAL_MEMORY_.sizeof_pointer_external
		end
	
end
