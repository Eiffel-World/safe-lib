-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagEMREXTFLOODFILL-- WARNING: could not find good typename, wrapper may contain errors

class TAG_EMREXTFLOODFILL_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagEMREXTFLOODFILL)"






		end

	get_crcolor_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMREXTFLOODFILL_member_get_crColor"






		end

	set_crcolor_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMREXTFLOODFILL_member_set_crColor"






		ensure
			a_value_set: a_value = get_crcolor_external (a_item)
		end

	get_imode_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMREXTFLOODFILL_member_get_iMode"






		end

	set_imode_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMREXTFLOODFILL_member_set_iMode"






		ensure
			a_value_set: a_value = get_imode_external (a_item)
		end

end
