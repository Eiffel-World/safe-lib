-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _IMAGE_LOAD_CONFIG_DIRECTORY-- WARNING: could not find good typename, wrapper may contain errors

class IMAGE_LOAD_CONFIG_DIRECTORY_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _IMAGE_LOAD_CONFIG_DIRECTORY)"






		end

	get_characteristics_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_Characteristics"






		end

	set_characteristics_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_Characteristics"






		ensure
			a_value_set: a_value = get_characteristics_external (a_item)
		end

	get_timedatestamp_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_TimeDateStamp"






		end

	set_timedatestamp_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_TimeDateStamp"






		ensure
			a_value_set: a_value = get_timedatestamp_external (a_item)
		end

	get_majorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_MajorVersion"






		end

	set_majorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_MajorVersion"






		ensure
			a_value_set: a_value = get_majorversion_external (a_item)
		end

	get_minorversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_MinorVersion"






		end

	set_minorversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_MinorVersion"






		ensure
			a_value_set: a_value = get_minorversion_external (a_item)
		end

	get_globalflagsclear_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_GlobalFlagsClear"






		end

	set_globalflagsclear_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_GlobalFlagsClear"






		ensure
			a_value_set: a_value = get_globalflagsclear_external (a_item)
		end

	get_globalflagsset_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_GlobalFlagsSet"






		end

	set_globalflagsset_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_GlobalFlagsSet"






		ensure
			a_value_set: a_value = get_globalflagsset_external (a_item)
		end

	get_criticalsectiondefaulttimeout_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_CriticalSectionDefaultTimeout"






		end

	set_criticalsectiondefaulttimeout_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_CriticalSectionDefaultTimeout"






		ensure
			a_value_set: a_value = get_criticalsectiondefaulttimeout_external (a_item)
		end

	get_decommitfreeblockthreshold_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_DeCommitFreeBlockThreshold"






		end

	set_decommitfreeblockthreshold_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_DeCommitFreeBlockThreshold"






		ensure
			a_value_set: a_value = get_decommitfreeblockthreshold_external (a_item)
		end

	get_decommittotalfreethreshold_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_DeCommitTotalFreeThreshold"






		end

	set_decommittotalfreethreshold_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_DeCommitTotalFreeThreshold"






		ensure
			a_value_set: a_value = get_decommittotalfreethreshold_external (a_item)
		end

	get_lockprefixtable_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_LockPrefixTable"






		end

	set_lockprefixtable_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_LockPrefixTable"






		ensure
			a_value_set: a_value = get_lockprefixtable_external (a_item)
		end

	get_maximumallocationsize_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_MaximumAllocationSize"






		end

	set_maximumallocationsize_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_MaximumAllocationSize"






		ensure
			a_value_set: a_value = get_maximumallocationsize_external (a_item)
		end

	get_virtualmemorythreshold_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_VirtualMemoryThreshold"






		end

	set_virtualmemorythreshold_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_VirtualMemoryThreshold"






		ensure
			a_value_set: a_value = get_virtualmemorythreshold_external (a_item)
		end

	get_processheapflags_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_ProcessHeapFlags"






		end

	set_processheapflags_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_ProcessHeapFlags"






		ensure
			a_value_set: a_value = get_processheapflags_external (a_item)
		end

	get_processaffinitymask_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_ProcessAffinityMask"






		end

	set_processaffinitymask_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_ProcessAffinityMask"






		ensure
			a_value_set: a_value = get_processaffinitymask_external (a_item)
		end

	get_csdversion_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_CSDVersion"






		end

	set_csdversion_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_CSDVersion"






		ensure
			a_value_set: a_value = get_csdversion_external (a_item)
		end

	get_reserved1_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_Reserved1"






		end

	set_reserved1_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_Reserved1"






		ensure
			a_value_set: a_value = get_reserved1_external (a_item)
		end

	get_editlist_external (item: POINTER): POINTER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_get_EditList"






		end

	set_editlist_external (a_item: POINTER; a_value: POINTER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__IMAGE_LOAD_CONFIG_DIRECTORY_member_set_EditList"






		ensure
			a_value_set: a_value = get_editlist_external (a_item)
		end

end
