-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_BASE_RELOCATION-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_BASE_RELOCATION_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_BASE_RELOCATION)"






		end

	get_virtualaddress_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_BASE_RELOCATION_member_get_VirtualAddress"






		end

	set_virtualaddress_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_BASE_RELOCATION_member_set_VirtualAddress"






		ensure
			a_value_set: a_value = get_virtualaddress_external (a_item)
		end

	get_sizeofblock_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_BASE_RELOCATION_member_get_SizeOfBlock"






		end

	set_sizeofblock_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_BASE_RELOCATION_member_set_SizeOfBlock"






		ensure
			a_value_set: a_value = get_sizeofblock_external (a_item)
		end

end
