-- This file has been generated by EWG. Do not edit. Changes will be lost!
class JOBOBJECT_END_OF_JOB_TIME_INFORMATION_STRUCT

inherit

	EWG_STRUCT

	JOBOBJECT_END_OF_JOB_TIME_INFORMATION_STRUCT_EXTERNAL
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

	get_endofjobtimeaction: INTEGER is
			-- Access member `EndOfJobTimeAction'
		do
			Result := get_endofjobtimeaction_external (item)
		end

	set_endofjobtimeaction (a_value: INTEGER) is
			-- Set member `EndOfJobTimeAction'
		do
			set_endofjobtimeaction_external (item, a_value)
		ensure
			a_value_set: a_value = get_endofjobtimeaction
		end

end