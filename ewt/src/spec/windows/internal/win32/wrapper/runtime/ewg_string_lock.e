indexing

	description:

		"Locks Eiffel STRING objects, so they can be passed to the C side"

	note: "This class is know to have problems. Use only if you know exactly what you do"
	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class EWG_STRING_LOCK

inherit

	EWG_LOCK [STRING]
		redefine
			lock,
			unlock,
			make_unlocked
		end
	
	EWG_IMPORTED_EXTERNAL_ROUTINES
		export
			{NONE} all
		end

creation

	make_locked,
	make_unlocked

feature {NONE} -- Initialisation

	make_unlocked (a_object: STRING) is
		do
			Precursor (a_object)
			zero_terminated_string := default_pointer
		end
	
feature {ANY} -- Queries

	zero_terminated_string: POINTER
			-- pointer to the zero terminated string containing
			-- the same characters as `object'.

feature {ANY} -- Routines
	
	lock is
		do
			Precursor
			zero_terminated_string := EXTERNAL_STRING_.string_to_pointer (object)
		end

	unlock is
		do
			Precursor
			zero_terminated_string := default_pointer
		end

invariant

	is_locked_equals_valid_zero_terminated_string: not is_locked = (zero_terminated_string = default_pointer)
	
end
