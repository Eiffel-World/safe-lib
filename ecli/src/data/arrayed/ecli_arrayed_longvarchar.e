indexing
	description: "ISO CLI LONGVARCHAR (n) arrayed values"
	author: "Paul-G.Crismer"
	date: "$Date: 2003/02/25 14:29:33 $"
	revision: "$Revision: 1.5 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_LONGVARCHAR

inherit
	ECLI_LONGVARCHAR
		rename
			make as make_single, capacity as content_capacity, max_capacity as max_content_capacity,
			count as content_count
		undefine
			release_handle, length_indicator_pointer, to_external, is_null, set_null, out, trace,
			set_item, transfer_octet_length, to_string, convertible_to_string
		redefine
			item, content_capacity, content_count
		end

	ECLI_ARRAYED_VALUE
		rename
			make as make_arrayed
		redefine
			item, set_item, out_item_at, to_string
		end

creation
	make

feature {NONE} -- Initialization

	make (a_content_capacity : INTEGER; a_capacity : INTEGER) is
		require
			valid_content_capacity: a_content_capacity > 0 and a_content_capacity < max_content_capacity
			valid_capacity: a_capacity >= 1
		do
			buffer := ecli_c_alloc_array_value (a_content_capacity+1, a_capacity)
			capacity := a_capacity
			count := capacity
			set_all_null
			create impl_item.make (0)
		ensure
			content_capacity_set: content_capacity = a_content_capacity
			capacity_set: capacity = a_capacity
			count_set: count = capacity
			cursor_before: before
			all_null: is_all_null -- foreach i in 1..count : is_null_at (i)
		end

	make_arrayed (a_capacity : INTEGER) is
			-- dummy one
		do
		end

feature -- Access

	item_at (index : INTEGER) : like item is
		do
			if is_null_at (index) then
				Result := Void
			else
				protect
				string_copy_from_pointer (impl_item, ecli_c_array_value_get_value_at (buffer, index))
				Result := impl_item
				unprotect
			end
		end

	item : STRING is
			--
		do
			Result := item_at (cursor_index)
		end

	content_capacity : INTEGER is
		do
			Result := ecli_c_array_value_get_length (buffer) - 1
		end

	content_count : INTEGER is
			-- actual length of item
		do
			Result := content_count_at (cursor_index)
		end

	content_count_at (index : INTEGER) : INTEGER is
			-- length of `index'th
		do
			if not is_null_at (index) then
				Result := ecli_c_array_value_get_length_indicator_at (buffer, index)
			end
		end

feature -- Measurement

feature -- Status report

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_array_value_get_length (buffer)
		end

feature -- Status setting


feature -- Cursor movement


feature -- Element change

	set_item (value : like item) is
			-- set item to 'value', truncating if necessary
		do
			set_item_at (value, cursor_index)
		end

	set_item_at (value : like item; index : INTEGER) is
		local
			actual_length, transfer_length : INTEGER
			tools : ECLI_EXTERNAL_TOOLS
		do
			if value.count > content_capacity then
				actual_length := content_capacity
				transfer_length := content_capacity
			else
				actual_length := value.count + 1
				transfer_length := actual_length - 1
			end
			create tools
			tools.protect
			ecli_c_array_value_set_value_at (buffer, tools.string_to_pointer (value), actual_length, index)
			ecli_c_array_value_set_length_indicator_at (buffer, transfer_length, index)
			tools.unprotect
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

		to_string : STRING is
				--
			do
				Result := item_at (cursor_index).out
			end

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_string (Current)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	out_item_at (index : INTEGER) : STRING is
		do
			!!Result.make (10)
			Result.append ("'")
			Result.append (item_at (index).out)
			Result.append ("'")
		end

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_ARRAYED_LONGVARCHAR
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
