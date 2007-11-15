indexing
	description: "Windows implementation of an ABSTRACT_SHELL"
	date: "$Date: 2007/11/15 10:02:08 $";
	revision: "$Revision: 1.13 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHELL

inherit
	ABSTRACT_SHELL
		undefine
			release_handle
		end
	
	DECORATIONS
		rename
			make as make_decorations
		redefine
			get_bounds,
			get_display,
			widget_style,
			init_static,
			call_window_proc,
			create_handle,
			window_class,
			window_proc_pointer,
			set_visible,
			set_enabled,
			get_shell,
			is_enabled, get_enabled,
			do_WM_ACTIVATE,
			do_WM_CLOSE,
			find_brush,
			release_widget
		end
		
create
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
			
			--make_decorations
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
		
	window_class : TCHAR is
		do
			if parent /= Void then
				Result := dialog_class
			else
				Result := Precursor
			end
		end
		
	window_proc_pointer : POINTER is
		do
			if parent /= Void then
				Result := dialog_proc_pointer
			else
				Result := Precursor
			end
		end

feature -- Access

	get_bounds : RECTANGLE is
			-- Rectangle describing the receiver's size and location relative to its parent (or its display if its parent is null). 
		local
			rect : RECT
			res : INTEGER
		do
			check_widget
			if not os.is_wince and then os.is_iconic (handle) /= 0 then
				Result := Precursor
			else
				create rect.make_new_unshared
				res := os.get_window_rect (handle, rect.item)
				create Result.make (rect.left, rect.top, (rect.right - rect.left), (rect.bottom - rect.top))
			end
		end

	get_display : DISPLAY is
			-- Display that the receiver was created on.
		do
			if display = Void then
				error (swt.Error_widget_disposed)
			else
				Result := display
			end
		end
	
	get_ime_input_mode : INTEGER is
			-- Input method editor mode.
		do
		end

	get_location : POINT is
			-- Point describing the receiver's location relative to its parent (or its display if its parent is null). 
		do
		end
		
	get_shell : SHELL is
			-- Shell of Current
		do
			check_widget
			Result := Current
		end
		
	get_shells : DS_LIST[SHELL] is
			-- Shells which are descendents of the receiver.
		local
			shells_cursor : DS_LIST_CURSOR[SHELL]
			shell : CONTROL
		do
			check_widget
			from
				shells_cursor := display.get_shells.new_cursor
				shells_cursor.start
				create {DS_LINKED_LIST[SHELL]}Result.make
			until
				shells_cursor.off
			loop
				from
					shell := shells_cursor.item				
				until
					shell = Void or else shell = Current
				loop
					shell := shell.parent
				end
				if shell = Current then
					Result.put_last (shells_cursor.item)
				end
				shells_cursor.forth
			end
		end

feature {CONTROL} -- Access

	hIMC : POINTER

	active_menu : MENU
	
	lpstr_tip : POINTER
	
	find_brush (pixel : INTEGER) : POINTER is
		local
			found : BOOLEAN
			brush_cursor : DS_LIST_CURSOR[POINTER]
			logbrush : LOGBRUSH
			res : INTEGER
		do
			if pixel = os.get_sys_color (os.COLOR_BTNFACE) then
				Result := os.get_sys_color_brush (os.COLOR_BTNFACE)
			elseif pixel = os.get_sys_color (os.COLOR_WINDOW) then
				Result := os.get_sys_color_brush (os.COLOR_WINDOW)
			else
				if brushes = Void then
					create {DS_LINKED_LIST[POINTER]}brushes.make
				end	
				from
					brush_cursor := brushes.new_cursor
					brush_cursor.start
					create logbrush.make_new_unshared
				until
					brush_cursor.off or else found
				loop
					res := os.get_object_a (brush_cursor.item, logbrush.sizeof, logbrush.item)
					if logbrush.lbcolor = pixel then
						found := True
						Result := brush_cursor.item
					end
					brush_cursor.forth
				end
				if not found then
					Result := os.create_solid_brush (pixel)
					brushes.put_last (Result)
				end
			end
		end
	
	brushes : DS_LIST[POINTER]
	
