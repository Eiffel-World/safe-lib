indexing
	description: "Moves cursor to last cursor position in a ECTK_ENTRY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_ENTRY_FINISH_COMMAND

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
			-- Check the precondition
		do
			Result := True
			last_precondition_error := Void
		ensure then
			Result = True
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			entry.finish
		end

feature {NONE} -- Implementation

	entry: ECTK_ENTRY [ANY]
	
end -- class ECTK_ENTRY_FINISH_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
