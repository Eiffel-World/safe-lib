indexing
	description: "Moves cursor to last cursor position in a ECTK_TEXT"
	author: "Fafchamps Eric"
	date: "$Date: 2001/12/06 07:35:12 $"
	revision: "$Revision: 1.3 $"

class
	ECTK_TEXT_FINISH_COMMAND

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
			if  not ectk_text.is_text_void then
				last_precondition_error := Void
			else
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_is_text_void: not is_text_void")
			end
			Result := last_precondition_error = Void			
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			ectk_text.finish
		end

feature {NONE} -- Implementation

	ectk_text: ECTK_TEXT
	
end -- class ECTK_TEXT_FINISH_COMMAND



--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
