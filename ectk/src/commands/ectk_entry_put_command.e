indexing
	description: "Adds a character to a ECTK_ENTRY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_ENTRY_PUT_COMMAND

inherit
	EMI_COMMAND [ECTK_ENTRY[ANY]]
		redefine
			check_precondition
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		end

creation
	make

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			Precursor
			if  last_precondition_error = Void and not (not object.is_full or object.is_overwrite_mode) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_full: not is_full or is_overwrite_mode")
			end	
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.put (INTEGER_.to_character(object.last_event.value \\ 256))
		end

end -- class ECTK_ENTRY_PUT_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
