indexing
	description: "[
		This class provides access to a small number of SWT system-wide methods,
		and in addition inherit from the public constants provided by SWT
		]"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.1 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHARED_SWT

feature {NONE} -- Initialization

feature -- Access

	swt : SWT is
			-- Common constants and features.
		once
			Create Result
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

end -- class SHARED_SWT

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
