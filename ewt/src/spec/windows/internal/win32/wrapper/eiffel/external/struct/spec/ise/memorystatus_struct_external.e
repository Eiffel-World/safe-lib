-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- wrapper for struct: struct _MEMORYSTATUS-- WARNING: could not find good typename, wrapper may contain errors

class MEMORYSTATUS_STRUCT_EXTERNAL

feature {NONE} -- Implementation

	sizeof_external: INTEGER is
		external






			"C [macro <my_winbase.h>]: EIF_INTEGER"
		alias
			"sizeof(struct _MEMORYSTATUS)"






		end

	get_dwlength_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwLength"






		end

	set_dwlength_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwLength"






		ensure
			a_value_set: a_value = get_dwlength_external (a_item)
		end

	get_dwmemoryload_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwMemoryLoad"






		end

	set_dwmemoryload_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwMemoryLoad"






		ensure
			a_value_set: a_value = get_dwmemoryload_external (a_item)
		end

	get_dwtotalphys_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwTotalPhys"






		end

	set_dwtotalphys_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwTotalPhys"






		ensure
			a_value_set: a_value = get_dwtotalphys_external (a_item)
		end

	get_dwavailphys_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwAvailPhys"






		end

	set_dwavailphys_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwAvailPhys"






		ensure
			a_value_set: a_value = get_dwavailphys_external (a_item)
		end

	get_dwtotalpagefile_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwTotalPageFile"






		end

	set_dwtotalpagefile_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwTotalPageFile"






		ensure
			a_value_set: a_value = get_dwtotalpagefile_external (a_item)
		end

	get_dwavailpagefile_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwAvailPageFile"






		end

	set_dwavailpagefile_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwAvailPageFile"






		ensure
			a_value_set: a_value = get_dwavailpagefile_external (a_item)
		end

	get_dwtotalvirtual_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwTotalVirtual"






		end

	set_dwtotalvirtual_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwTotalVirtual"






		ensure
			a_value_set: a_value = get_dwtotalvirtual_external (a_item)
		end

	get_dwavailvirtual_external (item: POINTER): INTEGER is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_get_dwAvailVirtual"






		end

	set_dwavailvirtual_external (a_item: POINTER; a_value: INTEGER) is
		external






			"C [macro <c\struct\ewg_struct_c_glue_code.h>]"
		alias
			"ewg_struct_macro_struct__MEMORYSTATUS_member_set_dwAvailVirtual"






		ensure
			a_value_set: a_value = get_dwavailvirtual_external (a_item)
		end

end
