indexing
	description: "Adds a character to a ECTK_TEXT"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TEXT_PUT_COMMAND

inherit
	EMI_COMMAND [ECTK_TEXT]

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		end

creation
	make

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.put (INTEGER_.to_character(object.last_event.value \\ 256))
		end

end -- class ECTK_TEXT_PUT_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--