feature -- Measurement

feature -- Comparison

feature -- Status report

	show_with_parent : BOOLEAN
	
	is_enabled : BOOLEAN is
		do
			check_widget
			Result := get_enabled
		end
		
	get_enabled : BOOLEAN is
		do
			Result := UINT32_.u_and (state, Disabled_constant) = 0
		end
		
feature -- Status setting

	set_enabled (enabled : BOOLEAN) is
		do
			check_widget
			state := UINT32_.u_and (state, UINT32_.u_not (Disabled_constant))
			if not enabled then
				state := UINT32_.u_or (state, Disabled_constant)
			end
			if not display.trim_enabled then
				Precursor (enabled)
			else
				if is_active then
					set_item_enabled (os.SC_CLOSE, enabled)
				end
			end
		end
	
	set_item_enabled (cmd : INTEGER; enabled : BOOLEAN) is
		local
			hMenu : POINTER
			flags : INTEGER
			res : INTEGER
		do
			hMenu := os.get_system_menu (handle, 0) -- False
			if hMenu = default_pointer then
				do_nothing
			else
				flags := os.MF_ENABLED
				if not enabled then
					flags := UINT32_.u_or (os.MF_DISABLED, os.MF_GRAYED)
				end
				res := os.enable_menu_item (hMenu, cmd, UINT32_.u_or(os.MF_BYCOMMAND, flags))
			end
		end
		
feature -- Cursor movement

feature {ABSTRACT_WIDGET} -- Element change

	set_active_control (a_control : CONTROL) is
		do
			--FIXME
		end
		
