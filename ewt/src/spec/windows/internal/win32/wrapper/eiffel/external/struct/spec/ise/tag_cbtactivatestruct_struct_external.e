-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagCBTACTIVATESTRUCT-- WARNING: could not find good typename, wrapper may contain errors

class TAG_CBTACTIVATESTRUCT_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagCBTACTIVATESTRUCT)"






		end

	get_fmouse_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCBTACTIVATESTRUCT_member_get_fMouse"






		end

	set_fmouse_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCBTACTIVATESTRUCT_member_set_fMouse"






		ensure
			a_value_set: a_value = get_fmouse_external (a_item)
		end

	get_hwndactive_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCBTACTIVATESTRUCT_member_get_hWndActive"






		end

	set_hwndactive_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCBTACTIVATESTRUCT_member_set_hWndActive"






		ensure
			a_value_set: a_value = get_hwndactive_external (a_item)
		end

end
