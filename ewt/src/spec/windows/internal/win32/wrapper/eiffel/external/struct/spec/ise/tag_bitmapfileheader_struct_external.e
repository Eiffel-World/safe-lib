-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagBITMAPFILEHEADER-- WARNING: could not find good typename, wrapper may contain errors

class TAG_BITMAPFILEHEADER_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagBITMAPFILEHEADER)"






		end

	get_bftype_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_get_bfType"






		end

	set_bftype_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_set_bfType"






		ensure
			a_value_set: a_value = get_bftype_external (a_item)
		end

	get_bfsize_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_get_bfSize"






		end

	set_bfsize_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_set_bfSize"






		ensure
			a_value_set: a_value = get_bfsize_external (a_item)
		end

	get_bfreserved1_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_get_bfReserved1"






		end

	set_bfreserved1_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_set_bfReserved1"






		ensure
			a_value_set: a_value = get_bfreserved1_external (a_item)
		end

	get_bfreserved2_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_get_bfReserved2"






		end

	set_bfreserved2_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_set_bfReserved2"






		ensure
			a_value_set: a_value = get_bfreserved2_external (a_item)
		end

	get_bfoffbits_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_get_bfOffBits"






		end

	set_bfoffbits_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagBITMAPFILEHEADER_member_set_bfOffBits"






		ensure
			a_value_set: a_value = get_bfoffbits_external (a_item)
		end

end
