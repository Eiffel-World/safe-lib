indexing
	description: "[

	Instances of this class are responsible for managing the connection between EWT and the underlying operating
	system. Their most important function is to implement the EWT event loop in terms of the platform event model.
	They also provide various methods for accessing information about the operating system, and have overall control over
	the operating system resources which EWT allocates.

	Applications which are built with EWT will almost always require only a single display. In particular, some platforms
	which EWT supports will not allow more than one active display. In other words, some platforms do not support
	creating a new display if one already exists that has not been released.

	A process is not allowed to construct other Displays until that display has been disposed.
	Enforcing this allows EWT to be implemented directly on the underlying operating system's event model. This has 
	numerous benefits including smaller footprint, better use of resources, safer memory management, clearer program logic,
	better performance.

	Styles:
		(none)
	Events:
		Close, Release	
	]"
	date: "$Date: 2003/12/30 12:50:58 $";
	revision: "$Revision: 1.6 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_DISPLAY

inherit
	ABSTRACT_DEVICE

feature {NONE} -- Initialization

	make is
			-- Initialize.
		deferred
		ensure then
			-- The resulting display is marked as the current display. 
			-- If this is the first display which has been constructed since the application started, it is also
 			-- marked as the default display.
		end

feature -- Access

	get_current : ABSTRACT_DISPLAY is
			-- Returns the display which the currently running process.
		deferred
		end

	get_default : ABSTRACT_DISPLAY is
			-- Returns the default display. 
			-- One is created if it did not already exist.
		deferred
		ensure
			result_defined : Result /= Void
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

feature {NONE} -- Conversion

	translate_key (internal_code : INTEGER) : INTEGER is
		do
			Result := key_table.swt_from_internal (internal_code)
		end

	untranslate_key (swt_code : INTEGER) : INTEGER is
		do
			Result := Key_table.internal_from_swt (swt_code)
		end
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	read_and_dispatch : BOOLEAN is
			-- Reads an event from the operating system's event queue, dispatches it appropriately.
		require
			not_is_resource_disposed : not is_resource_disposed
		deferred			
		ensure
			-- true if there is potentially more work to do, or false if the caller can sleep
			-- until another event is placed on the event queue.
		end

	sleep : BOOLEAN is
			-- Causes the user-interface process to sleep (that is, to be put in a state where it does not consume CPU cycles)
			-- until an event is received or it is otherwise awakened.
		require
			not_is_resource_disposed : not is_resource_disposed
		deferred
		ensure
			-- true if an event requiring dispatching was placed on the queue
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	create_display (data : DEVICE_DATA) is
		deferred
		end
		

	key_table : KEY_TABLE is
			-- key table, mapping internal codes to swt codes
		once
			create Result.make
			initialize_key_table
		end
		
	initialize_key_table is
			-- initialize key table
		deferred
		end

	default_display : DISPLAY is
		do
			Result := default_display_cell.item
		end
		
	default_display_cell : DS_CELL[DISPLAY] is
		once
			Create Result.make (Void)
		end
		
		
invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
