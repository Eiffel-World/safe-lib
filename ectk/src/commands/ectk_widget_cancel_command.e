indexing
	description: "Command that cancel the changes since the last update (updates the widget with the current model)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_WIDGET_CANCEL_COMMAND

inherit
	EMI_COMMAND [ECTK_WIDGET]

creation
	make

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.refresh
		end


end -- class ECTK_WIDGET_CANCEL_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
