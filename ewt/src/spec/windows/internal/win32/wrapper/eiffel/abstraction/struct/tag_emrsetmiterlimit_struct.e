-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_EMRSETMITERLIMIT_STRUCT

inherit

	EWG_STRUCT

	TAG_EMRSETMITERLIMIT_STRUCT_EXTERNAL
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

	get_emiterlimit: REAL is
			-- Access member `eMiterLimit'
		do
			Result := get_emiterlimit_external (item)
		end

	set_emiterlimit (a_value: REAL) is
			-- Set member `eMiterLimit'
		do
			set_emiterlimit_external (item, a_value)
		ensure
			a_value_set: a_value = get_emiterlimit
		end

end