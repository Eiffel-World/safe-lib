indexing
	description: "Objects that execute operations when a precondition is met, descendants should redefine check_precondition if needed"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:20:39 $"
	revision: "$Revision: 1.1 $"

deferred class
	EPAT_COMMAND


feature -- Status report

	check_precondition: BOOLEAN is
			-- Check the precondition
		deferred
		ensure
			precondition_is_met: Result implies last_precondition_error = Void
			precondition_is_not_met: not Result implies last_precondition_error /= Void
		end

	last_precondition_error: UT_ERROR
			-- Error of last precondition check

feature -- Basic operation

	execute is
			-- Execute command.
		require
			check_precondition
		deferred
		end

feature -- Status report

	last_error: UT_ERROR
			-- Error of last execution.
			
end -- class EPAT_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
