indexing
	description: "[
		This class provides access to a small number of SWT system-wide methods,
		and in addition inherit from the public constants provided by SWT.
					]"
	date: "$Date: 2004/06/20 09:16:50 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SWT

inherit
	SWT_CONSTANTS
	
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

	error (an_error_code : INTEGER) is
			-- Throws an appropriate exception based on the passed in `an_error_code'.
		do
			-- FIXME
			print ("Error code = " +an_error_code.out + "%N") 
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class SWT

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
