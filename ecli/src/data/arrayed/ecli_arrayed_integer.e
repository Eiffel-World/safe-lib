indexing
	description: "CLI SQL INTEGER arrayed value"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/22 19:28:48 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_INTEGER

inherit
	ECLI_ARRAYED_VALUE
		redefine
			item, set_item, set_item_at, out
		end

	ECLI_INTEGER
		rename
			make as make_single
		export
			{NONE} make_single
		undefine
			release_handle, length_indicator_pointer, to_external, is_null, set_item, to_string
		redefine
			item, transfer_octet_length, out, trace
		end
		
creation
	make

feature {NONE} -- Initialization

	make (a_capacity : INTEGER) is
			-- make with `capacity' values
		do
			buffer := ecli_c_alloc_array_value (4, a_capacity)
			capacity := a_capacity
			count := capacity
			set_all_null
		end

feature -- Access

	item : INTEGER_REF is
		do
			Result := item_at (cursor_index)	
		end

	item_at (index : INTEGER) : like item is
			-- 
		do
			if is_null_at (index) then
				Result := Void
			else
				ecli_c_array_value_copy_value_at (buffer, $actual_value, index)
				!! Result
				Result.set_item (actual_value)
			end
		end
		
feature -- Measurement

feature -- Status report

feature -- Status setting

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_array_value_get_length (buffer)
		end

feature -- Cursor movement

feature -- Element change

	set_item (value : like item) is
			-- set item to 'value', truncating if necessary
		do
			set_item_at (value, cursor_index)
		end

	set_item_at (value : like item; index : INTEGER) is
			-- set item to 'value', truncating if necessary
		do
			actual_value := value.item
			ecli_c_array_value_set_value_at (buffer, $actual_value, transfer_octet_length, index)
			ecli_c_array_value_set_length_indicator_at (buffer, transfer_octet_length, index)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	out : STRING is
		local
			i : INTEGER
		do
			from i := 1
				!!Result.make (10)
				Result.append ("<<")
			until i > count
			loop
				if is_null_at (i) then
					Result.append ("NULL")
				else
					Result.append (item_at (i).item.out)
				end
				i := i + 1
				if i <= count then
					Result.append (", ")
				end
			end
			Result.append (">>")
		end

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_integer (Current)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_ARRAYED_INTEGER
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
