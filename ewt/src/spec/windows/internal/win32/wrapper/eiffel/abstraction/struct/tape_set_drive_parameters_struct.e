-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAPE_SET_DRIVE_PARAMETERS_STRUCT

inherit

	EWG_STRUCT

	TAPE_SET_DRIVE_PARAMETERS_STRUCT_EXTERNAL
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

	get_ecc: INTEGER is
			-- Access member `ECC'
		do
			Result := get_ecc_external (item)
		end

	set_ecc (a_value: INTEGER) is
			-- Set member `ECC'
		do
			set_ecc_external (item, a_value)
		ensure
			a_value_set: a_value = get_ecc
		end

	get_compression: INTEGER is
			-- Access member `Compression'
		do
			Result := get_compression_external (item)
		end

	set_compression (a_value: INTEGER) is
			-- Set member `Compression'
		do
			set_compression_external (item, a_value)
		ensure
			a_value_set: a_value = get_compression
		end

	get_datapadding: INTEGER is
			-- Access member `DataPadding'
		do
			Result := get_datapadding_external (item)
		end

	set_datapadding (a_value: INTEGER) is
			-- Set member `DataPadding'
		do
			set_datapadding_external (item, a_value)
		ensure
			a_value_set: a_value = get_datapadding
		end

	get_reportsetmarks: INTEGER is
			-- Access member `ReportSetmarks'
		do
			Result := get_reportsetmarks_external (item)
		end

	set_reportsetmarks (a_value: INTEGER) is
			-- Set member `ReportSetmarks'
		do
			set_reportsetmarks_external (item, a_value)
		ensure
			a_value_set: a_value = get_reportsetmarks
		end

	get_eotwarningzonesize: INTEGER is
			-- Access member `EOTWarningZoneSize'
		do
			Result := get_eotwarningzonesize_external (item)
		end

	set_eotwarningzonesize (a_value: INTEGER) is
			-- Set member `EOTWarningZoneSize'
		do
			set_eotwarningzonesize_external (item, a_value)
		ensure
			a_value_set: a_value = get_eotwarningzonesize
		end

end