-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_TLS_DIRECTORY32-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_TLS_DIRECTORY32_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_TLS_DIRECTORY32)"






		end

	get_startaddressofrawdata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_StartAddressOfRawData"






		end

	set_startaddressofrawdata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_StartAddressOfRawData"






		ensure
			a_value_set: a_value = get_startaddressofrawdata_external (a_item)
		end

	get_endaddressofrawdata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_EndAddressOfRawData"






		end

	set_endaddressofrawdata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_EndAddressOfRawData"






		ensure
			a_value_set: a_value = get_endaddressofrawdata_external (a_item)
		end

	get_addressofindex_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_AddressOfIndex"






		end

	set_addressofindex_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_AddressOfIndex"






		ensure
			a_value_set: a_value = get_addressofindex_external (a_item)
		end

	get_addressofcallbacks_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_AddressOfCallBacks"






		end

	set_addressofcallbacks_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_AddressOfCallBacks"






		ensure
			a_value_set: a_value = get_addressofcallbacks_external (a_item)
		end

	get_sizeofzerofill_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_SizeOfZeroFill"






		end

	set_sizeofzerofill_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_SizeOfZeroFill"






		ensure
			a_value_set: a_value = get_sizeofzerofill_external (a_item)
		end

	get_characteristics_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_get_Characteristics"






		end

	set_characteristics_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_TLS_DIRECTORY32_member_set_Characteristics"






		ensure
			a_value_set: a_value = get_characteristics_external (a_item)
		end

end
