indexing
	description: "Command to remove item at current cursor position"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TABLE_REMOVE_COMMAND
inherit
	EMI_COMMAND [ECTK_TABLE[ANY]]
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
			if  last_precondition_error = Void and not (not object.off) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_off: not off")
			end
		end


feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.remove
		end


end -- class ECTK_TABLE_REMOVE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
