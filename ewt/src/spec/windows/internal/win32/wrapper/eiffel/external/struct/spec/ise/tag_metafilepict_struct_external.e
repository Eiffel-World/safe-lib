-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagMETAFILEPICT-- WARNING: could not find good typename, wrapper may contain errors

class TAG_METAFILEPICT_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagMETAFILEPICT)"






		end

	get_mm_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_get_mm"






		end

	set_mm_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_set_mm"






		ensure
			a_value_set: a_value = get_mm_external (a_item)
		end

	get_xext_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_get_xExt"






		end

	set_xext_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_set_xExt"






		ensure
			a_value_set: a_value = get_xext_external (a_item)
		end

	get_yext_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_get_yExt"






		end

	set_yext_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_set_yExt"






		ensure
			a_value_set: a_value = get_yext_external (a_item)
		end

	get_hmf_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_get_hMF"






		end

	set_hmf_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagMETAFILEPICT_member_set_hMF"






		ensure
			a_value_set: a_value = get_hmf_external (a_item)
		end

end
