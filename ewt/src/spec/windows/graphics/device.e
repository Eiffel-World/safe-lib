indexing
	description: "Windows implementation of ABSTRACT_DEVICE"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.8 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DEVICE

inherit
	DRAWABLE
	
	ABSTRACT_DEVICE
	
	SHARED_OS
		export
			{NONE} all
		end
	
feature {NONE} -- Initialization


	make_by_device_data  (a_device_data  : DEVICE_DATA) is
			-- Initialize by using `a_device_data'.
		do
--			if a_device_data /= Void then
--				debug_flag := a_device_data.debug_flag
--				tracking := a_device_data.tracking
--			end
			create_os_device (a_device_data)
			init	
			--	if (tracking) {
			--		errors = new Error [128];
			--		objects = new Object [128];
			--	}
			--	systemFont = getSystemFont().handle;
		end

feature -- Access

	h_palette : POINTER
	
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
			-- If subclasses reimplement this method, they must call the precursor implementation.
		local
			a_device_context_handle : POINTER
			the_raster_caps : INTEGER
			the_bits : INTEGER
			the_planes : INTEGER
			a_num_reserved : INTEGER
			a_num_entries : INTEGER
		do
			-- FIXME
			a_device_context_handle := internal_new_GC (Void);
			the_raster_caps := os.get_device_caps_external (a_device_context_handle, os.Rastercaps)
			the_bits := os.get_device_caps_external (a_device_context_handle, os.Bitspixel )
			the_planes := os.get_device_caps_external (a_device_context_handle, os.Planes )
			
			the_bits := the_bits * the_planes

			if ((the_raster_caps & os.Rc_palette) = 0) or (the_bits /= 8) then
				internal_dispose_GC (a_device_context_handle, Void)
			else
	
					a_num_reserved := os.get_device_caps_external (a_device_context_handle, os.Numreserved)
					a_num_entries := os.get_device_caps_external (a_device_context_handle, os.Sizepalette)
		
		
		--			/* Create the palette and reference counter */
					Create color_ref_count.make (1, a_num_entries)
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
		--			OS.GetSystemPaletteEntries (device_context_handle, 0, numEntries, lppe);
		--			/* Copy all entries from the system palette */
		--			System.arraycopy (lppe, 0, logPalette, 4, 4 * numEntries);
		--			/* Lock the indices corresponding to the system entries */
		--			for (int i = 0; i < numReserved / 2; i++) {
		--				colorRefCount [i] = 1;
		--				colorRefCount [numEntries - 1 - i] = 1;
		--			}
		--			internal_dispose_GC (device_context_handle, null);
		--			h_Palette := OS.create_palette_external (logPalette);
		--		}
			end
	end

	color_ref_count : ARRAY [INTEGER]
			-- Color reference count.

invariant
	invariant_clause: -- Your invariant here

end -- class DEVICE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
