-- This file has been generated by EWG. Do not edit. Changes will be lost!
class MESSAGE_RESOURCE_ENTRY_STRUCT

inherit

	EWG_STRUCT

	MESSAGE_RESOURCE_ENTRY_STRUCT_EXTERNAL
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

	get_length: INTEGER is
			-- Access member `Length'
		do
			Result := get_length_external (item)
		end

	set_length (a_value: INTEGER) is
			-- Set member `Length'
		do
			set_length_external (item, a_value)
		ensure
			a_value_set: a_value = get_length
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

end