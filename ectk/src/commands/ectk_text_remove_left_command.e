indexing
	description: "Removes 1 character to the left of the cursor in a ECTK_TEXT "
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TEXT_REMOVE_LEFT_COMMAND

inherit
	EMI_COMMAND [ECTK_TEXT]
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
			if  last_precondition_error = Void and not (not object.before) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_before: not before")
			end			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.remove_left
		end

end -- class ECTK_TEXT_REMOVE_LEFT_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
