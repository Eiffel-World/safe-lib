indexing

	description:

		"Wrapps a C pointer in a safe way"

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class EWG_MANAGED_POINTER

inherit

	MEMORY
		redefine
			dispose
		end
	
	EWG_IMPORTED_EXTERNAL_ROUTINES
		export
			{NONE} all
		end

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared,
	make_default_pointer

feature {NONE} -- Initialisation

	make_new_unshared (a_capacity: INTEGER) is
			-- Create a new pointer wrapper to a new memory area.
			-- Allocates as `a_capacity' bytes of new memory.
			-- 'unshared' means if the Current object
			-- gets collected by the garbage collector,
			-- the allocated memory  will
			-- be freed as well.
		require
			a_capacity_greater_equal_zero: a_capacity >= 0
		do
			item := EXTERNAL_MEMORY_.malloc_external (a_capacity)
			capacity := a_capacity
		ensure
			exists: exists
			is_not_shared: not is_shared
			capacity_set: capacity = a_capacity
		end

	make_new_shared (a_capacity: INTEGER) is
			-- Create a new pointer wrapper to a new memory area.
			-- Allocates as `a_capacity' bytes of new memory.
			-- 'shared' means if the Current object
			-- gets collected by the garbage collector,
			-- the allocated memory will
			-- not be freed as well.
		require
			a_capacity_greater_equal_zero: a_capacity >= 0
		do
			item := EXTERNAL_MEMORY_.malloc_external (a_capacity)
			is_shared := True
			capacity := a_capacity
		ensure
			exists: exists
			is_shared: is_shared
			capacity_set: capacity = a_capacity
		end

	make_unshared (a_item: POINTER; a_capacity: INTEGER) is
			-- Create a new pointer wrapper to an existing memory area.
			-- `a_item' must be the pointer to the memory area to wrap.
			-- `a_capacity' specifies how big the memory area is that
			-- the pointer points to.
			-- 'unshared' means if the Current object
			-- gets collected by the garbage collector,
			-- the allocated memory will
			-- be freed as well.
		require
			a_capacity_greater_equal_zero: a_capacity >= 0
		do
			item := a_item
			capacity := a_capacity
		ensure
			exists: exists
			item_is_a_item: item = a_item
			is_not_shared: not is_shared
			capacity_set: capacity = a_capacity
		end

	make_shared (a_item: POINTER; a_capacity: INTEGER) is
			-- Create a new pointer wrapper to an existing memory area.
			-- `a_item' must be the pointer to the memory area to wrap.
			-- `a_capacity' specifies how big the memory area is that
			-- the pointer points to.
			-- 'shared' means if the Current object
			-- gets collected by the garbage collector,
			-- the memory allocated for the struct will
			-- not be freed as well.
		require
			a_capacity_greater_equal_zero: a_capacity >= 0
		do
			item := a_item
			capacity := a_capacity
			is_shared := True
		ensure
			exists: exists
			item_is_a_item: item = a_item
			is_shared: is_shared
			capacity_set: capacity = a_capacity
		end

	make_default_pointer is
			-- Create a pointer wrapper for the default pointer (NULL)
		do
		ensure
			not_exists: not exists
		end

