-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _WIN_TRUST_ACTDATA_SUBJECT_ONLY-- WARNING: could not find good typename, wrapper may contain errors

class WIN_TRUST_ACTDATA_SUBJECT_ONLY_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _WIN_TRUST_ACTDATA_SUBJECT_ONLY)"






		end

	get_subjecttype_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_TRUST_ACTDATA_SUBJECT_ONLY_member_get_SubjectType"






		end

	set_subjecttype_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_TRUST_ACTDATA_SUBJECT_ONLY_member_set_SubjectType"






		ensure
			a_value_set: a_value = get_subjecttype_external (a_item)
		end

	get_subject_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_TRUST_ACTDATA_SUBJECT_ONLY_member_get_Subject"






		end

	set_subject_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__WIN_TRUST_ACTDATA_SUBJECT_ONLY_member_set_Subject"






		ensure
			a_value_set: a_value = get_subject_external (a_item)
		end

end
