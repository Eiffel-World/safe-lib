-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_BITMAPFILEHEADER_STRUCT

inherit

	EWG_STRUCT

	TAG_BITMAPFILEHEADER_STRUCT_EXTERNAL
		export
			{NONE} all
		end

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {NONE} -- Implementation

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	get_bftype: INTEGER is
			-- Access member `bfType'
		do
			Result := get_bftype_external (item)
		end

	set_bftype (a_value: INTEGER) is
			-- Set member `bfType'
		do
			set_bftype_external (item, a_value)
		ensure
			a_value_set: a_value = get_bftype
		end

	get_bfsize: INTEGER is
			-- Access member `bfSize'
		do
			Result := get_bfsize_external (item)
		end

	set_bfsize (a_value: INTEGER) is
			-- Set member `bfSize'
		do
			set_bfsize_external (item, a_value)
		ensure
			a_value_set: a_value = get_bfsize
		end

	get_bfreserved1: INTEGER is
			-- Access member `bfReserved1'
		do
			Result := get_bfreserved1_external (item)
		end

	set_bfreserved1 (a_value: INTEGER) is
			-- Set member `bfReserved1'
		do
			set_bfreserved1_external (item, a_value)
		ensure
			a_value_set: a_value = get_bfreserved1
		end

	get_bfreserved2: INTEGER is
			-- Access member `bfReserved2'
		do
			Result := get_bfreserved2_external (item)
		end

	set_bfreserved2 (a_value: INTEGER) is
			-- Set member `bfReserved2'
		do
			set_bfreserved2_external (item, a_value)
		ensure
			a_value_set: a_value = get_bfreserved2
		end

	get_bfoffbits: INTEGER is
			-- Access member `bfOffBits'
		do
			Result := get_bfoffbits_external (item)
		end

	set_bfoffbits (a_value: INTEGER) is
			-- Set member `bfOffBits'
		do
			set_bfoffbits_external (item, a_value)
		ensure
			a_value_set: a_value = get_bfoffbits
		end

end