feature -- Element change

	remove_shell_listener (listener : SHELL_LISTENER) is
			-- Removes the listener from the collection of listeners who will be notified 
			-- when operations are performed on Current.
		do
		-- FIXME
		end
		
	set_active is
			-- Moves the receiver to the top of the drawing order for the display on which it was created 
			-- (so that all other shells on that display, which are not the receiver's children will be drawn behind it) 
			-- and asks the window manager to make the shell active.
		do
			--FIXME
		end
	
	set_ime_input_mode (mode : INTEGER) is
			-- Sets the input method editor mode to the argument which should be the result 
			-- of bitwise OR'ing together one or more of the following constants defined 
			-- in class SWT: NONE, ROMAN, DBCS, PHONETIC, NATIVE, ALPHA.
		do
			--FIXME
		end
		
	set_visible (visible : BOOLEAN) is
			-- Marks Current as visible if the argument is true, and marks it invisible otherwise.
		local
			mask : INTEGER
			control : CONTROL
			hwnd_shell : POINTER
			res : INTEGER
		do
			check_widget
			--	/*
			--	* Bug on Windows.  Calling ShowOnedPopups to
			--	* hide the child windows of a hidden window causes the
			--	* application to be deactivated.  The workaround is to
			--	* call ShowOwnedPopups to hide child windows before
			--	* hiding their parent window.
			--	*/
			if show_with_parent and not visible then
				if not os.is_wince then
					res := os.show_owned_popups (handle, 0) -- False
				end
			end
			Precursor (visible)
			if show_with_parent = visible then
				do_nothing
			else
				show_with_parent := visible
				if visible then
					if not os.is_wince then
						res := os.show_owned_popups (handle, 1) -- True
					end
				end
				mask := UINT32_.u_or (swt.Style_primary_modal, UINT32_.u_or (swt.Style_application_modal, swt.Style_system_modal))
				if UINT32_.u_and (style, mask) /= 0 then
					if visible then
						display.set_modal_shell (Current)
						control := display.get_focus_control
						if control /= Void and then control.is_active then
							bring_to_top
						end
						hwnd_shell := os.get_active_window
						if hwnd_shell /= default_pointer then
							if parent /= Void then
								hwnd_shell := parent.handle
							end
						end
						if hwnd_shell /= default_pointer then
							res := os.send_message_a (hwnd_shell, os.WM_CANCELMODE, 0, 0)
						end
						res := os.release_capture
					else
						display.clear_modal (Current)
					end
				else
					update_modal
				end
				
			end			
		end

	set_tooltip_text (hwnd : POINTER; text : STRING) is
			-- Set tooltip `text' for `hwnd'
		do
			if os.is_wince then
				do_nothing
			else
--FIXME
--	if (toolTipHandle == 0) {
--		toolTipHandle = OS.CreateWindowEx (
--			0,
--			new TCHAR (0, OS.TOOLTIPS_CLASS, true),
--			null,
--			OS.TTS_ALWAYSTIP,
--			OS.CW_USEDEFAULT, 0, OS.CW_USEDEFAULT, 0,
--			handle,
--			0,
--			OS.GetModuleHandle (null),
--			null);
--		if (toolTipHandle == 0) error (SWT.ERROR_NO_HANDLES);	
--		/*
--		* Feature in Windows.  Despite the fact that the
--		* tool tip text contains \r\n, the tooltip will
--		* not honour the new line unless TTM_SETMAXTIPWIDTH
--		* is set.  The fix is to set TTM_SETMAXTIPWIDTH to
--		* a large value.
--		*/
--		OS.SendMessage (toolTipHandle, OS.TTM_SETMAXTIPWIDTH, 0, 0x7FFF);
--	}
--	TOOLINFO lpti = new TOOLINFO ();
--	lpti.cbSize = TOOLINFO.sizeof;
--	lpti.uId = hwnd;
--	lpti.hwnd = handle;
--	if (text == null) {
--		OS.SendMessage (toolTipHandle, OS.TTM_DELTOOL, 0, lpti);
--	} else {
--		lpti.uFlags = OS.TTF_IDISHWND | OS.TTF_SUBCLASS;
--		lpti.lpszText = OS.LPSTR_TEXTCALLBACK;
--		OS.SendMessage (toolTipHandle, OS.TTM_ADDTOOL, 0, lpti);
--	}
--	OS.SendMessage (toolTipHandle, OS.TTM_UPDATE, 0, 0);
	
			end
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
		local
			msg : MSG
			res : INTEGER
			bres : BOOLEAN
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
					bres := traverse_group (true)
				end
		end

	add_shell_listener (listener : SHELL_LISTENER) is
			-- Adds the listener to the collection of listeners who will be notified when operations are performed on 
			-- Current, by sending the listener one of the messages defined in the ShellListener interface.  
		do
			--FIXME
		end
		
	close is
			-- Requests that the window manager close the receiver in the same way it would be closed when the user clicks on the "close box" or performs some other platform 
			-- specific key or mouse combination that indicates the window should be removed. 
		do
			--FIXME
		end
	
	dispose_resources is
			-- Disposes of the operating system resources associated with the receiver and all its descendents.
		do
			--FIXME
		end

	force_active is
			-- Moves the receiver to the top of the drawing order for the display on which it was created (so 
			-- that all other shells on that display, which are not Current's 
			-- children will be drawn behind it) and forces the window manager to make the shell active. 
		do
			--FIXME
			
		end

	release_widget is
		local
			hheap : POINTER
			res : INTEGER
		do
			release_shells
			Precursor
			active_menu := Void
			display.clear_modal (Current)
			display := Void
			if lpstr_tip /= default_pointer then
--FIXME: check is lpstr_tip has been allocated by os.heap_alloc
--       remove if not because a segmentation violation could occur.
				hHeap := os.get_process_heap
				res := os.heap_free (hHeap, 0, lpstr_tip)
			end
			lpstr_tip := default_pointer
			if brushes /= Void then
				from
					brushes.start
				until
					brushes.off
				loop
					if brushes.item_for_iteration /= default_pointer then
						res := os.delete_object (brushes.item_for_iteration)
					end
					brushes.forth
				end
			end
			brushes := Void
			if os.is_db_locale then
				if himc /= default_pointer then
					res := os.imm_destroy_context (himc)
				end
			end
			last_active := Void
		end
	
	release_shells is
		local
			cursor : DS_LIST_CURSOR[SHELL]
		do
			from
				cursor := get_shells.new_cursor
			until
				cursor.off
			loop
				if not cursor.item.is_resource_disposed then
					cursor.item.release_resources
				end
				cursor.forth
			end
		end
		
feature {CONTROL, DRAWABLE} -- Basic operations

	update_modal is
		do
			if not display.trim_enabled then
				super_set_enabled (is_active)
			else
				set_item_enabled (os.SC_CLOSE, is_active)
			end
		end

	call_window_proc (msg: INTEGER; wparam: INTEGER; lparam: INTEGER) : INTEGER is
		do
			if parent /= Void then
				if handle /= default_pointer then
					if msg = os.WM_KILLFOCUS or else msg = os.WM_SETFOCUS then
						Result := os.def_window_proc_a (handle, msg, wParam, lparam)
					else
						Result := os.call_window_proc_a (dialog_proc_pointer, handle, msg, wparam, lparam)
					end
				end
			else
				Result := Precursor (msg, wparam, lparam)
			end			
		end
		
	do_WM_ACTIVATE (wparam, lparam : INTEGER) : LRESULT is
		local
			res : INTEGER
		do
			if os.is_ppc then
				--FIXME
			end
			if UINT32_.u_or(UINT32_.left_shift (os.win32_major, 16), os.win32_minor) >=
				UINT32_.u_or(UINT32_.left_shift (5, 16), 1) then
				if UINT32_.u_and(wparam, UINT32_.hexadecimal_to_integer("FFFF")) = 0 and then os.is_db_locale and then hIMC /= default_pointer then
					res := os.imm_set_open_status (hIMC, 0) -- False
				end
			end
			Result := Precursor (wparam, lparam)
			if parent /= Void then
				create Result
				Result.set_value (0)
			end
		end

	do_WM_CLOSE (wparam, lparam : INTEGER) : LRESULT is
		local
		do
--FIXME		if  then
--				
--			end
			Result := Precursor (wparam, lparam)
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation
		
--static Shell win32_new(Display display, int handle) 
--          Invokes platform specific functionality to allocate a new shell. 

	create_handle is
		local
			l_embedded : BOOLEAN
			l_bits : INTEGER
			res : INTEGER
		do
			l_embedded := handle /= default_pointer
			Precursor
			if not l_embedded then
				l_bits := os.get_window_long_a (handle, os.GWL_STYLE)
				l_bits := UINT32_.u_and (l_bits, UINT32_.u_not (UINT32_.u_or (os.WS_OVERLAPPED, os.WS_CAPTION)))
				l_bits := UINT32_.u_or (l_bits, os.WS_POPUP)
				if UINT32_.u_and (style, swt.Style_title) /= 0 then
					l_bits := UINT32_.u_or (l_bits, os.WS_CAPTION)
				end
				if UINT32_.u_and (style, swt.Style_no_trim) = 0 then
					if UINT32_.u_and (style, UINT32_.u_or (swt.style_border , swt.style_resize)) = 0 then
						l_bits := UINT32_.u_or (l_bits, os.WS_BORDER)
					end
				end
				res := os.set_window_long_a (handle, os.GWL_STYLE, l_bits)
			end
			if os.is_db_locale then
--		hIMC = OS.ImmCreateContext ();
--		if (hIMC != 0) OS.ImmAssociateContext (handle, hIMC);
			end
		end
		
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
