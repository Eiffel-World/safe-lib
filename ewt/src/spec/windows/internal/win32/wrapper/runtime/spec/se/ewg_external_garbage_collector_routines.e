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























































































	adopted: FIXED_ARRAY[ANY] is
	once
		 create Result.with_capacity(16)
	end
	
	eif_adopt(a_object: ANY): POINTER is
		 -- A reference to object is stored in `adopted' to avoid
			-- it's collection at GC time.
	require
		a_object_not_void: a_object /= Void
	do
		 if not adopted.fast_has(a_object) then
			adopted.add_last(a_object)
		 end
		 Result := a_object.to_pointer
	ensure
		adopted_not_default_pointer: Result /= Default_pointer
	end
	
	eif_wean(a_pointer: POINTER) is
		 -- Remove the reference to `a_pointer' in adopted.
	require
		a_pointer_not_void: a_pointer /= Default_pointer
	local
		 i: INTEGER
	do
		 i := adopted.fast_index_of(eif_access (a_pointer))
		 if adopted.valid_index(i) then
			adopted.put(Void,i)
			adopted.put(adopted.last,i)
			adopted.remove_last
		 end
	end

	eif_access (a_pointer: POINTER): ANY is
		require
			a_pointer_not_void: a_pointer /= Default_pointer
		do
			Result := a_pointer.to_any
		ensure
			eif_access_not_void: Result /= Void
		end












































end
	
