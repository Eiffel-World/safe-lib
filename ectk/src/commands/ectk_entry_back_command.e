indexing
	description: "Command that moves cursor of ECTK_ENTRY to the right"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_ENTRY_BACK_COMMAND

inherit
	EMI_COMMAND [ECTK_ENTRY[ANY]]
		redefine
			check_precondition
		end

creation
	make

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			Precursor
			if  last_precondition_error = Void and not (not object.is_first) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_is_first: not is_first")
			end	
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.back
		end

end -- class ECTK_ENTRY_BACK_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
