-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _WIN_SPUB_TRUSTED_PUBLISHER_DATA-- WARNING: could not find good typename, wrapper may contain errors

class WIN_SPUB_TRUSTED_PUBLISHER_DATA_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _WIN_SPUB_TRUSTED_PUBLISHER_DATA)"






		end

	get_hclienttoken_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_SPUB_TRUSTED_PUBLISHER_DATA_member_get_hClientToken"






		end

	set_hclienttoken_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_SPUB_TRUSTED_PUBLISHER_DATA_member_set_hClientToken"






		ensure
			a_value_set: a_value = get_hclienttoken_external (a_item)
		end

	get_lpcertificate_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_SPUB_TRUSTED_PUBLISHER_DATA_member_get_lpCertificate"






		end

	set_lpcertificate_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_SPUB_TRUSTED_PUBLISHER_DATA_member_set_lpCertificate"






		ensure
			a_value_set: a_value = get_lpcertificate_external (a_item)
		end

end
