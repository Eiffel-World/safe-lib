-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagPOLYTEXTW-- WARNING: could not find good typename, wrapper may contain errors

class TAG_POLYTEXTW_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagPOLYTEXTW)"






		end

	get_x_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_x"






		end

	set_x_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_x"






		ensure
			a_value_set: a_value = get_x_external (a_item)
		end

	get_y_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_y"






		end

	set_y_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_y"






		ensure
			a_value_set: a_value = get_y_external (a_item)
		end

	get_n_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_n"






		end

	set_n_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_n"






		ensure
			a_value_set: a_value = get_n_external (a_item)
		end

	get_lpstr_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_lpstr"






		end

	set_lpstr_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_lpstr"






		ensure
			a_value_set: a_value = get_lpstr_external (a_item)
		end

	get_uiflags_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_uiFlags"






		end

	set_uiflags_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_uiFlags"






		ensure
			a_value_set: a_value = get_uiflags_external (a_item)
		end

	get_pdx_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_get_pdx"






		end

	set_pdx_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagPOLYTEXTW_member_set_pdx"






		ensure
			a_value_set: a_value = get_pdx_external (a_item)
		end

end
