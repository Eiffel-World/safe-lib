-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_WINDOWPOS_STRUCT

inherit

	EWG_STRUCT

	TAG_WINDOWPOS_STRUCT_EXTERNAL
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

	get_hwnd: POINTER is
			-- Access member `hwnd'
		do
			Result := get_hwnd_external (item)
		end

	set_hwnd (a_value: POINTER) is
			-- Set member `hwnd'
		do
			set_hwnd_external (item, a_value)
		ensure
			a_value_set: a_value = get_hwnd
		end

	get_hwndinsertafter: POINTER is
			-- Access member `hwndInsertAfter'
		do
			Result := get_hwndinsertafter_external (item)
		end

	set_hwndinsertafter (a_value: POINTER) is
			-- Set member `hwndInsertAfter'
		do
			set_hwndinsertafter_external (item, a_value)
		ensure
			a_value_set: a_value = get_hwndinsertafter
		end

	get_x: INTEGER is
			-- Access member `x'
		do
			Result := get_x_external (item)
		end

	set_x (a_value: INTEGER) is
			-- Set member `x'
		do
			set_x_external (item, a_value)
		ensure
			a_value_set: a_value = get_x
		end

	get_y: INTEGER is
			-- Access member `y'
		do
			Result := get_y_external (item)
		end

	set_y (a_value: INTEGER) is
			-- Set member `y'
		do
			set_y_external (item, a_value)
		ensure
			a_value_set: a_value = get_y
		end

	get_cx: INTEGER is
			-- Access member `cx'
		do
			Result := get_cx_external (item)
		end

	set_cx (a_value: INTEGER) is
			-- Set member `cx'
		do
			set_cx_external (item, a_value)
		ensure
			a_value_set: a_value = get_cx
		end

	get_cy: INTEGER is
			-- Access member `cy'
		do
			Result := get_cy_external (item)
		end

	set_cy (a_value: INTEGER) is
			-- Set member `cy'
		do
			set_cy_external (item, a_value)
		ensure
			a_value_set: a_value = get_cy
		end

	get_flags: INTEGER is
			-- Access member `flags'
		do
			Result := get_flags_external (item)
		end

	set_flags (a_value: INTEGER) is
			-- Set member `flags'
		do
			set_flags_external (item, a_value)
		ensure
			a_value_set: a_value = get_flags
		end

end