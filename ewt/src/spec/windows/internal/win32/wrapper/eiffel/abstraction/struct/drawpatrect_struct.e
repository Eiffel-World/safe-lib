-- This file has been generated by EWG. Do not edit. Changes will be lost!
class DRAWPATRECT_STRUCT

inherit

	EWG_STRUCT

	DRAWPATRECT_STRUCT_EXTERNAL
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

	get_wstyle: INTEGER is
			-- Access member `wStyle'
		do
			Result := get_wstyle_external (item)
		end

	set_wstyle (a_value: INTEGER) is
			-- Set member `wStyle'
		do
			set_wstyle_external (item, a_value)
		ensure
			a_value_set: a_value = get_wstyle
		end

	get_wpattern: INTEGER is
			-- Access member `wPattern'
		do
			Result := get_wpattern_external (item)
		end

	set_wpattern (a_value: INTEGER) is
			-- Set member `wPattern'
		do
			set_wpattern_external (item, a_value)
		ensure
			a_value_set: a_value = get_wpattern
		end

end