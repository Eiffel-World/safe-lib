indexing
	description: "[

	This class is the abstract superclass of all device objects, such as the Display device and the Printer device. 
	Devices can have a graphics context (GC) created for them, and they can be drawn on by sending messages to the associated GC.

	]"
	date: "$Date: 2004/06/20 09:16:50 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_DEVICE

inherit
	ABSTRACT_DRAWABLE
	
feature {NONE} -- Initialization

	make is
			-- Default initialization.
		deferred
		end

	make_by_device_data  (a_device_data  : ABSTRACT_DEVICE_DATA) is
			-- Initialize by using `a_device_data'.
		require
			a_device_data_defined : a_device_data /= Void
		deferred
		end
		
feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_resource_disposed : BOOLEAN
			-- Is the operating system resource of `Current' disposed?

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

	dispose_resource is
			-- Disposes of the operating system resource of `Current'.
		do
			if not is_resource_disposed then
				-- FIXME
--				checkDevice ();
				release
--				destroy ();
				is_resource_disposed := True;
--				if (tracking) {
--					objects = null;
--					errors = null;
--				}
			end
		ensure
			is_resource_disposed : is_resource_disposed
		end

	release is
			-- Releases any internal resources back to the operating system.
		deferred
		
		ensure
			-- Fonts, colors and palettes are cleared.
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	create_os_device (a_device_data : ABSTRACT_DEVICE_DATA) is
			-- Creates the device in the operating system with `a_device_data'.	
			-- If the device does not have a handle, this method may do nothing depending on the device.
--		require
--			a_device_data_defined : a_device_data /= Void
		deferred			
		end

	init is
			-- Initializes any internal resources needed by the device.
			-- This method is called after create.
			-- If subclasses reimplement this method, they must call the super implementation.
		deferred
		end

	internal_new_GC (a_gc_data : ABSTRACT_GC_DATA ) : POINTER is
			-- Allocate a new platform specific GC handle.
		require
			not_is_resource_disposed : not is_resource_disposed
		deferred
		ensure
			handle_defined : Result /= Void
		end

	internal_dispose_GC (a_gc_handle : POINTER; a_gc_data : ABSTRACT_GC_DATA )is
			-- Dispose a platform specific GC handle.
		require
			a_gc_handle_defined : a_gc_handle /= Void
		deferred
		end

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_DEVICE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
