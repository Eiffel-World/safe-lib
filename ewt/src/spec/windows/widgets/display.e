indexing
	description: "Windows implementation of ABSTRACT_DISPLAY"
	date: "$Date: 2003/12/20 17:57:28 $";
	revision: "$Revision: 1.3 $";
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

	is_released : BOOLEAN is
			-- Are the operating system ressources associated with `Current' released?
		do
			-- FIXME
		end
		
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


	internal_new_GC (gc_data : ABSTRACT_GC_DATA ) : INTEGER is
			-- Allocate a new platform specific GC handle.
		do
			-- FIXME
		end

invariant
	invariant_clause: -- Your invariant here

end -- class DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
