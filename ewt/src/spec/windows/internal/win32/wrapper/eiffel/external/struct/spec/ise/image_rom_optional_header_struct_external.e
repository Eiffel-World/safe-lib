-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_ROM_OPTIONAL_HEADER-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_ROM_OPTIONAL_HEADER_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_ROM_OPTIONAL_HEADER)"






		end

	get_magic_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_Magic"






		end

	set_magic_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_Magic"






		ensure
			a_value_set: a_value = get_magic_external (a_item)
		end

	get_majorlinkerversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_MajorLinkerVersion"






		end

	set_majorlinkerversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_MajorLinkerVersion"






		ensure
			a_value_set: a_value = get_majorlinkerversion_external (a_item)
		end

	get_minorlinkerversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_MinorLinkerVersion"






		end

	set_minorlinkerversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_MinorLinkerVersion"






		ensure
			a_value_set: a_value = get_minorlinkerversion_external (a_item)
		end

	get_sizeofcode_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_SizeOfCode"






		end

	set_sizeofcode_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_SizeOfCode"






		ensure
			a_value_set: a_value = get_sizeofcode_external (a_item)
		end

	get_sizeofinitializeddata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_SizeOfInitializedData"






		end

	set_sizeofinitializeddata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_SizeOfInitializedData"






		ensure
			a_value_set: a_value = get_sizeofinitializeddata_external (a_item)
		end

	get_sizeofuninitializeddata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_SizeOfUninitializedData"






		end

	set_sizeofuninitializeddata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_SizeOfUninitializedData"






		ensure
			a_value_set: a_value = get_sizeofuninitializeddata_external (a_item)
		end

	get_addressofentrypoint_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_AddressOfEntryPoint"






		end

	set_addressofentrypoint_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_AddressOfEntryPoint"






		ensure
			a_value_set: a_value = get_addressofentrypoint_external (a_item)
		end

	get_baseofcode_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_BaseOfCode"






		end

	set_baseofcode_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_BaseOfCode"






		ensure
			a_value_set: a_value = get_baseofcode_external (a_item)
		end

	get_baseofdata_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_BaseOfData"






		end

	set_baseofdata_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_BaseOfData"






		ensure
			a_value_set: a_value = get_baseofdata_external (a_item)
		end

	get_baseofbss_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_BaseOfBss"






		end

	set_baseofbss_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_BaseOfBss"






		ensure
			a_value_set: a_value = get_baseofbss_external (a_item)
		end

	get_gprmask_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_GprMask"






		end

	set_gprmask_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_GprMask"






		ensure
			a_value_set: a_value = get_gprmask_external (a_item)
		end

	get_gpvalue_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_get_GpValue"






		end

	set_gpvalue_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_ROM_OPTIONAL_HEADER_member_set_GpValue"






		ensure
			a_value_set: a_value = get_gpvalue_external (a_item)
		end

end
