indexing
	description: "Objets that delegates the handling of a ECTK_COMMAND to an EMI_COMMAND"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_CONDITIONAL_COMMAND

inherit
	ECTK_COMMAND
		redefine
			check_precondition
		end

creation
	make

feature {NONE} -- Implementation

	make (an_emi_command: EMI_COMMAND[ANY]) is
			-- Initialize with `a_conditional_command.
		require
			an_emi_command_defined: an_emi_command /= Void
		do
			emi_command := an_emi_command
		end
	
feature -- Basic operations

	execute is
			-- Handle the event by executing the conditional command.
		do
			emi_command.execute
			last_error := emi_command.last_error
		end

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			emi_command.check_precondition
			last_precondition_error := emi_command.last_precondition_error
		end

feature {NONE} -- Implementation

	emi_command: EMI_COMMAND[ANY]

end -- class ECTK_CONDITIONAL_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
