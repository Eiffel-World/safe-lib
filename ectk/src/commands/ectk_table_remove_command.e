indexing
	description: "Command to remove item at current cursor position"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_TABLE_REMOVE_COMMAND

inherit
	EPAT_COMMAND
	
creation
	make

feature {NON} -- Initialization

	make (a_table: ECTK_TABLE [ANY]) is
			-- Initialize with `a_table'.
		require
			table_exists: a_table /= Void
		do
			table := a_table
		end
		
feature -- Status setting

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			if  not table.off then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_off: not off")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			table.remove
		end

feature {NONE} -- Implementation

	table: ECTK_TABLE [ANY]

end -- class ECTK_TABLE_REMOVE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
