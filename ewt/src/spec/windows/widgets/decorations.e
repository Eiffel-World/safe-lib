indexing
	description: "Windows implementation of ABSTRACT_DECORATIONS"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.5 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DECORATIONS

inherit
	CANVAS
		redefine
			create_widget
		end
		
	ABSTRACT_DECORATIONS
	
	SHARED_OS
		export
			{NONE} all
		end
	
feature {NONE} -- Initialization

	make is
			-- Initialize
		do
			do_nothing
		end
		

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

	create_widget is
		do
			Precursor
			sw_flags := os.SW_SHOWNOACTIVATE
			h_accel := -1;
		end

feature {NONE} -- Attributes

	h_accel : INTEGER
	
	sw_flags : INTEGER

invariant
	invariant_clause: -- Your invariant here

end -- class DECORATIONS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
