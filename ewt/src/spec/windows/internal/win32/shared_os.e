indexing
	description: "Shared Windows Operating System specific constants and functions"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.1 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHARED_OS

feature {NONE} -- Initialization

feature -- Access

	os : OS is
			-- Windows operating system.
		once
			Create Result.make			
		end

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class SHARED_OS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
