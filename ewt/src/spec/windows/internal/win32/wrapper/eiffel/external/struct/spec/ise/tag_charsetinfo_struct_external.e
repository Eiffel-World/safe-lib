-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct tagCHARSETINFO-- WARNING: could not find good typename, wrapper may contain errors

class TAG_CHARSETINFO_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct tagCHARSETINFO)"






		end

	get_cicharset_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCHARSETINFO_member_get_ciCharset"






		end

	set_cicharset_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCHARSETINFO_member_set_ciCharset"






		ensure
			a_value_set: a_value = get_cicharset_external (a_item)
		end

	get_ciacp_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCHARSETINFO_member_get_ciACP"






		end

	set_ciacp_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct_tagCHARSETINFO_member_set_ciACP"






		ensure
			a_value_set: a_value = get_ciacp_external (a_item)
		end

end
