indexing
	description: "Command to toggle a check box"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/21 08:26:15 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_CHECK_BOX_TOGGLE_COMMAND

inherit
	ECTK_COMMAND

creation
	make

feature {NONE} -- Initialization

	make (a_check_box: ECTK_CHECK_BOX) is
			-- Initialize with `a_check_box'.
		require
			check_box_exists: a_check_box /= Void
		do
			check_box := a_check_box
		end
		
	
feature -- Basic operation

	execute is
			-- Execute command.
		do
			check_box.toggle
		end

feature {NONE} -- Implementation

	check_box: ectk_check_box
	
	
end -- class ECTK_CHECK_BOX_TOGGLE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
