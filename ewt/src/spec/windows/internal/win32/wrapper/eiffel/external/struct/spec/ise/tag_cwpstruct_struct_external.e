-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagCWPSTRUCT-- WARNING: could not find good typename, wrapper may contain errors

class TAG_CWPSTRUCT_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagCWPSTRUCT)"






		end

	get_lparam_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_get_lParam"






		end

	set_lparam_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_set_lParam"






		ensure
			a_value_set: a_value = get_lparam_external (a_item)
		end

	get_wparam_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_get_wParam"






		end

	set_wparam_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_set_wParam"






		ensure
			a_value_set: a_value = get_wparam_external (a_item)
		end

	get_message_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_get_message"






		end

	set_message_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_set_message"






		ensure
			a_value_set: a_value = get_message_external (a_item)
		end

	get_hwnd_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_get_hwnd"






		end

	set_hwnd_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCWPSTRUCT_member_set_hwnd"






		ensure
			a_value_set: a_value = get_hwnd_external (a_item)
		end

end
