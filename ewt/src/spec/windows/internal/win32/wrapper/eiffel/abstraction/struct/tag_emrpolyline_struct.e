-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_EMRPOLYLINE_STRUCT

inherit

	EWG_STRUCT

	TAG_EMRPOLYLINE_STRUCT_EXTERNAL
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

	get_cptl: INTEGER is
			-- Access member `cptl'
		do
			Result := get_cptl_external (item)
		end

	set_cptl (a_value: INTEGER) is
			-- Set member `cptl'
		do
			set_cptl_external (item, a_value)
		ensure
			a_value_set: a_value = get_cptl
		end

end