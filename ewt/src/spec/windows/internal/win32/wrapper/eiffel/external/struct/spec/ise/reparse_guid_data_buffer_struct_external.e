-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _REPARSE_GUID_DATA_BUFFER-- WARNING: could not find good typename, wrapper may contain errors

class REPARSE_GUID_DATA_BUFFER_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _REPARSE_GUID_DATA_BUFFER)"






		end

	get_reparsetag_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_get_ReparseTag"






		end

	set_reparsetag_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_set_ReparseTag"






		ensure
			a_value_set: a_value = get_reparsetag_external (a_item)
		end

	get_reparsedatalength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_get_ReparseDataLength"






		end

	set_reparsedatalength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_set_ReparseDataLength"






		ensure
			a_value_set: a_value = get_reparsedatalength_external (a_item)
		end

	get_reserved_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_get_Reserved"






		end

	set_reserved_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__REPARSE_GUID_DATA_BUFFER_member_set_Reserved"






		ensure
			a_value_set: a_value = get_reserved_external (a_item)
		end

end
