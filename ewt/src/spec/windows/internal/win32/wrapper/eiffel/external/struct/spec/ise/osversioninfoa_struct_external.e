-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _OSVERSIONINFOA-- WARNING: could not find good typename, wrapper may contain errors

class OSVERSIONINFOA_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _OSVERSIONINFOA)"






		end

	get_dwosversioninfosize_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_get_dwOSVersionInfoSize"






		end

	set_dwosversioninfosize_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_set_dwOSVersionInfoSize"






		ensure
			a_value_set: a_value = get_dwosversioninfosize_external (a_item)
		end

	get_dwmajorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_get_dwMajorVersion"






		end

	set_dwmajorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_set_dwMajorVersion"






		ensure
			a_value_set: a_value = get_dwmajorversion_external (a_item)
		end

	get_dwminorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_get_dwMinorVersion"






		end

	set_dwminorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_set_dwMinorVersion"






		ensure
			a_value_set: a_value = get_dwminorversion_external (a_item)
		end

	get_dwbuildnumber_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_get_dwBuildNumber"






		end

	set_dwbuildnumber_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_set_dwBuildNumber"






		ensure
			a_value_set: a_value = get_dwbuildnumber_external (a_item)
		end

	get_dwplatformid_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_get_dwPlatformId"






		end

	set_dwplatformid_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__OSVERSIONINFOA_member_set_dwPlatformId"






		ensure
			a_value_set: a_value = get_dwplatformid_external (a_item)
		end

end
