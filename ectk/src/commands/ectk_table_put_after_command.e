indexing
	description: "Command to put a new item after current cursor position (cursor is moved to new item)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_TABLE_PUT_AFTER_COMMAND
inherit
	EMI_COMMAND [ECTK_TABLE[ANY]]

creation
	make


feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			last_precondition_error := Void

			if last_precondition_error = Void and not (reference /= Void and then object /= Void) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("Feature call on void target")
			end

			if  last_precondition_error = Void and not (object.is_model_extendible) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("	an_item_exists: an_item /= void AND is_model_extendible: is_model_extendible")
			end
			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			--| Fixme : should be changed to command with one argument, otherwise code generation will be impossible
			object.item_factory.create_object
			object.put_after (object.item_factory.last_created)
		end

end -- class ECTK_TABLE_PUT_AFTER_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
