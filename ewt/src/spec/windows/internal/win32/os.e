indexing
	description: "Windows Operating System specific constants and functions"
	date: "$Date: 2003/12/28 22:04:41 $";
	revision: "$Revision: 1.1 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	OS

inherit

	OS_CONSTANTS

	WINGDI_FUNCTIONS_EXTERNAL
	
	WINBASE_FUNCTIONS_EXTERNAL
	
	WINUSER_FUNCTIONS_EXTERNAL

feature {NONE} -- Initialization

feature -- Access

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

end -- class OS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
