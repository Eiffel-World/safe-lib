-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _TOKEN_DEFAULT_DACL-- WARNING: could not find good typename, wrapper may contain errors

class TOKEN_DEFAULT_DACL_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _TOKEN_DEFAULT_DACL)"






		end

	get_defaultdacl_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TOKEN_DEFAULT_DACL_member_get_DefaultDacl"






		end

	set_defaultdacl_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TOKEN_DEFAULT_DACL_member_set_DefaultDacl"






		ensure
			a_value_set: a_value = get_defaultdacl_external (a_item)
		end

end
