-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_EXPORT_DIRECTORY-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_EXPORT_DIRECTORY_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_EXPORT_DIRECTORY)"






		end

	get_characteristics_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_Characteristics"






		end

	set_characteristics_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_Characteristics"






		ensure
			a_value_set: a_value = get_characteristics_external (a_item)
		end

	get_timedatestamp_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_TimeDateStamp"






		end

	set_timedatestamp_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_TimeDateStamp"






		ensure
			a_value_set: a_value = get_timedatestamp_external (a_item)
		end

	get_majorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_MajorVersion"






		end

	set_majorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_MajorVersion"






		ensure
			a_value_set: a_value = get_majorversion_external (a_item)
		end

	get_minorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_MinorVersion"






		end

	set_minorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_MinorVersion"






		ensure
			a_value_set: a_value = get_minorversion_external (a_item)
		end

	get_name_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_Name"






		end

	set_name_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_Name"






		ensure
			a_value_set: a_value = get_name_external (a_item)
		end

	get_base_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_Base"






		end

	set_base_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_Base"






		ensure
			a_value_set: a_value = get_base_external (a_item)
		end

	get_numberoffunctions_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_NumberOfFunctions"






		end

	set_numberoffunctions_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_NumberOfFunctions"






		ensure
			a_value_set: a_value = get_numberoffunctions_external (a_item)
		end

	get_numberofnames_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_NumberOfNames"






		end

	set_numberofnames_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_NumberOfNames"






		ensure
			a_value_set: a_value = get_numberofnames_external (a_item)
		end

	get_addressoffunctions_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_AddressOfFunctions"






		end

	set_addressoffunctions_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_AddressOfFunctions"






		ensure
			a_value_set: a_value = get_addressoffunctions_external (a_item)
		end

	get_addressofnames_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_AddressOfNames"






		end

	set_addressofnames_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_AddressOfNames"






		ensure
			a_value_set: a_value = get_addressofnames_external (a_item)
		end

	get_addressofnameordinals_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_get_AddressOfNameOrdinals"






		end

	set_addressofnameordinals_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_EXPORT_DIRECTORY_member_set_AddressOfNameOrdinals"






		ensure
			a_value_set: a_value = get_addressofnameordinals_external (a_item)
		end

end
