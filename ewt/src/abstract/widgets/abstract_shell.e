indexing
	description: "[

	Objects that represent the windows which the desktop or "window manager" is managing.
	Instances that do not have a parent (that is, they are built using the constructor, which takes a Display as the argument)
	are described top level shells. 
	Instances that do have a parent are described as secondary or dialog shells.
	Instances are always displayed in one of the maximized, minimized or normal states.
	When an instance is marked as maximized, the window manager will typically resize it to fill the entire visible area of the display, 
	and the instance is usually put in a state where it can not be resized (even if it has style RESIZE) until it is no longer maximized.
	When an instance is in the normal state (neither maximized or minimized), its appearance is controlled by the style constants which were 
	specified when it was created and the restrictions of the window manager (see below).
	When an instance has been marked as minimized, its contents (client area) will usually not be visible, and depending on the window manager,
	it may be iconified (that is, replaced on the desktop by a small simplified representation of itself), relocated to a distinguished area
	of the screen, or hidden. 
	Combinations of these changes are also possible.
	
	Note: The styles supported by this class must be treated as HINTs, since the window manager for the desktop on which the instance is visible
	has ultimate control over the appearance and behavior of decorations and modality. 
	For example, some window managers only support resizable windows and will always assume the RESIZE style, even if it is not set.
	In addition, if a modality style is not supported, it is upgraded to a more restrictive modality style that is supported. For
	example, if PRIMARY_MODAL is not supported, it would be upgraded to APPLICATION_MODAL.
	
	Styles: BORDER, CLOSE, MIN, MAX, NO_TRIM, RESIZE, TITLE, APPLICATION_MODAL, MODELESS, PRIMARY_MODAL, SYSTEM_MODAL
	Events:	Activate, Close, Deactivate, Deiconify, Iconify
	
	Class EWT provides two convenience constants for the most commonly required style combinations: 
	SHELL_TRIM the result of combining the constants which are required to produce a typical application top level shell: 
	(that is, CLOSE | TITLE | MIN | MAX | RESIZE) 
	DIALOG_TRIM the result of combining the constants which are required to produce a typical application dialog shell:
	(that is, TITLE | CLOSE | BORDER)
	
	Note: Only one of the styles APPLICATION_MODAL, MODELESS, PRIMARY_MODAL and SYSTEM_MODAL may be specified.
	
	]"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.6 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_SHELL

inherit
	ABSTRACT_DECORATIONS

feature {NONE} -- Initialization


	make is
			-- Initialize.
			-- Equivalent to calling make_by_display (Void)
		deferred
		end

	make_by_style (a_style : INTEGER) is
			-- Initialize with `a_style' describing its behavior and appearance.
			-- Equivalent to calling make_by_display_style (Void, a_style).
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		deferred
		end

	make_by_display (a_display : ABSTRACT_DISPLAY) is
			-- Initialize by using `a_display'.
			-- It is created with style SWT.SHELL_TRIM.
			-- Note: Currently, null can be passed in for the display argument.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the display argument is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		deferred
		end

	make_by_display_style (a_display : ABSTRACT_DISPLAY; a_style : INTEGER) is
			-- Initialize with `a_display' and `a_style' describing its behavior and appearance.
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		deferred
		end

	make_by_parent (a_parent : ABSTRACT_SHELL) is
			-- Initialize with `a_parent'.
			-- Note: Currently, Void can be passed in for the parent.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the parent is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		deferred
		end


	make_by_parent_style (a_parent : SHELL; a_style : INTEGER) is
			-- Initialize with `a_parent' and `a_style' describing its behavior and appearance.
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
			-- Note: Currently, Void can be passed in for the parent.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the parent is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		deferred
		end


feature -- Access

	get_bounds : RECTANGLE is
			-- Rectangle describing the receiver's size and location relative to its parent (or its display if its parent is null). 
		deferred
		end

	get_display : DISPLAY is
			-- Display that the receiver was created on.
		deferred
		end
	
	get_ime_input_mode : INTEGER is
			-- Input method editor mode.
		deferred
		end

	get_location : POINT is
			-- Point describing the receiver's location relative to its parent (or its display if its parent is null). 
		deferred
		end
		
	get_shell : SHELL is
			-- Shell of Current
		deferred
		end
		
	get_shells : DS_LIST[SHELL] is
			-- Shells which are descendents of the receiver.
		deferred
		end

	last_active : CONTROL
			-- Last active control.
		
feature -- Measurement

feature -- Comparison

feature -- Status report

	get_enabled : BOOLEAN is
		deferred
		end

	is_enabled : BOOLEAN is
			-- Is Current enabled and are all of the Current's ancestors enabled ?
		deferred
		end

feature -- Status setting

	set_enabled (enabled : BOOLEAN) is
		deferred
		ensure
--FIXME?
			enabled: get_enabled
		end

feature -- Cursor movement

feature -- Element change

	remove_shell_listener (listener : SHELL_LISTENER) is
			-- Removes the listener from the collection of listeners who will be notified 
			-- when operations are performed on Current.
		deferred
		end
		
	set_active is
			-- Moves the receiver to the top of the drawing order for the display on which it was created 
			-- (so that all other shells on that display, which are not the receiver's children will be drawn behind it) 
			-- and asks the window manager to make the shell active.
		deferred	
		end
	
	set_ime_input_mode (mode : INTEGER) is
			-- Sets the input method editor mode to the argument which should be the result 
			-- of bitwise OR'ing together one or more of the following constants defined 
			-- in class SWT: NONE, ROMAN, DBCS, PHONETIC, NATIVE, ALPHA.
		deferred
		end
		
	set_visible (visible : BOOLEAN) is
			-- Marks Current as visible if the argument is true, and marks it invisible otherwise.
		deferred
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	open is
			-- Moves `Current' to the top of the drawing order for the display on which it was created (so that all other
			-- shells on that display, which are not `Current' 's children will be drawn behind it), marks it visible, 
			-- and sets focus to its default button (if it has one) and asks the window manager to make the shell active.
		require
 			not_is_resource_disposed : not is_resource_disposed
		deferred
		end

	add_shell_listener (listener : SHELL_LISTENER) is
			-- Adds the listener to the collection of listeners who will be notified when operations are performed on 
			-- Current, by sending the listener one of the messages defined in the ShellListener interface.  
		deferred
		end
		
	close is
			-- Requests that the window manager close the receiver in the same way it would be closed when the user clicks on the "close box" or performs some other platform 
			-- specific key or mouse combination that indicates the window should be removed. 
		deferred
		end
	
	dispose_resources is
			-- Disposes of the operating system resources associated with the receiver and all its descendents.
		deferred
		end

	force_active is
			-- Moves the receiver to the top of the drawing order for the display on which it was created (so 
			-- that all other shells on that display, which are not Current's 
			-- children will be drawn behind it) and forces the window manager to make the shell active. 
		deferred
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_SHELL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
