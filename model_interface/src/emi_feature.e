indexing
	description: "Feature of class M"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

class
	EMI_FEATURE [M]

feature {NONE} -- Initialization

	make (a_reference: EMI_REFERENCE [M]) is
			-- Initialize with `a_reference'.
		require
			a_reference_defined: a_reference /= Void
		do
			reference := a_reference
		end

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			last_precondition_error := Void
			if object = Void then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("Feature call on void target")
			end
		ensure
			--| precondition is True implies last_precondition_error = Void
			--| precondition is False implies last_precondition_error /= Void
		end

feature -- Status report

	last_precondition_error: UT_ERROR
			-- Error of last precondition check

	last_error: UT_ERROR
			-- Error of last feature call.

feature {NONE} -- Implementation

	object: M is
				-- Target object
		do
			Result := reference.item
		end

	reference: EMI_REFERENCE[M]


invariant 
	reference_not_void: reference /= Void

end -- class EMI_FEATURE

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
