-- This file has been generated by EWG. Do not edit. Changes will be lost!
class PRIVILEGE_SET_STRUCT

inherit

	EWG_STRUCT

	PRIVILEGE_SET_STRUCT_EXTERNAL
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

	get_privilegecount: INTEGER is
			-- Access member `PrivilegeCount'
		do
			Result := get_privilegecount_external (item)
		end

	set_privilegecount (a_value: INTEGER) is
			-- Set member `PrivilegeCount'
		do
			set_privilegecount_external (item, a_value)
		ensure
			a_value_set: a_value = get_privilegecount
		end

	get_control: INTEGER is
			-- Access member `Control'
		do
			Result := get_control_external (item)
		end

	set_control (a_value: INTEGER) is
			-- Set member `Control'
		do
			set_control_external (item, a_value)
		ensure
			a_value_set: a_value = get_control
		end

end