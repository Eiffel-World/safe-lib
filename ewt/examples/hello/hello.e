indexing
	description	: "System's root class"
	date: "$Date: 2003/12/20 17:57:28 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	HELLO

creation
	make

feature -- Initialization

	make is
			-- Creation procedure.
		local
			a_shell : SHELL
			a_display : DISPLAY
			a_boolean : BOOLEAN
		do
			Create a_display.make
			Create a_shell.make_by_display (a_display)
			from
				a_shell.open			
			until
				a_shell.is_released
			loop
				if not a_display.read_and_dispatch then
					a_boolean := a_display.sleep
				end
			end
			a_display.release
		end

end -- class HELLO

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
