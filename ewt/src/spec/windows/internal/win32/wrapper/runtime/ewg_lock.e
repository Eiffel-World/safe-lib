indexing

	description:

		"Locks Eiffel Objects, so they can be passed to the C side"

	note: "This class is know to have problems. Use only if you know exactly what you do"
	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class EWG_LOCK [G]

inherit

	MEMORY
		redefine
			dispose
		end

	EWG_IMPORTED_EXTERNAL_ROUTINES
		export
			{NONE} all
		end
	
creation

	make_locked,
	make_unlocked
	
feature {NONE} -- Initialisation

	make_locked (a_object: G) is
		require
			a_object_not_void: a_object /= Void
		do
			object := a_object
			lock
		ensure
			a_object_set: object = a_object
			is_locked: is_locked
		end

	make_unlocked (a_object: G) is
		require
			a_object_not_void: a_object /= Void
		do
			object := a_object
		ensure
			a_object_set: object = a_object
			is_locked: not is_locked
		end

feature {ANY} -- Queries

	is_locked: BOOLEAN

	object: G

	pointer: POINTER
	
feature {ANY} -- Routines

	lock is
		require
			is_unlocked: not is_locked
		do
			print ("locking " + object.out + "%N")
			pointer := EXTERNAL_GARBAGE_COLLECTOR_.eif_freeze (object)
			is_locked := True
		ensure
			is_locked: is_locked
		end

	unlock is
		require
			is_locked: is_locked
		do
			print ("unlocking " + object.out + "%N")
			EXTERNAL_GARBAGE_COLLECTOR_.eif_unfreeze (pointer)
			pointer := default_pointer
			is_locked := False
		ensure
			is_unlocked: not is_locked
		end

feature {NONE} -- Implementation

	dispose is
		do
			if is_locked then
				unlock
			end
		end

invariant

	object_not_void: object /= Void

	is_locked_equals_pointer_not_default: is_locked = (pointer /= default_pointer)
	
end
