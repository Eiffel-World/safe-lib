-- This file has been generated by EWG. Do not edit. Changes will be lost!
class PSINJECTDATA_STRUCT

inherit

	EWG_STRUCT

	PSINJECTDATA_STRUCT_EXTERNAL
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

	get_databytes: INTEGER is
			-- Access member `DataBytes'
		do
			Result := get_databytes_external (item)
		end

	set_databytes (a_value: INTEGER) is
			-- Set member `DataBytes'
		do
			set_databytes_external (item, a_value)
		ensure
			a_value_set: a_value = get_databytes
		end

	get_injectionpoint: INTEGER is
			-- Access member `InjectionPoint'
		do
			Result := get_injectionpoint_external (item)
		end

	set_injectionpoint (a_value: INTEGER) is
			-- Set member `InjectionPoint'
		do
			set_injectionpoint_external (item, a_value)
		ensure
			a_value_set: a_value = get_injectionpoint
		end

	get_flags: INTEGER is
			-- Access member `Flags'
		do
			Result := get_flags_external (item)
		end

	set_flags (a_value: INTEGER) is
			-- Set member `Flags'
		do
			set_flags_external (item, a_value)
		ensure
			a_value_set: a_value = get_flags
		end

	get_reserved: INTEGER is
			-- Access member `Reserved'
		do
			Result := get_reserved_external (item)
		end

	set_reserved (a_value: INTEGER) is
			-- Set member `Reserved'
		do
			set_reserved_external (item, a_value)
		ensure
			a_value_set: a_value = get_reserved
		end

end