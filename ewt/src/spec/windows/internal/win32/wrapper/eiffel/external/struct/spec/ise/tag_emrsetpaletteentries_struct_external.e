-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagEMRSETPALETTEENTRIES-- WARNING: could not find good typename, wrapper may contain errors

class TAG_EMRSETPALETTEENTRIES_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagEMRSETPALETTEENTRIES)"






		end

	get_ihpal_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_get_ihPal"






		end

	set_ihpal_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_set_ihPal"






		ensure
			a_value_set: a_value = get_ihpal_external (a_item)
		end

	get_istart_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_get_iStart"






		end

	set_istart_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_set_iStart"






		ensure
			a_value_set: a_value = get_istart_external (a_item)
		end

	get_centries_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_get_cEntries"






		end

	set_centries_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETPALETTEENTRIES_member_set_cEntries"






		ensure
			a_value_set: a_value = get_centries_external (a_item)
		end

end
