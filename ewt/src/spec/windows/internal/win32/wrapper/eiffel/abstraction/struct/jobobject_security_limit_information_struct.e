-- This file has been generated by EWG. Do not edit. Changes will be lost!
class JOBOBJECT_SECURITY_LIMIT_INFORMATION_STRUCT

inherit

	EWG_STRUCT

	JOBOBJECT_SECURITY_LIMIT_INFORMATION_STRUCT_EXTERNAL
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

	get_securitylimitflags: INTEGER is
			-- Access member `SecurityLimitFlags'
		do
			Result := get_securitylimitflags_external (item)
		end

	set_securitylimitflags (a_value: INTEGER) is
			-- Set member `SecurityLimitFlags'
		do
			set_securitylimitflags_external (item, a_value)
		ensure
			a_value_set: a_value = get_securitylimitflags
		end

	get_jobtoken: POINTER is
			-- Access member `JobToken'
		do
			Result := get_jobtoken_external (item)
		end

	set_jobtoken (a_value: POINTER) is
			-- Set member `JobToken'
		do
			set_jobtoken_external (item, a_value)
		ensure
			a_value_set: a_value = get_jobtoken
		end

	get_sidstodisable: POINTER is
			-- Access member `SidsToDisable'
		do
			Result := get_sidstodisable_external (item)
		end

	set_sidstodisable (a_value: POINTER) is
			-- Set member `SidsToDisable'
		do
			set_sidstodisable_external (item, a_value)
		ensure
			a_value_set: a_value = get_sidstodisable
		end

	get_privilegestodelete: POINTER is
			-- Access member `PrivilegesToDelete'
		do
			Result := get_privilegestodelete_external (item)
		end

	set_privilegestodelete (a_value: POINTER) is
			-- Set member `PrivilegesToDelete'
		do
			set_privilegestodelete_external (item, a_value)
		ensure
			a_value_set: a_value = get_privilegestodelete
		end

	get_restrictedsids: POINTER is
			-- Access member `RestrictedSids'
		do
			Result := get_restrictedsids_external (item)
		end

	set_restrictedsids (a_value: POINTER) is
			-- Set member `RestrictedSids'
		do
			set_restrictedsids_external (item, a_value)
		ensure
			a_value_set: a_value = get_restrictedsids
		end

end