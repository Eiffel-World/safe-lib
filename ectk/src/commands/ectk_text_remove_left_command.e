indexing
	description: "Removes 1 character to the left of the cursor in a ECTK_TEXT "
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_TEXT_REMOVE_LEFT_COMMAND

inherit
	EPAT_COMMAND
	
creation
	make

feature {NON} -- Initialization

	make (an_ectk_text: ECTK_TEXT) is
			-- Initialize with `an_ectk_text'.
		require
			ectk_text_exists: an_ectk_text /= Void
		do
			ectk_text := an_ectk_text
		end
		
feature -- Status setting

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			if  not ectk_text.before then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_before: not before")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			ectk_text.remove_left
		end

feature {NONE} -- Implementation

	ectk_text: ECTK_TEXT
	
end -- class ECTK_TEXT_REMOVE_LEFT_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
