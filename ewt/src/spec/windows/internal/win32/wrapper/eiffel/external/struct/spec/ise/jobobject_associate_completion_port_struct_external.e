-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _JOBOBJECT_ASSOCIATE_COMPLETION_PORT-- WARNING: could not find good typename, wrapper may contain errors

class JOBOBJECT_ASSOCIATE_COMPLETION_PORT_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _JOBOBJECT_ASSOCIATE_COMPLETION_PORT)"






		end

	get_completionkey_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__JOBOBJECT_ASSOCIATE_COMPLETION_PORT_member_get_CompletionKey"






		end

	set_completionkey_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__JOBOBJECT_ASSOCIATE_COMPLETION_PORT_member_set_CompletionKey"






		ensure
			a_value_set: a_value = get_completionkey_external (a_item)
		end

	get_completionport_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__JOBOBJECT_ASSOCIATE_COMPLETION_PORT_member_get_CompletionPort"






		end

	set_completionport_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__JOBOBJECT_ASSOCIATE_COMPLETION_PORT_member_set_CompletionPort"






		ensure
			a_value_set: a_value = get_completionport_external (a_item)
		end

end
