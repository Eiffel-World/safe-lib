-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _DEBUG_EVENT-- WARNING: could not find good typename, wrapper may contain errors

class DEBUG_EVENT_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _DEBUG_EVENT)"






		end

	get_dwdebugeventcode_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_get_dwDebugEventCode"






		end

	set_dwdebugeventcode_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_set_dwDebugEventCode"






		ensure
			a_value_set: a_value = get_dwdebugeventcode_external (a_item)
		end

	get_dwprocessid_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_get_dwProcessId"






		end

	set_dwprocessid_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_set_dwProcessId"






		ensure
			a_value_set: a_value = get_dwprocessid_external (a_item)
		end

	get_dwthreadid_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_get_dwThreadId"






		end

	set_dwthreadid_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__DEBUG_EVENT_member_set_dwThreadId"






		ensure
			a_value_set: a_value = get_dwthreadid_external (a_item)
		end

end
