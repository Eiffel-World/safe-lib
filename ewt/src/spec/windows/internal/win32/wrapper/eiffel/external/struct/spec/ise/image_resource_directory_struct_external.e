-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_RESOURCE_DIRECTORY-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_RESOURCE_DIRECTORY_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_RESOURCE_DIRECTORY)"






		end

	get_characteristics_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_Characteristics"






		end

	set_characteristics_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_Characteristics"






		ensure
			a_value_set: a_value = get_characteristics_external (a_item)
		end

	get_timedatestamp_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_TimeDateStamp"






		end

	set_timedatestamp_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_TimeDateStamp"






		ensure
			a_value_set: a_value = get_timedatestamp_external (a_item)
		end

	get_majorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_MajorVersion"






		end

	set_majorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_MajorVersion"






		ensure
			a_value_set: a_value = get_majorversion_external (a_item)
		end

	get_minorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_MinorVersion"






		end

	set_minorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_MinorVersion"






		ensure
			a_value_set: a_value = get_minorversion_external (a_item)
		end

	get_numberofnamedentries_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_NumberOfNamedEntries"






		end

	set_numberofnamedentries_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_NumberOfNamedEntries"






		ensure
			a_value_set: a_value = get_numberofnamedentries_external (a_item)
		end

	get_numberofidentries_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_get_NumberOfIdEntries"






		end

	set_numberofidentries_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RESOURCE_DIRECTORY_member_set_NumberOfIdEntries"






		ensure
			a_value_set: a_value = get_numberofidentries_external (a_item)
		end

end
