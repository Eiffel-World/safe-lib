indexing
	description: "Removes 1 character to the left of the cursor in a ECTK_ENTRY "
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_ENTRY_REMOVE_LEFT_COMMAND

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
			if  not entry.is_empty and not entry.is_first then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_is_empty: not is_empty AND not_is_cursor_first: not is_first")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			entry.remove_left
		end

feature {NONE} -- Implementation

	entry: ECTK_ENTRY [ANY]

end -- class ECTK_ENTRY_REMOVE_LEFT_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
