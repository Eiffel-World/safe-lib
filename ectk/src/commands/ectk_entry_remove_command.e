indexing
	description: "Command to remove a character at the current cursor position of a ECTK_ENTRY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_ENTRY_REMOVE_COMMAND

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
			if  last_precondition_error = Void and not (object.is_cursor_within_string) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("is_cursor_within_string: is_cursor_within_string")
			end	
		end

feature -- Status report

	is_precondition_met: BOOLEAN is
			-- Is the precondition for using this feature met?
		do
			Result := object.is_cursor_within_string
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.remove
		end

end -- class ECTK_ENTRY_REMOVE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
