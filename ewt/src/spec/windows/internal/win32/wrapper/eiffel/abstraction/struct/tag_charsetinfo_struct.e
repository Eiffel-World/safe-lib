-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_CHARSETINFO_STRUCT

inherit

	EWG_STRUCT

	TAG_CHARSETINFO_STRUCT_EXTERNAL
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

	get_cicharset: INTEGER is
			-- Access member `ciCharset'
		do
			Result := get_cicharset_external (item)
		end

	set_cicharset (a_value: INTEGER) is
			-- Set member `ciCharset'
		do
			set_cicharset_external (item, a_value)
		ensure
			a_value_set: a_value = get_cicharset
		end

	get_ciacp: INTEGER is
			-- Access member `ciACP'
		do
			Result := get_ciacp_external (item)
		end

	set_ciacp (a_value: INTEGER) is
			-- Set member `ciACP'
		do
			set_ciacp_external (item, a_value)
		ensure
			a_value_set: a_value = get_ciacp
		end

end