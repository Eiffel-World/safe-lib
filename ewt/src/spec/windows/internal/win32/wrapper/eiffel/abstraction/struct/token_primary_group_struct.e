-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TOKEN_PRIMARY_GROUP_STRUCT

inherit

	EWG_STRUCT

	TOKEN_PRIMARY_GROUP_STRUCT_EXTERNAL
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

	get_primarygroup: POINTER is
			-- Access member `PrimaryGroup'
		do
			Result := get_primarygroup_external (item)
		end

	set_primarygroup (a_value: POINTER) is
			-- Set member `PrimaryGroup'
		do
			set_primarygroup_external (item, a_value)
		ensure
			a_value_set: a_value = get_primarygroup
		end

end