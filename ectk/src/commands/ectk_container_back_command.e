indexing
	description: "Makes the previous child current in a ECTK_CONTAINER"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_CONTAINER_BACK_COMMAND

inherit
	EPAT_COMMAND
	
creation
	make

feature {NONE} -- Initialization

	make (a_container: ECTK_CONTAINER [ECTK_WIDGET]) is
			-- Initialize with `a_container'.
		require
			container_exists: a_container /= Void
		do
			container := a_container
		end

feature -- Status setting

	check_precondition: BOOLEAN is
			-- Check the precondition.
		do
			if  not container.off and then not container.is_first then
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
			container.back
		end


feature {NONE} -- Implementation

	container: ECTK_CONTAINER [ECTK_WIDGET]
	
end -- class ECTK_CONTAINER_BACK_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
