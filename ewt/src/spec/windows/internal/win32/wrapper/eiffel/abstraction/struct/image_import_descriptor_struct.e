-- This file has been generated by EWG. Do not edit. Changes will be lost!
class IMAGE_IMPORT_DESCRIPTOR_STRUCT

inherit

	EWG_STRUCT

	IMAGE_IMPORT_DESCRIPTOR_STRUCT_EXTERNAL
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

	get_timedatestamp: INTEGER is
			-- Access member `TimeDateStamp'
		do
			Result := get_timedatestamp_external (item)
		end

	set_timedatestamp (a_value: INTEGER) is
			-- Set member `TimeDateStamp'
		do
			set_timedatestamp_external (item, a_value)
		ensure
			a_value_set: a_value = get_timedatestamp
		end

	get_forwarderchain: INTEGER is
			-- Access member `ForwarderChain'
		do
			Result := get_forwarderchain_external (item)
		end

	set_forwarderchain (a_value: INTEGER) is
			-- Set member `ForwarderChain'
		do
			set_forwarderchain_external (item, a_value)
		ensure
			a_value_set: a_value = get_forwarderchain
		end

	get_name: INTEGER is
			-- Access member `Name'
		do
			Result := get_name_external (item)
		end

	set_name (a_value: INTEGER) is
			-- Set member `Name'
		do
			set_name_external (item, a_value)
		ensure
			a_value_set: a_value = get_name
		end

	get_firstthunk: INTEGER is
			-- Access member `FirstThunk'
		do
			Result := get_firstthunk_external (item)
		end

	set_firstthunk (a_value: INTEGER) is
			-- Set member `FirstThunk'
		do
			set_firstthunk_external (item, a_value)
		ensure
			a_value_set: a_value = get_firstthunk
		end

end