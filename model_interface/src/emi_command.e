indexing
	description: "Command on a model M"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:30:02 $"
	revision: "$Revision: 1.2 $"

deferred class
	EMI_COMMAND [M]

inherit		
	EPAT_COMMAND
		redefine
			check_precondition
		end

feature {NONE} -- Initialization

	make (a_reference: EMI_REFERENCE [M]) is
			-- Initialize with `a_reference'.
		require
			a_reference_defined: a_reference /= Void
		do
			reference := a_reference
		end
		
feature -- Status setting

	add_observer (an_observer: EPAT_OBSERVER) is
			-- Add `an_observer'.
		do
			if observers  = Void then
				!!observers.make
			end
			observers.force_last (an_observer)
		end

feature -- Status report

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			last_precondition_error := Void
			if object = Void then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("Feature call on void target")
			end
			Result := last_precondition_error = Void
		end

feature -- Basic operation

	execute is
			-- Execute the command.
		deferred
		end

feature {NONE} -- Implementation

	object: M is
				-- Target object
		do
			Result := reference.item
		end

	reference: EMI_REFERENCE[M]

feature -- {NONE} Implementation

	observers : DS_LINKED_LIST [EPAT_OBSERVER]

	notify_observers is
			-- Notify observers.
		do
			if observers /= Void then
				from
					observers.start
				until
					observers.off
				loop
					observers.item_for_iteration.update
					observers.forth
				end
			end
		end

invariant 
	reference_not_void: reference /= Void

end -- class EMI_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
