indexing
	description: "Widgets that can edit an object of type T"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:15:23 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECTK_EDITABLE [T]

inherit

	ECTK_WIDGET
		redefine
			is_ready, exit_condition
		end

feature -- Status report

	model_querist: EMI_REFERENCE[T]
			-- Model querist.

	model_modifier: EMI_COMMAND_ARG1 [ANY,T]
			-- Model modifier.

	is_editable: BOOLEAN is
			-- Is the entry editable?
		do
			Result := model_modifier /= Void
		ensure then
			Result implies (model_modifier /= Void)
		end

	is_ready: BOOLEAN is
			-- Is `Current' ready to handle events?
		do
			Result := Precursor and model_querist /= Void
		ensure then
			Result implies (model_querist /= Void)
		end

	is_overwrite_mode: BOOLEAN is
			-- Is the entry in overwrite mode.
		do
			Result := ectk_system.is_overwrite_mode
		end

	is_modified: BOOLEAN
			-- Is the data modified?

feature -- Status setting

	define_model_querist (a_querist: EMI_REFERENCE[T]) is
			-- Define model querist with `a_querist'.
		require
			a_querist_exists: a_querist /= Void
		do
			model_querist := a_querist
		ensure
			querist_defined: model_querist = a_querist
		end	

	define_model_modifier (a_modifier: EMI_COMMAND_ARG1 [ANY, T]) is
			-- Define model modifier with `a_modifier'.
		do
			model_modifier := a_modifier
		ensure
			modifier_copied_defined: model_modifier = a_modifier 
		end

feature {NONE} -- Implementation of event handling

	exit_condition : BOOLEAN is
			-- Has the exit condition been met ?
		local
			ectk_message: ECTK_MESSAGE
		do 
			if not last_event.is_processed then
			 	if is_editable and then is_modified then
					update_model
					if last_error /= Void then
						!!ectk_message.make ( last_error.default_message)
						refresh_cursor	
 						last_error := Void
						Result := False
					else
						Result := True
					end
				else
					Result := True
				end
			else
				Result := False
			end
		end


feature {NONE} -- Implementation

	update_model is
			-- Update the model.
		require
			is_editable: is_editable	
		deferred
		end

	refresh_cursor is
			-- Refresh current cursor position.
		deferred
		end

end -- class ECTK_EDITABLE

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
