-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_RESOURCE_DATA_ENTRY-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_RESOURCE_DATA_ENTRY_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_RESOURCE_DATA_ENTRY)"






		end

	get_offsettodata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_get_OffsetToData"






		end

	set_offsettodata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_set_OffsetToData"






		ensure
			a_value_set: a_value = get_offsettodata_external (a_item)
		end

	get_size_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_get_Size"






		end

	set_size_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_set_Size"






		ensure
			a_value_set: a_value = get_size_external (a_item)
		end

	get_codepage_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_get_CodePage"






		end

	set_codepage_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_set_CodePage"






		ensure
			a_value_set: a_value = get_codepage_external (a_item)
		end

	get_reserved_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_get_Reserved"






		end

	set_reserved_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DATA_ENTRY_member_set_Reserved"






		ensure
			a_value_set: a_value = get_reserved_external (a_item)
		end

end
