indexing
	description: "Moves cursor to last cursor position in a ECTK_TEXT"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TEXT_FINISH_COMMAND

inherit
	EMI_COMMAND [ECTK_TEXT]

creation
	make

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.finish
		end

end -- class ECTK_TEXT_FINISH_COMMAND



--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--