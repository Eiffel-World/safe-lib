-- This file has been generated by EWG. Do not edit. Changes will be lost!
class COMMCONFIG_STRUCT

inherit

	EWG_STRUCT

	COMMCONFIG_STRUCT_EXTERNAL
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

	get_dwsize: INTEGER is
			-- Access member `dwSize'
		do
			Result := get_dwsize_external (item)
		end

	set_dwsize (a_value: INTEGER) is
			-- Set member `dwSize'
		do
			set_dwsize_external (item, a_value)
		ensure
			a_value_set: a_value = get_dwsize
		end

	get_wversion: INTEGER is
			-- Access member `wVersion'
		do
			Result := get_wversion_external (item)
		end

	set_wversion (a_value: INTEGER) is
			-- Set member `wVersion'
		do
			set_wversion_external (item, a_value)
		ensure
			a_value_set: a_value = get_wversion
		end

	get_wreserved: INTEGER is
			-- Access member `wReserved'
		do
			Result := get_wreserved_external (item)
		end

	set_wreserved (a_value: INTEGER) is
			-- Set member `wReserved'
		do
			set_wreserved_external (item, a_value)
		ensure
			a_value_set: a_value = get_wreserved
		end

	get_dwprovidersubtype: INTEGER is
			-- Access member `dwProviderSubType'
		do
			Result := get_dwprovidersubtype_external (item)
		end

	set_dwprovidersubtype (a_value: INTEGER) is
			-- Set member `dwProviderSubType'
		do
			set_dwprovidersubtype_external (item, a_value)
		ensure
			a_value_set: a_value = get_dwprovidersubtype
		end

	get_dwprovideroffset: INTEGER is
			-- Access member `dwProviderOffset'
		do
			Result := get_dwprovideroffset_external (item)
		end

	set_dwprovideroffset (a_value: INTEGER) is
			-- Set member `dwProviderOffset'
		do
			set_dwprovideroffset_external (item, a_value)
		ensure
			a_value_set: a_value = get_dwprovideroffset
		end

	get_dwprovidersize: INTEGER is
			-- Access member `dwProviderSize'
		do
			Result := get_dwprovidersize_external (item)
		end

	set_dwprovidersize (a_value: INTEGER) is
			-- Set member `dwProviderSize'
		do
			set_dwprovidersize_external (item, a_value)
		ensure
			a_value_set: a_value = get_dwprovidersize
		end

end