feature {ANY} -- Access

	item: POINTER
			-- Wrapped C pointer

	is_shared: BOOLEAN
			-- Is the contents of `item' referenced by other C or Eiffel code?
			-- If `is_shared' is `True' then when the current object will be
			-- collected by the garbage collector, the wrapped memory area will
			-- also be freed.
			-- This is a good idea, only if you can be sure that when the
			-- Eiffel object gets collected, the C side does not have a reference
			-- to the wrapped memory anymore.

	exists: BOOLEAN is
			-- Does `item' point to a valid C memory area ?
		do
			Result := item /= default_pointer
		end

	capacity: INTEGER
			-- Size of the memory area that the wrapped
			-- pointer points to.

	read_integer (a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position of the wrapped memory
			-- area.
			-- Reads `sizeof_int' bytes.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity + 1 - sizeof_int
		do
			Result := EXTERNAL_MEMORY_.read_integer_external (item, a_pos)
		end
	
	read_pointer (a_pos: INTEGER): POINTER is
			-- Get the pointer at the `a_pos'-th
			-- byte position of the wrapped memory
			-- area.
			-- Reads `sizeof_pointer' bytes.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity + 1 - sizeof_pointer
		do
			Result := EXTERNAL_MEMORY_.read_pointer_external (item, a_pos)
		end
	
	read_integer_8 (a_pos: INTEGER): INTEGER is
			-- Get the byte at the `a_pos'-th
			-- byte position of the wrapped memory
			-- area.
			-- Reads 8 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity
		do
			Result := EXTERNAL_MEMORY_.read_integer_8_external (item, a_pos)
		ensure
			result_is_byte: Result >= -128 and Result <= 127
		end
	
	read_integer_16 (a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position of the wrapped memory
			-- area.
			-- Reads 16 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity - 1
		do
			Result := EXTERNAL_MEMORY_.read_integer_16_external (item, a_pos)
		ensure
			result_is_int16: Result >= -65536 and Result <= 65535
		end
	
	read_integer_32 (a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position of the wrapped memory
			-- area.
			-- Reads 32 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity - 3
		do
			Result := EXTERNAL_MEMORY_.read_integer_32_external (item, a_pos)
		end
	
feature {ANY} -- Basic Operations

	put_integer (a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- of the wrapped memory area.
			-- Writes `sizeof_int' bytes.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity + 1 - sizeof_int
		do
			EXTERNAL_MEMORY_.put_integer_external (item, a_int, a_pos)
		ensure
			integer_set: read_integer (a_pos) = a_int
		end
	
	put_pointer (a_pointer: POINTER; a_pos: INTEGER) is
			-- Put `a_pointer' at the `a_pos'-th byte position
			-- of the wrapped memory area.
			-- Writes `sizeof_pointer' bytes.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity + 1 - sizeof_pointer
		do
			EXTERNAL_MEMORY_.put_pointer_external (item, a_pointer, a_pos)
		ensure
			integer_set: read_pointer (a_pos) = a_pointer
		end
	
	put_integer_8 (a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- of the wrapped memory area.
			-- Writes 8 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity
			a_int_is_byte: a_int >= -128 and a_int <= 127
		do
			EXTERNAL_MEMORY_.put_integer_8_external (item, a_int, a_pos)
		ensure
			integer_set: read_integer_8 (a_pos) = a_int
		end
	
	put_integer_16 (a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- of the wrapped memory area.
			-- Writes 16 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity - 1
			a_int_is_int16: a_int >= -65536 and a_int <= 65535
		do
			EXTERNAL_MEMORY_.put_integer_16_external (item, a_int, a_pos)
		ensure
			integer_set: read_integer_16 (a_pos) = a_int
		end
	
	put_integer_32 (a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- of the wrapped memory area.
			-- Writes 32 bits.
		require
			item_exists: exists
			a_pos_greater_equal_zero: a_pos >= 0
			a_pos_small_enough: a_pos < capacity - 3
		do
			EXTERNAL_MEMORY_.put_integer_32_external (item, a_int, a_pos)
		ensure
			integer_set: read_integer_32 (a_pos) = a_int
		end

feature

	sizeof_pointer: INTEGER is
			-- Returns the number of bytes a C pointer is broad
		do
			Result := EXTERNAL_MEMORY_.sizeof_pointer_external
		end
	
	sizeof_int: INTEGER is
			-- Returns the number of bytes a C int is broad
		do
			Result := EXTERNAL_MEMORY_.sizeof_int_external
		end
	
feature {NONE} -- Removal

	dispose is
			-- If `is_shared' is `False' and the wrapped memory exists
			-- (is not NULL) then free the wrapped memory
		do
			if not is_shared and exists then
				destroy_object
			end
		end

	destroy_object is
			-- Free the allocated memory.
		require
			item_is_not_shared: not is_shared
			item_exists: exists
		do
			EXTERNAL_MEMORY_.free_external (item)
			item := default_pointer
		ensure
			item_equals_default_pointer: item = default_pointer
		end
	
invariant

	item_not_void: item /= Void

end
