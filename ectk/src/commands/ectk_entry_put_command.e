indexing
	description: "Adds a character to a ECTK_ENTRY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_ENTRY_PUT_COMMAND

inherit
	EPAT_COMMAND

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		end

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

feature -- Status setting

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			if  not entry.is_full or entry.is_overwrite_mode then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_full: not is_full or is_overwrite_mode")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			entry.put (INTEGER_.to_character(entry.last_event.value \\ 256))
		end

feature {NONE} -- Implementation

	entry: ECTK_ENTRY [ANY]
	
end -- class ECTK_ENTRY_PUT_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
