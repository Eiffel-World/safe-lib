indexing
	description: "Windows implementation of ABSTRACT_DEVICE"
	date: "$Date: 2003/12/20 17:57:28 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DEVICE

inherit
	DRAWABLE
	
	ABSTRACT_DEVICE
	
feature {NONE} -- Initialization

	make is
			-- Default initialization.
		do
			make_by_device_data (Create {DEVICE_DATA})
		end

	make_by_device_data  (a_device_data  : DEVICE_DATA) is
			-- Initialize by using `a_device_data'.
		do
			create_os_device (a_device_data)
			-- FIXME
			--	init ();	
			--	systemFont = getSystemFont().handle;
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

	init is
			-- Initializes any internal resources needed by the device.
			-- This method is called after create.
			-- If subclasses reimplement this method, they must call the super implementation.
		local
			device_context_handle : INTEGER
			raster_caps : INTEGER
			bits : INTEGER
			planes : INTEGER
		do
			-- FIXME
--			int hDC = internal_new_GC (null);
--			int rc = OS.GetDeviceCaps (hDC, OS.RASTERCAPS);
--			int bits = OS.GetDeviceCaps (hDC, OS.BITSPIXEL);
--			int planes = OS.GetDeviceCaps (hDC, OS.PLANES);
--			
--			bits *= planes;
--			if ((rc & OS.RC_PALETTE) == 0 || bits != 8) {
--				internal_dispose_GC (hDC, null);
--				return;
--			}
--			
--			int numReserved = OS.GetDeviceCaps (hDC, OS.NUMRESERVED);
--			int numEntries = OS.GetDeviceCaps (hDC, OS.SIZEPALETTE);
--		
--			/* Create the palette and reference counter */
--			colorRefCount = new int [numEntries];
--		
--			/* 4 bytes header + 4 bytes per entry * numEntries entries */
--			byte [] logPalette = new byte [4 + 4 * numEntries];
--			
--			/* 2 bytes = special header */
--			logPalette [0] = 0x00;
--			logPalette [1] = 0x03;
--			
--			/* 2 bytes = number of colors, LSB first */
--			logPalette [2] = 0;
--			logPalette [3] = 1;
--		
--			/* 
--			* Create a palette which contains the system entries
--			* as they are located in the system palette.  The
--			* MSDN article 'Memory Device Contexts' describes
--			* where system entries are located.  On an 8 bit
--			* display with 20 reserved colors, the system colors
--			* will be the first 10 entries and the last 10 ones.
--			*/
--			byte[] lppe = new byte [4 * numEntries];
--			OS.GetSystemPaletteEntries (hDC, 0, numEntries, lppe);
--			/* Copy all entries from the system palette */
--			System.arraycopy (lppe, 0, logPalette, 4, 4 * numEntries);
--			/* Lock the indices corresponding to the system entries */
--			for (int i = 0; i < numReserved / 2; i++) {
--				colorRefCount [i] = 1;
--				colorRefCount [numEntries - 1 - i] = 1;
--			}
--			internal_dispose_GC (hDC, null);
--			hPalette = OS.CreatePalette (logPalette);
--		}
			
		end

invariant
	invariant_clause: -- Your invariant here

end -- class DEVICE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
