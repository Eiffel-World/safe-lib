-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _EXCEPTION_POINTERS-- WARNING: could not find good typename, wrapper may contain errors

class EXCEPTION_POINTERS_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _EXCEPTION_POINTERS)"






		end

	get_exceptionrecord_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EXCEPTION_POINTERS_member_get_ExceptionRecord"






		end

	set_exceptionrecord_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EXCEPTION_POINTERS_member_set_ExceptionRecord"






		ensure
			a_value_set: a_value = get_exceptionrecord_external (a_item)
		end

	get_contextrecord_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EXCEPTION_POINTERS_member_get_ContextRecord"






		end

	set_contextrecord_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EXCEPTION_POINTERS_member_set_ContextRecord"






		ensure
			a_value_set: a_value = get_contextrecord_external (a_item)
		end

end
