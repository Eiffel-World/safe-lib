indexing
	description: "[
		This class provides access to a small number of SWT system-wide methods,
		and in addition inherit from the public constants provided by SWT.
					]"
	date: "$Date: 2007/11/15 10:02:08 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SWT

inherit
	SWT_CONSTANTS
	
	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		end
		
create
	make
	
feature {NONE} -- Initialization

	make is
			-- creation of computed constants
		do
			key_BUTTON_MASK := UINT32_.u_or (UINT32_.u_or (key_BUTTON1, key_BUTTON2), key_BUTTON3)
			key_MODIFIER_MASK := UINT32_.u_or (UINT32_.u_or (UINT32_.u_or (key_ALT, key_SHIFT), key_CTRL), key_COMMAND)
			
			--	String platform = getPlatform ();
			--	if ("carbon".equals (platform)) { //$NON-NLS-1$
			--		MOD1 = COMMAND;
			--		MOD2 = SHIFT;
			--		MOD3 = ALT;
			--		MOD4 = CONTROL;
			--	} else {
			key_MOD1 := key_CONTROL
			key_MOD2 := key_SHIFT
			key_MOD3 := key_ALT
			key_MOD4 := 0
			
			--		MOD1 = CONTROL;
			--		MOD2 = SHIFT;
			--		MOD3 = ALT;
			--		MOD4 = 0;
		end
		
feature -- Access

	key_MOD1 : INTEGER
	
	key_MOD2 : INTEGER
	
	key_MOD3 : INTEGER
	
	key_MOD4 : INTEGER
	
	key_BUTTON_MASK : INTEGER
	
	key_MODIFIER_MASK : INTEGER
	
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
