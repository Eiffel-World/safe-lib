indexing
	description: "Interface to ectk system-wide primitives"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 19:12:32 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_SYSTEM

feature -- Access

	is_insert_mode: BOOLEAN is
			-- Is the system in insert mode.
		do
			Result := not is_overwrite_mode
		end

	is_overwrite_mode: BOOLEAN
			-- Is the system in overwrite mode.

feature -- Modify

	set_insert_mode is
			-- Set the system in insert mode
		do
			is_overwrite_mode := False
		ensure
			is_insert_mode
		end

	set_overwrite_mode is
			-- set the system in overwrite mode.
		do
			is_overwrite_mode := True
		ensure
			is_overwrite_mode
		end

	toggle_insert_overwrite_mode is
			-- Toggle the state of insert and overwrite mode.
		do
			is_overwrite_mode := not is_overwrite_mode	
		ensure
			toggled: (is_overwrite_mode = not old is_overwrite_mode) and (is_insert_mode = not old is_insert_mode)
		end
		

invariant
	insert_mode_xor_overwrite_mode: is_insert_mode xor is_overwrite_mode

end -- class ECTK_SYSTEM

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
