indexing
	description: "Command to force (put after if needed) a move to the next row in a ECTK_TABLE"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_TABLE_FORCE_FORTH_COMMAND

inherit
	EPAT_COMMAND
	
creation
	make

feature {NONE} -- Initialization

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
			if  (not table.is_last) or table.is_model_extendible then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_is_first: not off and then not is_first")
			end
			Result := last_precondition_error = Void
		end


feature -- Basic operation

	execute is
			-- Execute command.
		do
			if not table.off and then not table.is_last then
				table.forth	
			else
				table.item_factory.create_object
				table.put_after (table.item_factory.last_created)
			end
		end

feature {NONE} -- Implementation

	table: ECTK_TABLE [ANY]

end -- class ECTK_TABLE_FORCE_FORTH_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
