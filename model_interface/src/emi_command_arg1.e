indexing
	description: "Command with one argument of type A on model M"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class
	EMI_COMMAND_ARG1 [M,A]
inherit
	EMI_COMMAND [M]

feature -- Access

	argument_1: A
		-- First Argument of command.

feature -- Element change

	def_argument_1 (an_argument: A) is
			-- Define argument 1
		do
			argument_1 := an_argument
		ensure
			argument_1 = an_argument
		end

end -- class EMI_COMMAND_ARG1

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
