indexing

	description:

		"External Garbage Collector routines"

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"


class EWG_EXTERNAL_GARBAGE_COLLECTOR_ROUTINES

feature

















































-- TODO

















































































	eif_adopt (a_object: ANY): POINTER is
		do
			ve_adopt (a_object)
			Result := wg_object_to_pointer (a_object)
		end

	wg_object_to_pointer (a_object: ANY): POINTER is
		external
			"C"
		alias
			"ewg_object_to_pointer"
		end
	
	ve_adopt (a_object: ANY) is
		require
			a_object_not_void: a_object /= Void
		external
			"C"
		alias
			"eif_adopt"
		end

	eif_wean (a_pointer: POINTER) is
		require
			a_pointer_not_void: a_pointer /= Default_pointer
		external
			"C"
		alias
			"eif_wean"
		end

	eif_access (a_pointer: POINTER): ANY is
		require
			a_pointer_not_void: a_pointer /= Default_pointer
		external
			"C"
		alias
			"eif_access"
		ensure
			eif_access_not_void: Result /= Void
		end

end
	
