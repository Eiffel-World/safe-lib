-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagDRAWTEXTPARAMS-- WARNING: could not find good typename, wrapper may contain errors

class TAG_DRAWTEXTPARAMS_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagDRAWTEXTPARAMS)"






		end

	get_cbsize_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_get_cbSize"






		end

	set_cbsize_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_set_cbSize"






		ensure
			a_value_set: a_value = get_cbsize_external (a_item)
		end

	get_itablength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_get_iTabLength"






		end

	set_itablength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_set_iTabLength"






		ensure
			a_value_set: a_value = get_itablength_external (a_item)
		end

	get_ileftmargin_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_get_iLeftMargin"






		end

	set_ileftmargin_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_set_iLeftMargin"






		ensure
			a_value_set: a_value = get_ileftmargin_external (a_item)
		end

	get_irightmargin_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_get_iRightMargin"






		end

	set_irightmargin_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_set_iRightMargin"






		ensure
			a_value_set: a_value = get_irightmargin_external (a_item)
		end

	get_uilengthdrawn_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_get_uiLengthDrawn"






		end

	set_uilengthdrawn_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagDRAWTEXTPARAMS_member_set_uiLengthDrawn"






		ensure
			a_value_set: a_value = get_uilengthdrawn_external (a_item)
		end

end
