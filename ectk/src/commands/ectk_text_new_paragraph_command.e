indexing
	description: "Adds a new paragraph in a ECTK_TEXT"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_TEXT_NEW_PARAGRAPH_COMMAND

inherit

	EPAT_COMMAND
	
	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		end

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
			last_precondition_error := Void
			Result := True
		ensure then
			Result = True
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			ectk_text.new_paragraph
		end

feature {NONE} -- Implementation

	ectk_text: ECTK_TEXT
	
end -- class ECTK_TEXT_NEW_PARAGRAPH_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
