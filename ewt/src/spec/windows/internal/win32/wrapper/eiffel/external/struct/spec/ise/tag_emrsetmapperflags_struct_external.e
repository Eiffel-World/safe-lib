-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagEMRSETMAPPERFLAGS-- WARNING: could not find good typename, wrapper may contain errors

class TAG_EMRSETMAPPERFLAGS_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagEMRSETMAPPERFLAGS)"






		end

	get_dwflags_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETMAPPERFLAGS_member_get_dwFlags"






		end

	set_dwflags_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagEMRSETMAPPERFLAGS_member_set_dwFlags"






		ensure
			a_value_set: a_value = get_dwflags_external (a_item)
		end

end
