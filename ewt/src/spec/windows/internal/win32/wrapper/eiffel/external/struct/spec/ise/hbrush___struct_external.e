-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct HBRUSH__-- WARNING: could not find good typename, wrapper may contain errors

class HBRUSH___STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct HBRUSH__)"






		end

	get_unused_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_HBRUSH___member_get_unused"






		end

	set_unused_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_HBRUSH___member_set_unused"






		ensure
			a_value_set: a_value = get_unused_external (a_item)
		end

end
