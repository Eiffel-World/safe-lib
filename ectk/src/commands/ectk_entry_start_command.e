indexing
	description: "Command that moves cursor of a ECTK_ENTRY to the first position"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_ENTRY_START_COMMAND

inherit
	EMI_COMMAND [ECTK_ENTRY[ANY]]

creation
	make

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.start
		end

end -- class ECTK_ENTRY_START_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
