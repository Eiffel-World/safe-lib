-- This file has been generated by EWG. Do not edit. Changes will be lost!
class POWER_DEVICE_TIMEOUTS_STRUCT

inherit

	EWG_STRUCT

	POWER_DEVICE_TIMEOUTS_STRUCT_EXTERNAL
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

	get_conservationidletime: INTEGER is
			-- Access member `ConservationIdleTime'
		do
			Result := get_conservationidletime_external (item)
		end

	set_conservationidletime (a_value: INTEGER) is
			-- Set member `ConservationIdleTime'
		do
			set_conservationidletime_external (item, a_value)
		ensure
			a_value_set: a_value = get_conservationidletime
		end

	get_performanceidletime: INTEGER is
			-- Access member `PerformanceIdleTime'
		do
			Result := get_performanceidletime_external (item)
		end

	set_performanceidletime (a_value: INTEGER) is
			-- Set member `PerformanceIdleTime'
		do
			set_performanceidletime_external (item, a_value)
		ensure
			a_value_set: a_value = get_performanceidletime
		end

end