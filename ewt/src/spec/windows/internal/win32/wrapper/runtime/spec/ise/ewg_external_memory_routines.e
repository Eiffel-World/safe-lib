indexing

	description:

		"External Memory routines"

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"


class EWG_EXTERNAL_MEMORY_ROUTINES

feature
feature

-- malloc
	

	malloc_external (a_size: INTEGER): POINTER is
		require
			a_size_greater_equal_zero: a_size >= 0
		external
			"C macro use <stdlib.h>"
		alias
			"malloc"
		end






















-- free


	free_external (a_item: POINTER) is
		require
			a_item_not_void: a_item /= Void
		external
			"C macro use <stdlib.h>"
		alias
			"free"
		end






















-- memcpy


	memcpy_external (a_dest, a_src: POINTER; a_n: INTEGER): POINTER is
		require
			a_n_greater_equal_zero: a_n >= 0
			a_dest_not_default: a_dest /= Default_pointer
			a_src_not_default: a_src /= Default_pointer
		external
			"C macro use <string.h>"
		alias
			"memcpy"
		end



























-- read_integer_8



















	read_integer_8_external (a_pointer: POINTER; a_pos: INTEGER): INTEGER is
			-- Get the byte at the `a_pos'-th
			-- byte position starting at `a_pointer'.
			-- Reads 8 bits.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			($Result).memory_copy (a_pointer + a_pos, 1)
		ensure
			result_is_byte: Result >= -128 and Result <= 127
		end

















-- put_integer_8

	



















	put_integer_8_external (a_pointer: POINTER; a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- starting at `a_pointer'.
			-- Writes 8 bits.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
			a_int_is_byte: a_int >= -128 and a_int <= 127
		do
			(a_pointer + a_pos).memory_copy ($a_int, 1)
		ensure
			integer_set: read_integer_8_external (a_pointer, a_pos) = a_int
		end


















-- read_integer_16




















	read_integer_16_external (a_pointer: POINTER; a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position starting at `a_pointer'.
			-- Reads 16 bits.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			($Result).memory_copy (a_pointer + a_pos, 2)
		ensure
			result_is_int16: Result >= -65536 and Result <= 65535
		end

















-- put_integer_16





















	put_integer_16_external (a_pointer: POINTER; a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- starting at `a_pointer'.
			-- Writes 16 bits.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
			a_int_is_int16: a_int >= -65536 and a_int <= 65535
		do
			(a_pointer + a_pos).memory_copy ($a_int, 2)
		ensure
			integer_set: read_integer_16_external (a_pointer, a_pos) = a_int
		end


















-- read_integer_32

















	read_integer_32_external (a_pointer: POINTER; a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position starting at `a_pointer'.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			($Result).memory_copy (a_pointer + a_pos, 4)
		end














-- put_integer_32




















	put_integer_32_external (a_pointer: POINTER; a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- starting at `a_pointer'.
			-- Writes 16 bits.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			(a_pointer + a_pos).memory_copy ($a_int, 4)
		ensure
			integer_set: read_integer_32_external (a_pointer, a_pos) = a_int
		end

















-- read_integer















	read_integer_external (a_pointer: POINTER; a_pos: INTEGER): INTEGER is
			-- Get the integer at the `a_pos'-th
			-- byte position starting at `a_pointer'.
			-- Reads `sizeof_int' bytes.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			($Result).memory_copy (a_pointer + a_pos, sizeof_int_external)
		end















-- put_integer


















	put_integer_external (a_pointer: POINTER; a_int: INTEGER; a_pos: INTEGER) is
			-- Put `a_int' at the `a_pos'-th byte position
			-- starting at `a_pointer'.
			-- Writes `sizeof_int' bytes.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		do
			(a_pointer + a_pos).memory_copy ($a_int, sizeof_int_external)
		ensure
			integer_set: read_integer_external (a_pointer, a_pos) = a_int
		end

















-- read_pointer


	read_pointer_external (a_pointer: POINTER; a_pos: INTEGER): POINTER is
			-- Get the pointer at the `a_pos'-th
			-- byte position starting at `a_pointer'.
			-- Reads `sizeof_pointer' bytes.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"ewg_read_pointer"
		end















-- put_pointer


	put_pointer_external (a_pointer: POINTER; a_value: POINTER; a_pos: INTEGER) is
			-- Put `a_value' at the `a_pos'-th byte position
			-- starting at `a_pointer'.
			-- Writes `sizeof_pointer' bytes.
		require
			a_pointer_not_default_pointer: a_pointer /= Default_pointer
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"ewg_put_pointer"
		ensure
			integer_set: read_pointer_external (a_pointer, a_pos) = a_value
		end

















-- add_pointer_and_integer


	add_pointer_and_integer_external (a_pointer: POINTER; a_integer: INTEGER): POINTER is
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"ewg_add_pointer_and_integer"
		end











-- pointer_to_integer
-- TODO: what if sizeof(int) != sizeof(void*) ?

	pointer_to_integer_external (a_pointer: POINTER): INTEGER is
		external
			"C macro use <stdlib.h>"
		alias
			"(int)"
		end










-- integer_to_pointer
-- TODO: what if sizeof(int) != sizeof(void*) ?

	integer_to_pointer_external (a_integer: INTEGER): POINTER is
		external
			"C macro use <stdlib.h>"
		alias
			"(void*)"
		end










-- reference_of


	reference_of_external (a_pointer: POINTER): POINTER is
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"ewg_reference_of"
		end










-- sizeof_pointer	


	sizeof_pointer_external: INTEGER is
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"sizeof(void*)"
		end










-- sizeof_int


	sizeof_int_external: INTEGER is
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"sizeof(int)"
		end










-- bitwise or
-- TODO: put in other class


	bitwise_integer_or_external (a_value_1: INTEGER; a_value_2: INTEGER): INTEGER is
		external
			"C macro use <c/ewg_c_library/ewg_memory_macros.h>"
		alias
			"ewg_add_pointer_and_integer"
		end










end
	
