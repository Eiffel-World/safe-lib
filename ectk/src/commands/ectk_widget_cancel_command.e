indexing
	description: "Command that cancel the changes since the last update (updates the widget with the current model)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_WIDGET_CANCEL_COMMAND

inherit
	EPAT_COMMAND

creation
	make

feature {NONE} -- Initialization

	make (a_widget: ECTK_WIDGET) is
			-- Initialize with `a_widget'.
		require
			widget_exists: a_widget /= Void
		do
			widget := a_widget
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
			widget.update
		end


feature {NONE} -- Implementation
	
		widget: ECTK_WIDGET
		
end -- class ECTK_WIDGET_CANCEL_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
