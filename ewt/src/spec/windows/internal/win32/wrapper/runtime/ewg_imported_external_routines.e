indexing

	description:

		"Imported external routines that are not portable"

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class EWG_IMPORTED_EXTERNAL_ROUTINES

feature {ANY} -- Access

	EXTERNAL_GARBAGE_COLLECTOR_: EWG_EXTERNAL_GARBAGE_COLLECTOR_ROUTINES is
			-- External garbage collector routines
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

	EXTERNAL_MEMORY_: expanded EWG_EXTERNAL_MEMORY_ROUTINES
			-- External memory routines
			-- Needs to be expanded because sometimes routines from
			-- there need to be called from withing `dispose'.

	EXTERNAL_STRING_: EWG_EXTERNAL_STRING_ROUTINES is
			-- External string routines
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

end
