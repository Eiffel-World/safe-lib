indexing
	description: "Windows implementation of ABSTRACT_DISPLAY"
	date: "$Date: 2003/12/28 22:04:44 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	DISPLAY

inherit
	ABSTRACT_DISPLAY

	DEVICE
	
creation
	make, make_by_device_data
	
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

	read_and_dispatch : BOOLEAN is
			-- Reads an event from the operating system's event queue, dispatches it appropriately.
		do
			-- FIXME
		end

	sleep : BOOLEAN is
			-- Causes the user-interface process to sleep (that is, to be put in a state where it does not consume CPU cycles)
			-- until an event is received or it is otherwise awakened.
		do
			-- FIXME
		end

	release is
			-- Releases any internal resources back to the operating system.
		do
			-- FIXME
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	create_os_device (a_device_data : DEVICE_DATA) is
			-- Creates the device in the operating system with `a_device_data'.
			-- If the device does not have a handle, this method may do nothing depending on the device.
		do	
			do_nothing
		end

	internal_new_gc (a_gc_data : GC_DATA) : POINTER is
			-- Allocate a new handle for a Graphical Context using `a_gc_data' if defined.
		local
			dc_handle : POINTER
			a_mask : INTEGER
		do
			dc_handle := os.get_dc_external (default_pointer)
			if dc_handle = default_pointer then
				swt.error (swt.Error_no_handles)
			else
				if a_gc_data /= Void then
					a_mask := swt.Style_left_to_right | swt.Style_right_to_left
					if (a_gc_data.style & a_mask) /= 0 then
						if (a_gc_data.style & swt.Style_right_to_left) /= 0 then
							a_gc_data.set_layout (os.WS_EX_LAYOUTRTL)
						else
							a_gc_data.set_layout (0)
						end
					else
						a_gc_data.set_style (a_gc_data.style | swt.Style_left_to_right)
					end
					a_gc_data.set_device (Current)
					a_gc_data.set_font_handle (system_font)
				end
				Result := dc_handle
			end
		end

	internal_dispose_GC (a_gc_handle : POINTER; a_gc_data : GC_DATA )is
			-- Dispose a platform specific GC handle.
		local
			a_status : INTEGER
		do
			a_status := os.release_dc_external (default_pointer, a_gc_handle)
		end

	system_font : POINTER is
			-- System font handle.
		local
			a_font_handle : POINTER
		do
			if system_fonts /= Void then
				if not system_fonts.is_empty then
					a_font_handle := system_fonts.item (system_fonts.upper)
				end
			end
			if a_font_handle = default_pointer then
				a_font_handle := os.get_stock_object_external (os.Default_gui_font)
			end
			if a_font_handle = default_pointer then
				a_font_handle := os.get_stock_object_external (os.System_font)
			end
			Result := a_font_handle
		ensure
			result_defined : Result /= Void
		end

	system_fonts : ARRAY [POINTER]
			-- System fonts.
	
invariant
	invariant_clause: -- Your invariant here

end -- class DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
