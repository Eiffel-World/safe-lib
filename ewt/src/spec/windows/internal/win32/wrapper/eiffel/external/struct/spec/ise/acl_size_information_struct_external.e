-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _ACL_SIZE_INFORMATION-- WARNING: could not find good typename, wrapper may contain errors

class ACL_SIZE_INFORMATION_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _ACL_SIZE_INFORMATION)"






		end

	get_acecount_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_get_AceCount"






		end

	set_acecount_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_set_AceCount"






		ensure
			a_value_set: a_value = get_acecount_external (a_item)
		end

	get_aclbytesinuse_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_get_AclBytesInUse"






		end

	set_aclbytesinuse_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_set_AclBytesInUse"






		ensure
			a_value_set: a_value = get_aclbytesinuse_external (a_item)
		end

	get_aclbytesfree_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_get_AclBytesFree"






		end

	set_aclbytesfree_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__ACL_SIZE_INFORMATION_member_set_AclBytesFree"






		ensure
			a_value_set: a_value = get_aclbytesfree_external (a_item)
		end

end
