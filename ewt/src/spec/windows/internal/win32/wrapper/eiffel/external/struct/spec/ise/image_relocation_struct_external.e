-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_RELOCATION-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_RELOCATION_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_RELOCATION)"






		end

	get_symboltableindex_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RELOCATION_member_get_SymbolTableIndex"






		end

	set_symboltableindex_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RELOCATION_member_set_SymbolTableIndex"






		ensure
			a_value_set: a_value = get_symboltableindex_external (a_item)
		end

	get_type_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RELOCATION_member_get_Type"






		end

	set_type_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_RELOCATION_member_set_Type"






		ensure
			a_value_set: a_value = get_type_external (a_item)
		end

end
