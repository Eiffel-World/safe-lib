indexing
	description: "Makes the previous child current in a ECTK_CONTAINER"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 23:08:03 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_CONTAINER_BACK_COMMAND
inherit
	EMI_COMMAND [ECTK_CONTAINER[ECTK_WIDGET]]
		redefine
			check_precondition
		end

creation
	make

feature -- Status setting

	check_precondition is
			-- Check the precondition.
		do
			Precursor
			if  last_precondition_error = Void and not (not object.off and then not object.is_first) then
				!EMI_PRECONDITION_ERROR!last_precondition_error.make ("not_is_first: not off and then not is_first")
			end	
		end


feature -- Status report

	is_precondition_met: BOOLEAN is
			-- Is the precondition for using this feature met?
		do
			Result := not object.is_first
		end

feature -- Basic operation

	execute is
			-- Execute command.
		do
			object.back
		end

end -- class ECTK_CONTAINER_BACK_COMMAND

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
