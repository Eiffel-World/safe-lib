-- This file has been generated by EWG. Do not edit. Changes will be lost!
class OVERLAPPED_STRUCT

inherit

	EWG_STRUCT

	OVERLAPPED_STRUCT_EXTERNAL
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

	get_internal: INTEGER is
			-- Access member `Internal'
		do
			Result := get_internal_external (item)
		end

	set_internal (a_value: INTEGER) is
			-- Set member `Internal'
		do
			set_internal_external (item, a_value)
		ensure
			a_value_set: a_value = get_internal
		end

	get_internalhigh: INTEGER is
			-- Access member `InternalHigh'
		do
			Result := get_internalhigh_external (item)
		end

	set_internalhigh (a_value: INTEGER) is
			-- Set member `InternalHigh'
		do
			set_internalhigh_external (item, a_value)
		ensure
			a_value_set: a_value = get_internalhigh
		end

	get_offset: INTEGER is
			-- Access member `Offset'
		do
			Result := get_offset_external (item)
		end

	set_offset (a_value: INTEGER) is
			-- Set member `Offset'
		do
			set_offset_external (item, a_value)
		ensure
			a_value_set: a_value = get_offset
		end

	get_offsethigh: INTEGER is
			-- Access member `OffsetHigh'
		do
			Result := get_offsethigh_external (item)
		end

	set_offsethigh (a_value: INTEGER) is
			-- Set member `OffsetHigh'
		do
			set_offsethigh_external (item, a_value)
		ensure
			a_value_set: a_value = get_offsethigh
		end

	get_hevent: POINTER is
			-- Access member `hEvent'
		do
			Result := get_hevent_external (item)
		end

	set_hevent (a_value: POINTER) is
			-- Set member `hEvent'
		do
			set_hevent_external (item, a_value)
		ensure
			a_value_set: a_value = get_hevent
		end

end