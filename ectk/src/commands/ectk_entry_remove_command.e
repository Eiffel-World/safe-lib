indexing
	description: "Command to remove a character at the current cursor position of a ECTK_ENTRY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_ENTRY_REMOVE_COMMAND

inherit
	EPAT_COMMAND

creation
	make

feature {NONE} -- Initialization

	make (an_entry: ECTK_ENTRY [ANY]) is
			-- Initialize with `an_entry'.
		require
			entry_exists: an_entry /= Void
		do
			entry := an_entry
		end
		
feature -- Status report

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			if  entry.is_cursor_within_string then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("is_cursor_within_string: is_cursor_within_string")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			entry.remove
		end

feature {NONE} -- Implementation

	entry: ECTK_ENTRY [ANY]

end -- class ECTK_ENTRY_REMOVE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
