-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_EMRINVERTRGN_STRUCT

inherit

	EWG_STRUCT

	TAG_EMRINVERTRGN_STRUCT_EXTERNAL
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

	get_cbrgndata: INTEGER is
			-- Access member `cbRgnData'
		do
			Result := get_cbrgndata_external (item)
		end

	set_cbrgndata (a_value: INTEGER) is
			-- Set member `cbRgnData'
		do
			set_cbrgndata_external (item, a_value)
		ensure
			a_value_set: a_value = get_cbrgndata
		end

end