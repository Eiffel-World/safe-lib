-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _EVENTLOGRECORD-- WARNING: could not find good typename, wrapper may contain errors

class EVENTLOGRECORD_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _EVENTLOGRECORD)"






		end

	get_length_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_Length"






		end

	set_length_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_Length"






		ensure
			a_value_set: a_value = get_length_external (a_item)
		end

	get_reserved_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_Reserved"






		end

	set_reserved_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_Reserved"






		ensure
			a_value_set: a_value = get_reserved_external (a_item)
		end

	get_recordnumber_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_RecordNumber"






		end

	set_recordnumber_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_RecordNumber"






		ensure
			a_value_set: a_value = get_recordnumber_external (a_item)
		end

	get_timegenerated_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_TimeGenerated"






		end

	set_timegenerated_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_TimeGenerated"






		ensure
			a_value_set: a_value = get_timegenerated_external (a_item)
		end

	get_timewritten_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_TimeWritten"






		end

	set_timewritten_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_TimeWritten"






		ensure
			a_value_set: a_value = get_timewritten_external (a_item)
		end

	get_eventid_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_EventID"






		end

	set_eventid_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_EventID"






		ensure
			a_value_set: a_value = get_eventid_external (a_item)
		end

	get_eventtype_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_EventType"






		end

	set_eventtype_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_EventType"






		ensure
			a_value_set: a_value = get_eventtype_external (a_item)
		end

	get_numstrings_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_NumStrings"






		end

	set_numstrings_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_NumStrings"






		ensure
			a_value_set: a_value = get_numstrings_external (a_item)
		end

	get_eventcategory_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_EventCategory"






		end

	set_eventcategory_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_EventCategory"






		ensure
			a_value_set: a_value = get_eventcategory_external (a_item)
		end

	get_reservedflags_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_ReservedFlags"






		end

	set_reservedflags_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_ReservedFlags"






		ensure
			a_value_set: a_value = get_reservedflags_external (a_item)
		end

	get_closingrecordnumber_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_ClosingRecordNumber"






		end

	set_closingrecordnumber_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_ClosingRecordNumber"






		ensure
			a_value_set: a_value = get_closingrecordnumber_external (a_item)
		end

	get_stringoffset_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_StringOffset"






		end

	set_stringoffset_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_StringOffset"






		ensure
			a_value_set: a_value = get_stringoffset_external (a_item)
		end

	get_usersidlength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_UserSidLength"






		end

	set_usersidlength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_UserSidLength"






		ensure
			a_value_set: a_value = get_usersidlength_external (a_item)
		end

	get_usersidoffset_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_UserSidOffset"






		end

	set_usersidoffset_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_UserSidOffset"






		ensure
			a_value_set: a_value = get_usersidoffset_external (a_item)
		end

	get_datalength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_DataLength"






		end

	set_datalength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_DataLength"






		ensure
			a_value_set: a_value = get_datalength_external (a_item)
		end

	get_dataoffset_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_get_DataOffset"






		end

	set_dataoffset_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__EVENTLOGRECORD_member_set_DataOffset"






		ensure
			a_value_set: a_value = get_dataoffset_external (a_item)
		end

end
