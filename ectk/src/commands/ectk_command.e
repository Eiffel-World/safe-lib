indexing
	description: "Objects that execute a command"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECTK_COMMAND

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			last_precondition_error := Void
		ensure
			--| precondition is True implies last_precondition_error = Void
			--| precondition is False implies last_precondition_error /= Void
		end

feature -- Status report

	last_precondition_error: UT_ERROR
			-- Error of last precondition check

feature -- Basic operation

	execute is
			-- Execute command.
		deferred
		end

feature -- Status report

	last_error: UT_ERROR
			-- Error of last execution.
			
end -- class ECTK_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
