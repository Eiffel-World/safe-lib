-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _WIN_CERTIFICATE-- WARNING: could not find good typename, wrapper may contain errors

class WIN_CERTIFICATE_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _WIN_CERTIFICATE)"






		end

	get_dwlength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_get_dwLength"






		end

	set_dwlength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_set_dwLength"






		ensure
			a_value_set: a_value = get_dwlength_external (a_item)
		end

	get_wrevision_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_get_wRevision"






		end

	set_wrevision_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_set_wRevision"






		ensure
			a_value_set: a_value = get_wrevision_external (a_item)
		end

	get_wcertificatetype_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_get_wCertificateType"






		end

	set_wcertificatetype_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_CERTIFICATE_member_set_wCertificateType"






		ensure
			a_value_set: a_value = get_wcertificatetype_external (a_item)
		end

end
