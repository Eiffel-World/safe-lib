-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_EMRTEXT_STRUCT

inherit

	EWG_STRUCT

	TAG_EMRTEXT_STRUCT_EXTERNAL
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

	get_nchars: INTEGER is
			-- Access member `nChars'
		do
			Result := get_nchars_external (item)
		end

	set_nchars (a_value: INTEGER) is
			-- Set member `nChars'
		do
			set_nchars_external (item, a_value)
		ensure
			a_value_set: a_value = get_nchars
		end

	get_offstring: INTEGER is
			-- Access member `offString'
		do
			Result := get_offstring_external (item)
		end

	set_offstring (a_value: INTEGER) is
			-- Set member `offString'
		do
			set_offstring_external (item, a_value)
		ensure
			a_value_set: a_value = get_offstring
		end

	get_foptions: INTEGER is
			-- Access member `fOptions'
		do
			Result := get_foptions_external (item)
		end

	set_foptions (a_value: INTEGER) is
			-- Set member `fOptions'
		do
			set_foptions_external (item, a_value)
		ensure
			a_value_set: a_value = get_foptions
		end

	get_offdx: INTEGER is
			-- Access member `offDx'
		do
			Result := get_offdx_external (item)
		end

	set_offdx (a_value: INTEGER) is
			-- Set member `offDx'
		do
			set_offdx_external (item, a_value)
		ensure
			a_value_set: a_value = get_offdx
		end

end