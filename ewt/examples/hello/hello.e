indexing
	description	: "System's root class"
	date: "$Date: 2003/12/13 22:30:48 $";
	revision: "$Revision: 1.3 $";
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
		do
			Create a_display.make
			Create a_shell.make_by_display (a_display)
		end

end -- class HELLO

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
