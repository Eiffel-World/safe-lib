indexing
	description: "Windows implementation of an ABSTRACT_SHELL"
	date: "$Date: 2004/06/29 16:49:46 $";
	revision: "$Revision: 1.9 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHELL

inherit
	ABSTRACT_SHELL
	
	DECORATIONS
		rename
			make as make_decorations
		redefine
			get_display,
			widget_style,
			init_static
		end
		
creation
	make, make_by_style, make_by_display, make_by_display_style, make_by_parent, make_by_parent_style
	
feature {NONE} -- Initialization

	make is
			-- Initialize.
			-- Equivalent to calling make_by_display (Void)
		do
			make_by_display (Void)
		end

	make_by_style (a_style : INTEGER) is
			-- Initialize with `a_style' describing its behavior and appearance.
			-- Equivalent to calling make_by_display_style (Void, a_style).
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		do
			make_by_display_style (Void, a_style)
		end

	make_by_display (a_display : DISPLAY) is
			-- Initialize by using `a_display'.
			-- Equivalent to calling make_by_display_style (a_display, swt.Shell_trim).
			-- Note: Currently, null can be passed in for the display argument.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the display argument is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		do
			make_by_display_style (a_display, swt.Shell_trim)
		end

	make_by_display_style (a_display : DISPLAY; a_style : INTEGER) is
			-- Initialize with `a_display' and `a_style' describing its behavior and appearance.
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		do
			initialize (a_display, Void, a_style, default_pointer)
		end

	make_by_parent (a_parent : SHELL) is
			-- Initialize with `a_parent'.
			-- Note: Currently, Void can be passed in for the parent.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the parent is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		do
			make_by_parent_style (a_parent, swt.Dialog_trim)
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
		do
				if a_parent /= Void then
					initialize (a_parent.get_display, a_parent, a_style, default_pointer)
				else
					initialize (Void, a_parent, a_style, default_pointer)
				end
		end

	initialize (a_display : DISPLAY; a_parent : SHELL; a_style : INTEGER; a_handle : POINTER) is
			-- Internal initialization.
		local
			l_display : DISPLAY
		do
			init_static
			
			make_decorations
			l_display := a_display
			if l_display = Void then 
				l_display := display.get_current
			end
			if l_display = Void then
				l_display := display.get_default
			end
			style := check_style (a_style)
			parent := a_parent
			display := l_display
			handle := a_handle
			create_widget
		end

feature -- Access

	get_display : DISPLAY is
			-- Returns the Display that is associated with the receiver.
			--  A widget's display is either provided when it is created (for example, top level Shells) or is the
			-- same as its parent's display.
		do
			if display = Void then
				error (swt.Error_widget_disposed)
			else
				Result := display
			end
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

	open is
			-- Moves `Current' to the top of the drawing order for the display on which it was created (so that all other
			-- shells on that display, which are not `Current' 's children will be drawn behind it), marks it visible, 
			-- and sets focus to its default button (if it has one) and asks the window manager to make the shell active.
		local
			msg : MSG
			res : INTEGER
		do
				check_widget
				bring_to_top
				--	/*
				--	* Feature on WinCE PPC.  A new application becomes
				--	* the foreground application only if it has at least
				--	* one visible window before the event loop is started.
				--	* The workaround is to explicitely force the shell to
				--	* be the foreground window.
				--	*/
				--	if (OS.IsWinCE) OS.SetForegroundWindow (handle);
				res := os.send_message_a (handle, os.WM_CHANGEUISTATE, os.UIS_INITIALIZE, 0)
				set_visible (True)
				--	/*
				--	* Bug in Windows XP.  Despite the fact that an icon has been
				--	* set for a window, the task bar displays the wrong icon the
				--	* first time the window is made visible with ShowWindow() after
				--	* a call to BringToTop(), when a long time elapses between the
				--	* ShowWindow() and the time the event queue is read.  The icon
				--	* in the window trimming is correct but the one in the task
				--	* bar does not get updated until a new icon is set into the
				--	* window or the window text is changed.  The fix is to call
				--	* PeekMessage() with the flag PM_NOREMOVE to touch the event
				--	* queue but not dispatch events.
				--	*/
				--	MSG msg = new MSG ();
				create msg.make_new_unshared
				res := os.peek_message_a (msg.item, default_pointer, 0, 0, os.PM_NOREMOVE)
				if not restore_focus then
					traverse_group (true)
				end
		end

	bring_to_top is
			-- 
		do
			--| FIXME
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	dialog_proc_pointer : POINTER
	
	dialog_class : TCHAR is
		once
			create Result.make_from_string ("#32770")
		end
		
	init_static is
			-- "static" initializations
		local
			lp_wndclass : WNDCLASS
			l_result : INTEGER
		once
			Precursor
			create lp_wndclass.make_new_unshared
			l_result := os.get_class_info_a_external (default_pointer, dialog_class.handle, lp_wndclass.item)
			dialog_proc_pointer := lp_wndclass.lpfnwndproc
		end
		
	
 	check_style (a_style : INTEGER) : INTEGER is
 		local
 			l_mask : INTEGER
 			l_bits : INTEGER
		do
			l_mask := UINT32_.u_or(UINT32_.u_or (swt.Style_system_modal, swt.Style_application_modal), swt.Style_primary_modal)
			l_bits := UINT32_.u_and (a_style, UINT32_.u_not (l_mask))
			if UINT32_.u_and (a_style, swt.Style_system_modal) /= 0 then
				Result := UINT32_.u_or(l_bits, swt.Style_system_modal)
			else
				if UINT32_.u_and (a_style, swt.Style_application_modal) /= 0 then
					Result := UINT32_.u_or(l_bits, swt.Style_application_modal)
				else
					if UINT32_.u_and (a_style, swt.Style_primary_modal) /= 0 then
						Result := UINT32_.u_or(l_bits, swt.Style_primary_modal)
					else
						Result := l_bits
					end
				end
			end
		end

	widget_style : INTEGER is
		local
			l_bits : INTEGER
		do
			--	int bits = super.widgetStyle () & ~OS.WS_POPUP;
			--	if (handle != 0) return bits | OS.WS_CHILD;
			
			l_bits := UINT32_.u_and (Precursor, UINT32_.u_not (os.Ws_popup))
			if handle /= default_pointer then
				l_bits := UINT32_.u_or (l_bits, os.ws_child)
			else
				l_bits := UINT32_.u_and (l_bits, UINT32_.u_not (os.Ws_child))
				--	bits &= ~OS.WS_CHILD;
				--	/*
				
				--	* Feature in WinCE.  Calling CreateWindowEx () with WS_OVERLAPPED
				--	* and a parent window causes the new window to become a WS_CHILD of
				--	* the parent instead of a dialog child.  The fix is to use WS_POPUP
				--	* for a window with a parent.  
				--	* 
				--	* Feature in WinCE PPC.  A window without a parent with WS_POPUP
				--	* always shows on top of the Pocket PC 'Today Screen'. The fix
				--	* is to not set WS_POPUP for a window without a parent on WinCE
				--	* devices.
				--	* 
				--	* NOTE: WS_POPUP causes CreateWindowEx () to ignore CW_USEDEFAULT
				--	* and causes the default window location and size to be zero.
				--	*/
				--	if (OS.IsWinCE) {
				--		if (OS.IsSP) return bits | OS.WS_POPUP;
				--		return parent == null ? bits : bits | OS.WS_POPUP;
				--	}
				
				--	
				--	/*
				--	* Use WS_OVERLAPPED for all windows, either dialog or top level
				--	* so that CreateWindowEx () will respect CW_USEDEFAULT and set
				--	* the default window location and size.
				--	* 
				--	* NOTE:  When a WS_OVERLAPPED window is created, Windows gives
				--	* the new window WS_CAPTION style bits.  These two constants are
				--	* as follows:
				--	* 
				--	* 	WS_OVERLAPPED = 0
				--	* 	WS_CAPTION = WS_BORDER | WS_DLGFRAME
				--	* 
				--	*/
				--	return bits | OS.WS_OVERLAPPED | OS.WS_CAPTION;
				l_bits := UINT32_.u_or (l_bits, UINT32_.u_or (os.Ws_overlapped, os.Ws_caption))
			end
			Result := l_bits
		end
		
feature {NONE} -- Attributes

	display : DISPLAY
			-- Display.

invariant
	invariant_clause: -- Your invariant here

end -- class SHELL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
