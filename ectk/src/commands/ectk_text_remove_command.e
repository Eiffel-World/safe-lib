indexing
	description: "Command to remove a character at the current cursor position of a ECTK_TEXT"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TEXT_REMOVE_COMMAND

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
			if  last_precondition_error = Void and not (not object.after_text) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("	not_after_text: not after_text")
			end	
		end

feature -- Status report

	is_precondition_met: BOOLEAN is
			-- Is the precondition for using this feature met?
		do
			Result := not object.after_text
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.remove_at
		end

end -- class ECTK_TEXT_REMOVE_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
