-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _TAPE_GET_POSITION-- WARNING: could not find good typename, wrapper may contain errors

class TAPE_GET_POSITION_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _TAPE_GET_POSITION)"






		end

	get_type_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TAPE_GET_POSITION_member_get_Type"






		end

	set_type_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TAPE_GET_POSITION_member_set_Type"






		ensure
			a_value_set: a_value = get_type_external (a_item)
		end

	get_partition_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TAPE_GET_POSITION_member_get_Partition"






		end

	set_partition_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__TAPE_GET_POSITION_member_set_Partition"






		ensure
			a_value_set: a_value = get_partition_external (a_item)
		end

end
