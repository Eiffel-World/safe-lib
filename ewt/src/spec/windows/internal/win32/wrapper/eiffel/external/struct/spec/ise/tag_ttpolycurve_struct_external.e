-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagTTPOLYCURVE-- WARNING: could not find good typename, wrapper may contain errors

class TAG_TTPOLYCURVE_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagTTPOLYCURVE)"






		end

	get_wtype_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagTTPOLYCURVE_member_get_wType"






		end

	set_wtype_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagTTPOLYCURVE_member_set_wType"






		ensure
			a_value_set: a_value = get_wtype_external (a_item)
		end

	get_cpfx_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagTTPOLYCURVE_member_get_cpfx"






		end

	set_cpfx_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagTTPOLYCURVE_member_set_cpfx"






		ensure
			a_value_set: a_value = get_cpfx_external (a_item)
		end

end
