-- This file has been generated by EWG. Do not edit. Changes will be lost!
class CREATE_PROCESS_DEBUG_INFO_STRUCT

inherit

	EWG_STRUCT

	CREATE_PROCESS_DEBUG_INFO_STRUCT_EXTERNAL
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

	get_hfile: POINTER is
			-- Access member `hFile'
		do
			Result := get_hfile_external (item)
		end

	set_hfile (a_value: POINTER) is
			-- Set member `hFile'
		do
			set_hfile_external (item, a_value)
		ensure
			a_value_set: a_value = get_hfile
		end

	get_hprocess: POINTER is
			-- Access member `hProcess'
		do
			Result := get_hprocess_external (item)
		end

	set_hprocess (a_value: POINTER) is
			-- Set member `hProcess'
		do
			set_hprocess_external (item, a_value)
		ensure
			a_value_set: a_value = get_hprocess
		end

	get_hthread: POINTER is
			-- Access member `hThread'
		do
			Result := get_hthread_external (item)
		end

	set_hthread (a_value: POINTER) is
			-- Set member `hThread'
		do
			set_hthread_external (item, a_value)
		ensure
			a_value_set: a_value = get_hthread
		end

	get_lpbaseofimage: POINTER is
			-- Access member `lpBaseOfImage'
		do
			Result := get_lpbaseofimage_external (item)
		end

	set_lpbaseofimage (a_value: POINTER) is
			-- Set member `lpBaseOfImage'
		do
			set_lpbaseofimage_external (item, a_value)
		ensure
			a_value_set: a_value = get_lpbaseofimage
		end

	get_dwdebuginfofileoffset: INTEGER is
			-- Access member `dwDebugInfoFileOffset'
		do
			Result := get_dwdebuginfofileoffset_external (item)
		end

	set_dwdebuginfofileoffset (a_value: INTEGER) is
			-- Set member `dwDebugInfoFileOffset'
		do
			set_dwdebuginfofileoffset_external (item, a_value)
		ensure
			a_value_set: a_value = get_dwdebuginfofileoffset
		end

	get_ndebuginfosize: INTEGER is
			-- Access member `nDebugInfoSize'
		do
			Result := get_ndebuginfosize_external (item)
		end

	set_ndebuginfosize (a_value: INTEGER) is
			-- Set member `nDebugInfoSize'
		do
			set_ndebuginfosize_external (item, a_value)
		ensure
			a_value_set: a_value = get_ndebuginfosize
		end

	get_lpthreadlocalbase: POINTER is
			-- Access member `lpThreadLocalBase'
		do
			Result := get_lpthreadlocalbase_external (item)
		end

	set_lpthreadlocalbase (a_value: POINTER) is
			-- Set member `lpThreadLocalBase'
		do
			set_lpthreadlocalbase_external (item, a_value)
		ensure
			a_value_set: a_value = get_lpthreadlocalbase
		end

	get_lpstartaddress: POINTER is
			-- Access member `lpStartAddress'
		do
			Result := get_lpstartaddress_external (item)
		end

	set_lpstartaddress (a_value: POINTER) is
			-- Set member `lpStartAddress'
		do
			set_lpstartaddress_external (item, a_value)
		ensure
			a_value_set: a_value = get_lpstartaddress
		end

-- TODO: function pointers not yet callable from
--		struct, use corresponding callback class instead
	get_lpimagename: POINTER is
			-- Access member `lpImageName'
		do
			Result := get_lpimagename_external (item)
		end

	set_lpimagename (a_value: POINTER) is
			-- Set member `lpImageName'
		do
			set_lpimagename_external (item, a_value)
		ensure
			a_value_set: a_value = get_lpimagename
		end

	get_funicode: INTEGER is
			-- Access member `fUnicode'
		do
			Result := get_funicode_external (item)
		end

	set_funicode (a_value: INTEGER) is
			-- Set member `fUnicode'
		do
			set_funicode_external (item, a_value)
		ensure
			a_value_set: a_value = get_funicode
		end

end