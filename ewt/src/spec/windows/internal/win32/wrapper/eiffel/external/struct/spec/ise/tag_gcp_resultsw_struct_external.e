-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagGCP_RESULTSW-- WARNING: could not find good typename, wrapper may contain errors

class TAG_GCP_RESULTSW_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagGCP_RESULTSW)"






		end

	get_lstructsize_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lStructSize"






		end

	set_lstructsize_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lStructSize"






		ensure
			a_value_set: a_value = get_lstructsize_external (a_item)
		end

	get_lpoutstring_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpOutString"






		end

	set_lpoutstring_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpOutString"






		ensure
			a_value_set: a_value = get_lpoutstring_external (a_item)
		end

	get_lporder_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpOrder"






		end

	set_lporder_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpOrder"






		ensure
			a_value_set: a_value = get_lporder_external (a_item)
		end

	get_lpdx_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpDx"






		end

	set_lpdx_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpDx"






		ensure
			a_value_set: a_value = get_lpdx_external (a_item)
		end

	get_lpcaretpos_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpCaretPos"






		end

	set_lpcaretpos_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpCaretPos"






		ensure
			a_value_set: a_value = get_lpcaretpos_external (a_item)
		end

	get_lpclass_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpClass"






		end

	set_lpclass_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpClass"






		ensure
			a_value_set: a_value = get_lpclass_external (a_item)
		end

	get_lpglyphs_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_lpGlyphs"






		end

	set_lpglyphs_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_lpGlyphs"






		ensure
			a_value_set: a_value = get_lpglyphs_external (a_item)
		end

	get_nglyphs_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_nGlyphs"






		end

	set_nglyphs_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_nGlyphs"






		ensure
			a_value_set: a_value = get_nglyphs_external (a_item)
		end

	get_nmaxfit_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_get_nMaxFit"






		end

	set_nmaxfit_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagGCP_RESULTSW_member_set_nMaxFit"






		ensure
			a_value_set: a_value = get_nmaxfit_external (a_item)
		end

end
