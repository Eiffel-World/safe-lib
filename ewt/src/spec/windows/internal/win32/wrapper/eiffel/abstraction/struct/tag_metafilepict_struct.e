-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_METAFILEPICT_STRUCT

inherit

	EWG_STRUCT

	TAG_METAFILEPICT_STRUCT_EXTERNAL
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

	get_mm: INTEGER is
			-- Access member `mm'
		do
			Result := get_mm_external (item)
		end

	set_mm (a_value: INTEGER) is
			-- Set member `mm'
		do
			set_mm_external (item, a_value)
		ensure
			a_value_set: a_value = get_mm
		end

	get_xext: INTEGER is
			-- Access member `xExt'
		do
			Result := get_xext_external (item)
		end

	set_xext (a_value: INTEGER) is
			-- Set member `xExt'
		do
			set_xext_external (item, a_value)
		ensure
			a_value_set: a_value = get_xext
		end

	get_yext: INTEGER is
			-- Access member `yExt'
		do
			Result := get_yext_external (item)
		end

	set_yext (a_value: INTEGER) is
			-- Set member `yExt'
		do
			set_yext_external (item, a_value)
		ensure
			a_value_set: a_value = get_yext
		end

	get_hmf: POINTER is
			-- Access member `hMF'
		do
			Result := get_hmf_external (item)
		end

	set_hmf (a_value: POINTER) is
			-- Set member `hMF'
		do
			set_hmf_external (item, a_value)
		ensure
			a_value_set: a_value = get_hmf
		end

end