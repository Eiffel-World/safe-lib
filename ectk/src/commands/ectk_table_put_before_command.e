indexing
	description: "Command to put a new item befor current cursor position (cursor is moved to new item)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_TABLE_PUT_BEFORE_COMMAND

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
			if table.is_model_extendible then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("is_model_extendible: is_model_extendible")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			table.item_factory.create_object
			table.put_before (table.item_factory.last_created)
		end

feature {NONE} -- Implementation

	table: ECTK_TABLE [ANY]

end -- class ECTK_TABLE_PUT_BEFORE_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
