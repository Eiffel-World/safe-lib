-- This file has been generated by EWG. Do not edit. Changes will be lost!
class IMAGE_BOUND_IMPORT_DESCRIPTOR_STRUCT

inherit

	EWG_STRUCT

	IMAGE_BOUND_IMPORT_DESCRIPTOR_STRUCT_EXTERNAL
		export
			{NONE} all
		end

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {NONE} -- Implementation

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	get_timedatestamp: INTEGER is
			-- Access member `TimeDateStamp'
		do
			Result := get_timedatestamp_external (item)
		end

	set_timedatestamp (a_value: INTEGER) is
			-- Set member `TimeDateStamp'
		do
			set_timedatestamp_external (item, a_value)
		ensure
			a_value_set: a_value = get_timedatestamp
		end

	get_offsetmodulename: INTEGER is
			-- Access member `OffsetModuleName'
		do
			Result := get_offsetmodulename_external (item)
		end

	set_offsetmodulename (a_value: INTEGER) is
			-- Set member `OffsetModuleName'
		do
			set_offsetmodulename_external (item, a_value)
		ensure
			a_value_set: a_value = get_offsetmodulename
		end

	get_numberofmoduleforwarderrefs: INTEGER is
			-- Access member `NumberOfModuleForwarderRefs'
		do
			Result := get_numberofmoduleforwarderrefs_external (item)
		end

	set_numberofmoduleforwarderrefs (a_value: INTEGER) is
			-- Set member `NumberOfModuleForwarderRefs'
		do
			set_numberofmoduleforwarderrefs_external (item, a_value)
		ensure
			a_value_set: a_value = get_numberofmoduleforwarderrefs
		end

end