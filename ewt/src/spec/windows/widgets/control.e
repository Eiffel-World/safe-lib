indexing
	description: "Windows implementation of ABSTRACT_CONTROL"
	date: "$Date: 2004/06/29 19:57:56 $";
	revision: "$Revision: 1.8 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	CONTROL

inherit	
	WIDGET
		undefine
			release_handle,
			destroy_widget,
			release_widget
		end
	
	DRAWABLE
	
	ABSTRACT_CONTROL
		redefine
			release_handle,
			destroy_widget,
			release_widget
		end

	WIN32_MESSAGE_CONSTANTS
		export 
			{NONE} all
		end
		
	SHARED_WIDGET_TABLE
		export
			{NONE} all
		end

feature {NONE} -- Initialization

feature -- Access

	get_display : DISPLAY is
			-- Returns the Display that is associated with the receiver.
			--  A widget's display is either provided when it is created (for example, top level Shells) or is the
			-- same as its parent's display.
		local
			a_parent : COMPOSITE
		do
			a_parent ?= parent
			if parent = Void then
				error (swt.Error_widget_disposed)
			else
				Result := parent.get_display
			end
		end

	handle : POINTER
			-- Handle to the OS ressource.

	get_shell : SHELL is
		do
			check_widget
			Result := parent.get_shell			
		end
		
feature -- Measurement

feature -- Comparison

feature -- Status report

	is_focus_ancestor : BOOLEAN is
		local
			l_display : DISPLAY
		do
			l_display := get_display
--	Control control = display.getFocusControl ();
--	while (control != null && control != this) {
--		control = control.parent;
--	}
--	return control == this;
		end

feature -- Status setting

	set_visible (visible : BOOLEAN) is
			-- Marks the receiver as visible if the argument is <code>true</code>,
			-- and marks it invisible otherwise. 
			-- If one of the receiver's ancestors is not visible or some
			-- other condition makes the receiver not visible, marking
			-- it visible may not actually cause it to be displayed.
		local
			bits : INTEGER
			must_fix_focus : BOOLEAN
			visibility : INTEGER
			res : INTEGER
		do
			check_widget
			bits := os.get_window_long_a (handle, os.GWL_STYLE)
			if (UINT32_.u_and (bits, os.WS_VISIBLE) /= 0) = visible then
				do_nothing
			else
				if visible then
	--				* It is possible (but unlikely), that application
	--				* code could have disposed the widget in the show
	--				* event.  If this happens, just return.
					send_event_by_type (SWT.Event_show);
					if not is_resource_disposed then	
						--	* Feature in Windows.  If the receiver has focus, hiding
						--	* the receiver causes no window to have focus.  The fix is
						--	* to assign focus to the first ancestor window that takes
						--	* focus.  If no window will take focus, set focus to the
						--	* desktop.
						must_fix_focus := False
						if not visible then
							must_fix_focus := is_focus_ancestor
						end
						if visible then
							visibility := os.SW_SHOW
						else
							visibility := os.SW_HIDE
						end
						res := os.show_window (handle, visibility)
						if visible then
							if must_fix_focus then
								fix_focus
							end
						end
					end
				end
			end
		end

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	fix_focus is
		local
			l_shell : SHELL
			l_control : CONTROL
		do
			l_shell := get_shell
			l_control := Current
--	while ((control = control.parent) != null) {
--		if (control.setFocus () || control == shell) return;
--	}
--	OS.SetFocus (0);			
		end

	window_proc (msg, wparam, lparam : INTEGER) : INTEGER is
		local
			l_result : LRESULT
		do
			--| FIXME
			--	LRESULT result = null;
			inspect msg
				when WM_ACTIVATE then			l_result := do_WM_ACTIVATE (wParam, lParam)
				when WM_CHAR then				l_result := do_WM_CHAR (wParam, lParam)
				when WM_CLEAR then				l_result := do_WM_CLEAR (wParam, lParam)
				when WM_CLOSE then				l_result := do_WM_CLOSE (wParam, lParam)
				when WM_COMMAND then			l_result := do_WM_COMMAND (wParam, lParam)
				when WM_CONTEXTMENU then		l_result := do_WM_CONTEXTMENU (wParam, lParam)
				when WM_CTLCOLORBTN then
				when WM_CTLCOLORDLG then
				when WM_CTLCOLOREDIT then
				when WM_CTLCOLORLISTBOX then
				when WM_CTLCOLORMSGBOX then
				when WM_CTLCOLORSCROLLBAR then
				when WM_CTLCOLORSTATIC then		l_result := do_WM_CTLCOLOR (wParam, lParam)
				when WM_CUT then				l_result := do_WM_CUT (wParam, lParam)
				when WM_DESTROY then			l_result := do_WM_DESTROY (wParam, lParam)
				when WM_DRAWITEM then			l_result := do_WM_DRAWITEM (wParam, lParam)
				when WM_ENDSESSION then			l_result := do_WM_ENDSESSION (wParam, lParam)
				when WM_ERASEBKGND then			l_result := do_WM_ERASEBKGND (wParam, lParam)
				when WM_GETDLGCODE then			l_result := do_WM_GETDLGCODE (wParam, lParam)
				when WM_HELP then				l_result := do_WM_HELP (wParam, lParam)
				when WM_HSCROLL then			l_result := do_WM_HSCROLL (wParam, lParam)
				when WM_IME_CHAR then			l_result := do_WM_IME_CHAR (wParam, lParam)
				when WM_IME_COMPOSITION then	l_result := do_WM_IME_COMPOSITION (wParam, lParam)
				when WM_INITMENUPOPUP then		l_result := do_WM_INITMENUPOPUP (wParam, lParam)
				when WM_GETFONT then			l_result := do_WM_GETFONT (wParam, lParam)
				when WM_GETOBJECT then			l_result := do_WM_GETOBJECT (wParam, lParam)
				when WM_HOTKEY then				l_result := do_WM_HOTKEY (wParam, lParam)		
				when WM_KEYDOWN then			l_result := do_WM_KEYDOWN (wParam, lParam)
				when WM_KEYUP then				l_result := do_WM_KEYUP (wParam, lParam)
				when WM_KILLFOCUS then			l_result := do_WM_KILLFOCUS (wParam, lParam)
				when WM_LBUTTONDBLCLK then		l_result := do_WM_LBUTTONDBLCLK (wParam, lParam)
				when WM_LBUTTONDOWN then		l_result := do_WM_LBUTTONDOWN (wParam, lParam)
				when WM_LBUTTONUP then			l_result := do_WM_LBUTTONUP (wParam, lParam)
				when WM_MBUTTONDBLCLK then		l_result := do_WM_MBUTTONDBLCLK (wParam, lParam)
				when WM_MBUTTONDOWN then		l_result := do_WM_MBUTTONDOWN (wParam, lParam)
				when WM_MBUTTONUP then			l_result := do_WM_MBUTTONUP (wParam, lParam)
				when WM_MEASUREITEM then		l_result := do_WM_MEASUREITEM (wParam, lParam)
				when WM_MENUCHAR then			l_result := do_WM_MENUCHAR (wParam, lParam)
				when WM_MENUSELECT then			l_result := do_WM_MENUSELECT (wParam, lParam)
				when WM_MOUSEACTIVATE then		l_result := do_WM_MOUSEACTIVATE (wParam, lParam)
				when WM_MOUSEHOVER then			l_result := do_WM_MOUSEHOVER (wParam, lParam)
				when WM_MOUSELEAVE then			l_result := do_WM_MOUSELEAVE (wParam, lParam)
				when WM_MOUSEMOVE then			l_result := do_WM_MOUSEMOVE (wParam, lParam)
				when WM_MOUSEWHEEL then			l_result := do_WM_MOUSEWHEEL (wParam, lParam)
				when WM_MOVE then				l_result := do_WM_MOVE (wParam, lParam)
				when WM_NCACTIVATE then			l_result := do_WM_NCACTIVATE (wParam, lParam)
				when WM_NCCALCSIZE then			l_result := do_WM_NCCALCSIZE (wParam, lParam)
				when WM_NCHITTEST then			l_result := do_WM_NCHITTEST (wParam, lParam)
				when WM_NOTIFY then				l_result := do_WM_NOTIFY (wParam, lParam)
				when WM_PAINT then				l_result := do_WM_PAINT (wParam, lParam)
				when WM_PALETTECHANGED then		l_result := do_WM_PALETTECHANGED (wParam, lParam)
				when WM_PARENTNOTIFY then		l_result := do_WM_PARENTNOTIFY (wParam, lParam)
				when WM_PASTE then				l_result := do_WM_PASTE (wParam, lParam)
				when WM_PRINTCLIENT then		l_result := do_WM_PRINTCLIENT (wParam, lParam)
				when WM_QUERYENDSESSION then	l_result := do_WM_QUERYENDSESSION (wParam, lParam)
				when WM_QUERYNEWPALETTE then	l_result := do_WM_QUERYNEWPALETTE (wParam, lParam)
				when WM_QUERYOPEN then			l_result := do_WM_QUERYOPEN (wParam, lParam)
				when WM_RBUTTONDBLCLK then		l_result := do_WM_RBUTTONDBLCLK (wParam, lParam)
				when WM_RBUTTONDOWN then		l_result := do_WM_RBUTTONDOWN (wParam, lParam)
				when WM_RBUTTONUP then			l_result := do_WM_RBUTTONUP (wParam, lParam)
				when WM_SETCURSOR then			l_result := do_WM_SETCURSOR (wParam, lParam)
				when WM_SETFOCUS then			l_result := do_WM_SETFOCUS (wParam, lParam)
				when WM_SETFONT then			l_result := do_WM_SETFONT (wParam, lParam)
				when WM_SETTINGCHANGE then		l_result := do_WM_SETTINGCHANGE (wParam, lParam)
				when WM_SETREDRAW then			l_result := do_WM_SETREDRAW (wParam, lParam)
				when WM_SHOWWINDOW then			l_result := do_WM_SHOWWINDOW (wParam, lParam)
				when WM_SIZE then				l_result := do_WM_SIZE (wParam, lParam)
				when WM_SYSCHAR then			l_result := do_WM_SYSCHAR (wParam, lParam)
				when WM_SYSCOLORCHANGE then		l_result := do_WM_SYSCOLORCHANGE (wParam, lParam)
				when WM_SYSCOMMAND then			l_result := do_WM_SYSCOMMAND (wParam, lParam)
				when WM_SYSKEYDOWN then			l_result := do_WM_SYSKEYDOWN (wParam, lParam)
				when WM_SYSKEYUP then			l_result := do_WM_SYSKEYUP (wParam, lParam)
				when WM_TIMER then				l_result := do_WM_TIMER (wParam, lParam)
				when WM_UNDO then				l_result := do_WM_UNDO (wParam, lParam)
				when WM_VSCROLL then			l_result := do_WM_VSCROLL (wParam, lParam)
				when WM_WINDOWPOSCHANGED then	l_result := do_WM_WINDOWPOSCHANGED (wParam, lParam)
				when WM_WINDOWPOSCHANGING then	l_result := do_WM_WINDOWPOSCHANGING (wParam, lParam)
			else
			end
			if l_result /= Void then
				Result := l_result.value
			else
				Result := call_window_proc (msg, wParam, lParam)
			end
		end

	do_WM_ACTIVATE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_CHAR (wParam, lParam : INTEGER) : LRESULT is
		do

	--	/*
	--	* Do not report a lead byte as a key pressed.
	--	*/
	--	Display display = getDisplay ();
	--	if (!OS.IsUnicode && OS.IsDBLocale) {
	--		byte lead = (byte) (wParam & 0xFF);
	--		if (OS.IsDBCSLeadByte (lead)) return null;
	--	}
	--	
	--	/*
	--	* Use VkKeyScan () to tell us if the character is a control
	--	* or a numeric key pad character with Num Lock down.  On
	--	* international keyboards, the control key may be down when
	--	* the character is not a control character.  In this case
	--	* use the last key (computed in WM_KEYDOWN) instead of wParam
	--	* as the keycode because there is not enough information to
	--	* compute the keycode in WPARAM.
	--	*/
	--	display.lastAscii = wParam;
	--	display.lastNull = false;
	--	if (display.lastKey == 0) {
	--		display.lastKey = wParam;
	--		display.lastVirtual = display.isVirtualKey (wParam);
	--	} else {
	--		int result = OS.IsWinCE ? 0 : OS.VkKeyScan ((short) wParam);
	--		if (!OS.IsWinCE && (result == -1 || (result >> 8) <= 2)) {
	--			if (OS.GetKeyState (OS.VK_CONTROL) < 0) {
	--				display.lastVirtual = display.isVirtualKey (display.lastKey);
	--			}
	--		} else {
	--			display.lastKey = wParam;
	--			display.lastVirtual = false;
	--		}
	--	}
	--	if (!sendKeyEvent (SWT.KeyDown, OS.WM_CHAR, wParam, lParam)) {
	--		return LRESULT.ZERO;
	--	}
	--	return null;
		end

	do_WM_CLEAR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_CLOSE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_COMMAND (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* When the WM_COMMAND message is sent from a
	--	* menu, the HWND parameter in LPARAM is zero.
	--	*/
	--	if (lParam == 0) {
	--		Decorations shell = menuShell ();
	--		if (shell.isEnabled ()) {
	--			int id = wParam & 0xFFFF;
	--			MenuItem item = shell.findMenuItem (id);
	--			if (item != null && item.isEnabled ()) {
	--				return item.wmCommandChild (wParam, lParam);
	--			}
	--		}
	--		return null;
	--	}
	--	Control control = WidgetTable.get (lParam);
	--	if (control == null) return null;
	--	return control.wmCommandChild (wParam, lParam);
		end

	do_WM_CONTEXTMENU (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (wParam != handle) return null;
	--	
	--	/*
	--	* Feature in Windows.  When the user presses  WM_NCRBUTTONUP,
	--	* a WM_CONTEXTMENU message is generated.  This happens when
	--	* the user releases the mouse over a scroll bar.  Normally,
	--	* window displays the default scrolling menu but applications
	--	* can process WM_CONTEXTMENU to display a different menu.
	--	* Typically, an application does not want to supply a special
	--	* scroll menu.  The fix is to look for a WM_CONTEXTMENU that
	--	* originated from a mouse event and display the menu when the
	--	* mouse was released in the client area.
	--	*/
	--	POINT pt = new POINT ();
	--	pt.x = (short) (lParam & 0xFFFF);
	--	pt.y = (short) (lParam >> 16);
	--	if (pt.x != -1 || pt.y != -1) {
	--		RECT rect = new RECT ();
	--		OS.GetClientRect (handle, rect);
	--		OS.ScreenToClient (handle, pt);
	--		if (!OS.PtInRect (rect, pt)) return null;
	--	}
	--	
	--	/*
	--	* Because context menus can be shared between controls
	--	* and the parent of all menus is the shell, the menu may
	--	* have been destroyed.
	--	*/
	--	if (menu != null && !menu.isDisposed ()) {
	--//		menu.setLocation (x, y);
	--		menu.setVisible (true);
	--		return LRESULT.ZERO;
	--	}
	--	return null;
		end

	do_WM_CTLCOLOR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	Display display = getDisplay ();
	--	int hPalette = display.hPalette;
	--	if (hPalette != 0) {
	--		OS.SelectPalette (wParam, hPalette, false);
	--		OS.RealizePalette (wParam);
	--	}
	--	Control control = WidgetTable.get (lParam);
	--	if (control == null) return null;
	--	return control.wmColorChild (wParam, lParam);
		end

	do_WM_CUT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_DESTROY (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_DRAWITEM (wParam, lParam : INTEGER) : LRESULT is
		do
	--	DRAWITEMSTRUCT struct = new DRAWITEMSTRUCT ();
	--	OS.MoveMemory (struct, lParam, DRAWITEMSTRUCT.sizeof);
	--	if (struct.CtlType == OS.ODT_MENU) {
	--		Decorations shell = menuShell ();
	--		MenuItem item = shell.findMenuItem (struct.itemID);
	--		if (item == null) return null;
	--		return item.wmDrawChild (wParam, lParam);
	--	}
	--	Control control = WidgetTable.get (struct.hwndItem);
	--	if (control == null) return null;
	--	return control.wmDrawChild (wParam, lParam);
		end

	do_WM_ENDSESSION (wParam, lParam : INTEGER) : LRESULT is
		do
			do_nothing
	--	return null;
		end

	do_WM_ERASEBKGND (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_GETDLGCODE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_GETFONT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_GETOBJECT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (accessible != null) {
	--		int result = accessible.internal_WM_GETOBJECT (wParam, lParam);
	--		if (result != 0) return new LRESULT (result);
	--	}
	--	return null;
		end

	do_WM_HOTKEY (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_HELP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (OS.IsWinCE) return null;
	--	HELPINFO lphi = new HELPINFO ();
	--	OS.MoveMemory (lphi, lParam, HELPINFO.sizeof);
	--	Decorations shell = menuShell ();
	--	if (!shell.isEnabled ()) return null;
	--	if (lphi.iContextType == OS.HELPINFO_MENUITEM) {
	--		MenuItem item = shell.findMenuItem (lphi.iCtrlId);
	--		if (item != null && item.isEnabled ()) {
	--			Widget widget = null;
	--			if (item.hooks (SWT.Help)) {
	--				widget = item;
	--			} else {
	--				Menu menu = item.parent;
	--				if (menu.hooks (SWT.Help)) widget = menu;
	--			}
	--			if (widget != null) {
	--				int hwndShell = shell.handle;
	--				OS.SendMessage (hwndShell, OS.WM_CANCELMODE, 0, 0);
	--				widget.postEvent (SWT.Help);
	--				return LRESULT.ONE;
	--			}
	--		}
	--		return null;
	--	}
	--	if (hooks (SWT.Help)) {
	--		postEvent (SWT.Help);
	--		return LRESULT.ONE;
	--	}
	--	return null;
		end

	do_WM_HSCROLL (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (lParam == 0) return null;
	--	Control control = WidgetTable.get (lParam);
	--	if (control == null) return null;
	--	return control.wmScrollChild (wParam, lParam);
		end

	do_WM_IME_CHAR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	Display display = getDisplay ();
	--	display.lastKey = 0;
	--	display.lastAscii = wParam;
	--	display.lastVirtual = display.lastNull = false;
	--	sendKeyEvent (SWT.KeyDown, OS.WM_IME_CHAR, wParam, lParam);
	--	sendKeyEvent (SWT.KeyUp, OS.WM_IME_CHAR, wParam, lParam);
	--	display.lastKey = display.lastAscii = 0;
	--	return LRESULT.ZERO;
		end

	do_WM_IME_COMPOSITION (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_INITMENUPOPUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	
	--	/* Ignore WM_INITMENUPOPUP for an accelerator */
	--	Display display = getDisplay ();
	--	if (display.accelKeyHit) return null;

	--	/*
	--	* If the high order word of LPARAM is non-zero,
	--	* the menu is the system menu and we can ignore
	--	* WPARAM.  Otherwise, use WPARAM to find the menu.
	--	*/
	--	Shell shell = getShell ();
	--	Menu oldMenu = shell.activeMenu, newMenu = null;
	--	if ((lParam >> 16) == 0) {
	--		newMenu = menuShell ().findMenu (wParam);
	--	}	
	--	Menu menu = newMenu;
	--	while (menu != null && menu != oldMenu) {
	--		menu = menu.getParentMenu ();
	--	}
	--	if (menu == null) {
	--		menu = shell.activeMenu;
	--		while (menu != null) {
	--			/*
	--			* It is possible (but unlikely), that application
	--			* code could have disposed the widget in the hide
	--			* event.  If this happens, stop searching up the
	--			* ancestor list because there is no longer a link
	--			* to follow.
	--			*/
	--			menu.sendEvent (SWT.Hide);
	--			if (menu.isDisposed ()) break;
	--			menu = menu.getParentMenu ();
	--			Menu ancestor = newMenu;
	--			while (ancestor != null && ancestor != menu) {
	--				ancestor = ancestor.getParentMenu ();
	--			}
	--			if (ancestor != null) break;
	--		}
	--	}
	--	
	--	/*
	--	* The shell and the new menu may be disposed because of
	--	* sending the hide event to the ancestor menus but setting
	--	* a field to null in a disposed shell is not harmful.
	--	*/
	--	if (newMenu != null && newMenu.isDisposed ()) newMenu = null;
	--	shell.activeMenu = newMenu;
	--	
	--	/*
	--	* Send the show event
	--	*/
	--	if (newMenu != null && newMenu != oldMenu) {
	--		/*
	--		* SWT.Selection events are posted to allow stepping
	--		* in the VA/Java debugger.  SWT.Show events are
	--		* sent to ensure that application event handler
	--		* code runs before the menu is displayed.  This
	--		* means that SWT.Show events would normally occur
	--		* before SWT.Selection events.  While this is not 
	--		* strictly incorrect, applications often use the 
	--		* SWT.Selection event to update the state of menu
	--		* items and would like the ordering of events to 
	--		* be the other way around.
	--		*
	--		* The fix is to run the deferred events before
	--		* the menu is shown.  This means that stepping
	--		* through a selection event that was caused by
	--		* a popup menu will fail in VA/Java.
	--		*/
	--		display.runDeferredEvents ();
	--		newMenu.sendEvent (SWT.Show);
	--		// widget could be disposed at this point
	--	}
	--	return null;
		end

	do_WM_KEYDOWN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	
	--	/* Ignore repeating modifier keys by testing key down state */
	--	switch (wParam) {
	--		case OS.VK_SHIFT:
	--		case OS.VK_MENU:
	--		case OS.VK_CONTROL:
	--		case OS.VK_CAPITAL:
	--		case OS.VK_NUMLOCK:
	--		case OS.VK_SCROLL:
	--			if ((lParam & 0x40000000) != 0) return null;
	--	}
	--	
	--	/* Clear last key and last ascii because a new key has been typed */
	--	Display display = getDisplay ();
	--	display.lastAscii = display.lastKey = 0;
	--	display.lastVirtual = display.lastNull = false;

	--	/*
	--	* Do not report a lead byte as a key pressed.
	--	*/
	--	if (!OS.IsUnicode && OS.IsDBLocale) {
	--		byte lead = (byte) (wParam & 0xFF);
	--		if (OS.IsDBCSLeadByte (lead)) return null;
	--	}
	--	
	--	/* Map the virtual key */
	--	/*
	--	* Bug on WinCE.  MapVirtualKey() returns incorrect values.
	--	* The fix is to rely on a key mappings table to determine
	--	* whether the key event must be sent now or if a WM_CHAR
	--	* event will follow.
	--	*/
	--	int mapKey = OS.IsWinCE ? 0 : OS.MapVirtualKey (wParam, 2);

	--	/*
	--	* Bug in Windows 95 and NT.  When the user types an accent key such
	--	* as ^ to get an accented character on a German keyboard, the accent
	--	* key should be ignored and the next key that the user types is the
	--	* accented key.  On Windows 95 and NT, a call to ToAscii (), clears the
	--	* accented state such that the next WM_CHAR loses the accent.  The fix
	--	* is to detect the accent key stroke (called a dead key) by testing the
	--	* high bit of the value returned by MapVirtualKey ().  A further problem
	--	* is that the high bit on Windows NT is bit 32 while the high bit on
	--	* Windows 95 is bit 16.  They should both be bit 32.
	--	* 
	--	* NOTE: This code is used to avoid a call to ToAscii ().
	--	*/
	--	if (OS.IsWinNT) {
	--		if ((mapKey & 0x80000000) != 0) return null;
	--	} else {
	--		if ((mapKey & 0x8000) != 0) return null;
	--	}
	--	
	--	/*
	--	* Bug in Windows.  When the accent key is generated on an international
	--	* keyboard using Ctrl+Alt or the special key, MapVirtualKey () does not
	--	* have the high bit set indicating that this is an accent key stroke.
	--	* The fix is to iterate through all known accent, mapping them back to
	--	* their corresponding virtual key and key state.  If the virtual key
	--	* and key state match the current key, then this is an accent that has
	--	* been generated using an international keyboard and calling ToAscii ()
	--	* will clear the accent state.
	--	* 
	--	* NOTE: This code is used to avoid a call to ToAscii ().
	--	*/
	--	if (!OS.IsWinCE) {
	--		for (int i=0; i<ACCENTS.length; i++) {
	--			int value = OS.VkKeyScan (ACCENTS [i]);
	--			if ((value & 0xFF) == wParam && (value & 0x600) == 0x600) {
	--				return null;
	--			}
	--		}
	--	}
	--	
	--	/*
	--	* If we are going to get a WM_CHAR, ensure that last key has
	--	* the correct character value for the key down and key up
	--	* events.  It is not sufficient to ignore the WM_KEYDOWN
	--	* (when we know we are going to get a WM_CHAR) and compute
	--	* the key in WM_CHAR because there is not enough information
	--	* by the time we get the WM_CHAR.  For example, when the user
	--	* types Ctrl+Shift+6 on a US keyboard, we get a WM_CHAR with 
	--	* wParam=30.  When the user types Ctrl+Shift+6 on a German 
	--	* keyboard, we also get a WM_CHAR with wParam=30.  On the US
	--	* keyboard Shift+6 is ^, on the German keyboard Shift+6 is &.
	--	* There is no way to map wParam=30 in WM_CHAR to the correct
	--	* value.  Also, on international keyboards, the control key
	--	* may be down when the user has not entered a control character.
	--	*/
	--	display.lastKey = wParam;
	--	display.lastVirtual = (mapKey == 0);
	--	if (display.lastVirtual) {
	--		/*
	--		* Feature in Windows.  The virtual key VK_DELETE is not
	--		* treated as both a virtual key and an ASCII key by Windows.
	--		* Therefore, we will not receive a WM_CHAR for this key.
	--		* The fix is to treat VK_DELETE as a special case and map
	--		* the ASCII value explictly (Delete is 0x7F).
	--		*/
	--		if (display.lastKey == OS.VK_DELETE) display.lastAscii = 0x7F;
	--		/*
	--		* It is possible to get a WM_CHAR for a virtual key when
	--		* Num Lock is on.  If the user types Home while Num Lock 
	--		* is down, a WM_CHAR is issued with WPARM=55 (for the
	--		* character 7).  If we are going to get a WM_CHAR we need
	--		* to ensure that the last key has the correct value.  Note
	--		* that Ctrl+Home does not issue a WM_CHAR when Num Lock is
	--		* down.
	--		*/
	--		if (OS.VK_NUMPAD0 <= display.lastKey && display.lastKey <= OS.VK_DIVIDE) {
	--			if (display.asciiKey (display.lastKey) != 0) return null;
	--			display.lastAscii = display.numpadKey (display.lastKey);
	--		}
	--	} else {
	--		/*
	--		* Get the shifted state or convert to lower case if necessary.
	--		* If the user types Ctrl+A, LastKey should be 'a', not 'A'.  If
	--		* the user types Ctrl+Shift+A, LastKey should be 'A'.  If the user 
	--		* types Ctrl+Shift+6, the value of LastKey will depend on the 
	--		* international keyboard.
	--		*/
	--	 	if (OS.GetKeyState (OS.VK_SHIFT) < 0) {
	--			display.lastKey = display.shiftedKey (display.lastKey);
	--			if (display.lastKey == 0) display.lastKey = wParam;
	--	 	} else {
	--	 		display.lastKey = OS.CharLower ((short) mapKey);
	--	 	}
	--		/*
	--		* Some key combinations map to Windows ASCII keys depending
	--		* on the keyboard.  For example, Ctrl+Alt+Q maps to @ on a
	--		* German keyboard.  If the current key combination is special,
	--		* the correct character is placed in wParam for processing in
	--		* WM_CHAR.  If this is the case, issue the key down event from
	--		* inside WM_CHAR.
	--		*/
	--		int asciiKey = display.asciiKey (wParam);
	--		if (asciiKey != 0) {
	--			/*
	--			* When the user types Ctrl+Space, ToAscii () maps this to
	--			* Space.  Normally, ToAscii () maps a key to a different
	--			* key if both a WM_KEYDOWN and a WM_CHAR will be issued.
	--			* To avoid the extra SWT.KeyDown, look for VK_SPACE and
	--			* issue the event from WM_CHAR.
	--			*/
	--			if (asciiKey == OS.VK_SPACE) {
	--				display.lastVirtual = true;
	--				return null;
	--			}
	--			if (asciiKey != wParam) return null;
	--		}
	--			
	--		/*
	--		* If the control key is not down at this point, then
	--		* the key that was pressed was an accent key.  In that
	--		* case, do not issue the key down event.
	--		*/
	--		if (OS.GetKeyState (OS.VK_CONTROL) >= 0) {
	--			display.lastKey = 0;
	--			return null;
	--		}
	--		
	--		/*
	--		* Virtual keys such as VK_RETURN are both virtual and ASCII keys.
	--		* Normally, these are marked virtual in WM_CHAR.  Since we will not
	--		* be getting a WM_CHAR for the key at this point, we need to test
	--		* LastKey to see if it is virtual.  This happens when the user types
	--		* Ctrl+Tab.
	--		*/
	--		display.lastVirtual = display.isVirtualKey (wParam);
	--		display.lastAscii = display.controlKey (display.lastKey);
	--		display.lastNull = display.lastAscii == 0 && display.lastKey == '@';
	--	}
	--	if (!sendKeyEvent (SWT.KeyDown, OS.WM_KEYDOWN, wParam, lParam)) {
	--		return LRESULT.ZERO;
	--	}
	--	return null;
		end

	do_WM_KEYUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	Display display = getDisplay ();
	--	
	--	/* Check for hardware keys */
	--	if (OS.IsWinCE) {
	--		if (OS.VK_APP1 <= wParam && wParam <= OS.VK_APP6) {
	--			display.lastKey = display.lastAscii = 0;
	--			display.lastVirtual = display.lastNull = false;
	--			Event event = new Event ();
	--			event.detail = wParam - OS.VK_APP1 + 1;
	--			/* Check the bit 30 to get the key state */
	--			int type = (lParam & 0x40000000) != 0 ? SWT.HardKeyUp : SWT.HardKeyDown;
	--			if (setInputState (event, type)) sendEvent (type, event);
	--			return null;
	--		}
	--	}
	--	
	--	/*
	--	* If the key up is not hooked, reset last key
	--	* and last ascii in case the key down is hooked.
	--	*/
	--	if (!hooks (SWT.KeyUp) && !display.filters (SWT.KeyUp)) {
	--		display.lastKey = display.lastAscii = 0;
	--		display.lastVirtual = display.lastNull = false;
	--		return null;
	--	}
	--	
	--	/* Map the virtual key. */
	--	/*
	--	* Bug on WinCE.  MapVirtualKey() returns incorrect values.
	--	* The fix is to rely on a key mappings table to determine
	--	* whether the key event must be sent now or if a WM_CHAR
	--	* event will follow.
	--	*/
	--	int mapKey = OS.IsWinCE ? 0 : OS.MapVirtualKey (wParam, 2);

	--	/*
	--	* Bug in Windows 95 and NT.  When the user types an accent key such
	--	* as ^ to get an accented character on a German keyboard, the accent
	--	* key should be ignored and the next key that the user types is the
	--	* accented key.  On Windows 95 and NT, a call to ToAscii (), clears the
	--	* accented state such that the next WM_CHAR loses the accent.  The fix
	--	* is to detect the accent key stroke (called a dead key) by testing the
	--	* high bit of the value returned by MapVirtualKey ().  A further problem
	--	* is that the high bit on Windows NT is bit 32 while the high bit on
	--	* Windows 95 is bit 16.  They should both be bit 32.
	--	* 
	--	* NOTE: This code is used to avoid a call to ToAscii ().
	--	* 
	--	*/
	--	if (OS.IsWinNT) {
	--		if ((mapKey & 0x80000000) != 0) return null;
	--	} else {
	--		if ((mapKey & 0x8000) != 0) return null;
	--	}
	--	
	--	/*
	--	* Bug in Windows.  When the accent key is generated on an international
	--	* keyboard using Ctrl+Alt or the special key, MapVirtualKey () does not
	--	* have the high bit set indicating that this is an accent key stroke.
	--	* The fix is to iterate through all known accent, mapping them back to
	--	* their corresponding virtual key and key state.  If the virtual key
	--	* and key state match the current key, then this is an accent that has
	--	* been generated using an international keyboard.
	--	* 
	--	* NOTE: This code is used to avoid a call to ToAscii ().
	--	*/
	--	if (!OS.IsWinCE) {
	--		for (int i=0; i<ACCENTS.length; i++) {
	--			int value = OS.VkKeyScan (ACCENTS [i]);
	--			if ((value & 0xFF) == wParam && (value & 0x600) == 0x600) {
	--				display.lastKey = display.lastAscii = 0;
	--				display.lastVirtual = display.lastNull = false;
	--				return null;
	--			}
	--		}
	--	}
	--		
	--	display.lastVirtual = (mapKey == 0);
	--	if (display.lastVirtual) {
	--		display.lastKey = wParam;
	--	} else {
	--		if (display.lastKey == 0) {
	--			display.lastAscii = 0;
	--			display.lastNull = false;
	--			return null;
	--		}
	--		display.lastVirtual = display.isVirtualKey (display.lastKey);
	--	}
	--	
	--	LRESULT result = null;
	--	if (!sendKeyEvent (SWT.KeyUp, OS.WM_KEYUP, wParam, lParam)) {
	--		result = LRESULT.ZERO;
	--	}
	--	display.lastKey = display.lastAscii = 0;
	--	display.lastVirtual = display.lastNull = false;
	--	return result;
		end

	do_WM_KILLFOCUS (wParam, lParam : INTEGER) : LRESULT is
		do
	--	int code = callWindowProc (OS.WM_KILLFOCUS, wParam, lParam);
	--	Display display = getDisplay ();
	--	Shell shell = getShell ();
	--	
	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in the focus
	--	* out event.  If this happens keep going to send
	--	* the deactivate events.
	--	*/
	--	sendEvent (SWT.FocusOut);
	--	// widget could be disposed at this point
	--	
	--	/*
	--	* It is possible that the shell may be
	--	* disposed at this point.  If this happens
	--	* don't send the activate and deactivate
	--	* events.
	--	*/	
	--	if (!shell.isDisposed ()) {
	--		Control control = display.findControl (wParam);
	--		if (control == null || shell != control.getShell ()) {
	--			shell.setActiveControl (null);
	--		}
	--	}
	--	
	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in the focus
	--	* or deactivate events.  If this happens, end the
	--	* processing of the Windows message by returning
	--	* zero as the result of the window proc.
	--	*/
	--	if (isDisposed ()) return LRESULT.ZERO;
	--	if (code == 0) return LRESULT.ZERO;
	--	return new LRESULT (code);
		end

	do_WM_LBUTTONDBLCLK (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Feature in Windows. Windows sends the following
	--	* messages when the user double clicks the mouse:
	--	*
	--	*	WM_LBUTTONDOWN		- mouse down
	--	*	WM_LBUTTONUP		- mouse up
	--	*	WM_LBUTTONDBLCLK	- double click
	--	*	WM_LBUTTONUP		- mouse up
	--	*
	--	* Applications that expect matching mouse down/up
	--	* pairs will not see the second mouse down.  The
	--	* fix is to send a mouse down event.
	--	*/
	--	sendMouseEvent (SWT.MouseDown, 1, OS.WM_LBUTTONDOWN, wParam, lParam);
	--	sendMouseEvent (SWT.MouseDoubleClick, 1, OS.WM_LBUTTONDBLCLK, wParam, lParam);
	--	int result = callWindowProc (OS.WM_LBUTTONDBLCLK, wParam, lParam);
	--	if (OS.GetCapture () != handle) OS.SetCapture (handle);
	--	return new LRESULT (result);
		end

	do_WM_LBUTTONDOWN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	boolean dragging = false, mouseDown = true;
	--	boolean dragDetect = hooks (SWT.DragDetect);
	--	if (dragDetect) {
	--		if (!OS.IsWinCE) {
	--			/*
	--			* Feature in Windows.  It's possible that the drag
	--			* operation will not be started while the mouse is
	--			* down, meaning that the mouse should be captured.
	--			* This can happen when the user types the ESC key
	--			* to cancel the drag.  The fix is to query the state
	--			* of the mouse and capture the mouse accordingly.
	--			*/
	--			POINT pt = new POINT ();
	--			pt.x = (short) (lParam & 0xFFFF);
	--			pt.y = (short) (lParam >> 16);
	--			OS.ClientToScreen(handle, pt);
	--			dragging = OS.DragDetect (handle, pt);
	--			mouseDown = OS.GetKeyState (OS.VK_LBUTTON) < 0;
	--		}
	--	}
	--	sendMouseEvent (SWT.MouseDown, 1, OS.WM_LBUTTONDOWN, wParam, lParam);
	--	int result = callWindowProc (OS.WM_LBUTTONDOWN, wParam, lParam);	
	--	if (OS.IsPPC) {
	--		if (menu != null && !menu.isDisposed ()) {
	--			int x = (short) (lParam & 0xFFFF);
	--			int y = (short) (lParam >> 16);
	--			SHRGINFO shrg = new SHRGINFO ();
	--			shrg.cbSize = SHRGINFO.sizeof;
	--			shrg.hwndClient = handle;
	--			shrg.ptDown_x = x;
	--			shrg.ptDown_y = y; 
	--			shrg.dwFlags = OS.SHRG_RETURNCMD;
	--			int type = OS.SHRecognizeGesture (shrg);
	--			if (type == OS.GN_CONTEXTMENU) {
	--				menu.setVisible (true);
	--			}
	--		}
	--	}
	--	if (mouseDown) {
	--		if (OS.GetCapture () != handle) OS.SetCapture (handle);
	--	}
	--	if (dragging) {
	--		postEvent (SWT.DragDetect);
	--	} else {
	--		if (dragDetect) {
	--			/*
	--			* Feature in Windows.  DragDetect() captures the mouse
	--			* and tracks its movement until the user releases the
	--			* left mouse button, presses the ESC key, or moves the
	--			* mouse outside the drag rectangle.  If the user moves
	--			* the mouse outside of the drag rectangle, DragDetect()
	--			* returns true and a drag and drop operation can be
	--			* started.  When the left mouse button is released or
	--			* the ESC key is pressed, these events are consumed by
	--			* DragDetect() so that application code that matches
	--			* mouse down/up pairs or looks for the ESC key will not
	--			* function properly.  The fix is to send these events
	--			* when the drag has not started.
	--			* 
	--			* NOTE: For now, don't send a fake WM_KEYDOWN/WM_KEYUP
	--			* events for the ESC key.  This would require computing
	--			* wParam (the key) and lParam (the repeat count, scan code,
	--			* extended-key flag, context code, previous key-state flag,
	--			* and transition-state flag) which is non-trivial.
	--			*/
	--			if (OS.GetKeyState (OS.VK_ESCAPE) >= 0) {
	--				OS.SendMessage (handle, OS.WM_LBUTTONUP, wParam, lParam);
	--			}
	--		}
	--	}
	--	return new LRESULT (result);
		end

	do_WM_LBUTTONUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseUp, 1, OS.WM_LBUTTONUP, wParam, lParam);
	--	int result = callWindowProc (OS.WM_LBUTTONUP, wParam, lParam);
	--	if ((wParam & (OS.MK_LBUTTON | OS.MK_MBUTTON | OS.MK_RBUTTON)) == 0) {
	--		if (OS.GetCapture () == handle) OS.ReleaseCapture ();
	--	}
	--	return new LRESULT (result);
		end

	do_WM_MBUTTONDBLCLK (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Feature in Windows. Windows sends the following
	--	* messages when the user double clicks the mouse:
	--	*
	--	*	WM_MBUTTONDOWN		- mouse down
	--	*	WM_MBUTTONUP		- mouse up
	--	*	WM_MLBUTTONDBLCLK	- double click
	--	*	WM_MBUTTONUP		- mouse up
	--	*
	--	* Applications that expect matching mouse down/up
	--	* pairs will not see the second mouse down.  The
	--	* fix is to send a mouse down event.
	--	*/
	--	sendMouseEvent (SWT.MouseDown, 2, OS.WM_MBUTTONDOWN, wParam, lParam);
	--	sendMouseEvent (SWT.MouseDoubleClick, 2, OS.WM_MBUTTONDBLCLK, wParam, lParam);
	--	int result = callWindowProc (OS.WM_MBUTTONDBLCLK, wParam, lParam);
	--	if (OS.GetCapture () != handle) OS.SetCapture (handle);
	--	return new LRESULT (result);
		end

	do_WM_MBUTTONDOWN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseDown, 2, OS.WM_MBUTTONDOWN, wParam, lParam);
	--	int result = callWindowProc (OS.WM_MBUTTONDOWN, wParam, lParam);
	--	if (OS.GetCapture () != handle) OS.SetCapture(handle);
	--	return new LRESULT (result);
		end

	do_WM_MBUTTONUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseUp, 2, OS.WM_MBUTTONUP, wParam, lParam);
	--	int result = callWindowProc (OS.WM_MBUTTONUP, wParam, lParam);
	--	if ((wParam & (OS.MK_LBUTTON | OS.MK_MBUTTON | OS.MK_RBUTTON)) == 0) {
	--		if (OS.GetCapture () == handle) OS.ReleaseCapture ();
	--	}
	--	return new LRESULT (result);
		end

	do_WM_MEASUREITEM (wParam, lParam : INTEGER) : LRESULT is
		do
	--	MEASUREITEMSTRUCT struct = new MEASUREITEMSTRUCT ();
	--	OS.MoveMemory (struct, lParam, MEASUREITEMSTRUCT.sizeof);
	--	if (struct.CtlType == OS.ODT_MENU) {
	--		Decorations shell = menuShell ();
	--		MenuItem item = shell.findMenuItem (struct.itemID);
	--		if (item == null) return null;
	--		return item.wmMeasureChild (wParam, lParam);
	--	}
	--	int hwnd = OS.GetDlgItem (handle, struct.CtlID);
	--	Control control = WidgetTable.get (hwnd);
	--	if (control == null) return null;
	--	return control.wmMeasureChild (wParam, lParam);
		end

	do_WM_MENUCHAR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Feature in Windows.  When the user types Alt+<key>
	--	* and <key> does not match a mnemonic in the System
	--	* menu or the menu bar, Windows beeps.  This beep is
	--	* unexpected and unwanted by applications that look
	--	* for Alt+<key>.  The fix is to detect the case and
	--	* stop Windows from beeping by closing the menu.
	--	*/
	--	int type = wParam >> 16;
	--	if (type == 0 || type == OS.MF_SYSMENU) {	
	--		Display display = getDisplay ();
	--		display.mnemonicKeyHit = false;
	--		return new LRESULT (OS.MNC_CLOSE << 16);
	--	}
	--	return null;
		end

	do_WM_MENUSELECT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	int code = wParam >> 16;
	--	Shell shell = getShell ();
	--	if (code == -1 && lParam == 0) {
	--		Display display = getDisplay ();
	--		Menu menu = shell.activeMenu;
	--		while (menu != null) {
	--			/*
	--			* It is possible (but unlikely), that application
	--			* code could have disposed the widget in the hide
	--			* event.  If this happens, stop searching up the
	--			* parent list because there is no longer a link
	--			* to follow.
	--			*/
	--			menu.sendEvent (SWT.Hide);
	--			if (menu.isDisposed ()) break;
	--			menu = menu.getParentMenu ();
	--		}
	--		/*
	--		* The shell may be disposed because of sending the hide
	--		* event to the last active menu menu but setting a field
	--		* to null in a destroyed widget is not harmful.
	--		*/
	--		shell.activeMenu = null;
	--		return null;
	--	}
	--	if ((code & OS.MF_SYSMENU) != 0) return null;
	--	if ((code & OS.MF_HILITE) != 0) {
	--		MenuItem item = null;
	--		Decorations menuShell = menuShell ();
	--		if ((code & OS.MF_POPUP) != 0) {
	--			int index = wParam & 0xFFFF;
	--			MENUITEMINFO info = new MENUITEMINFO ();
	--			info.cbSize = MENUITEMINFO.sizeof;
	--			info.fMask = OS.MIIM_SUBMENU;
	--			if (OS.GetMenuItemInfo (lParam, index, true, info)) {
	--				Menu newMenu = menuShell.findMenu (info.hSubMenu);
	--				if (newMenu != null) item = newMenu.cascade;
	--			}	
	--		} else {
	--			Menu newMenu = menuShell.findMenu (lParam);
	--			if (newMenu != null) {
	--				int id = wParam & 0xFFFF;
	--				item = menuShell.findMenuItem (id);
	--			}
	--			Menu oldMenu = shell.activeMenu;
	--			if (oldMenu != null) {
	--				Menu ancestor = oldMenu;
	--				while (ancestor != null && ancestor != newMenu) {
	--					ancestor = ancestor.getParentMenu ();
	--				}
	--				if (ancestor == newMenu) {
	--					ancestor = oldMenu;
	--					while (ancestor != newMenu) {
	--						/*
	--						* It is possible (but unlikely), that application
	--						* code could have disposed the widget in the hide
	--						* event or the item about to be armed.  If this
	--						* happens, stop searching up the ancestor list
	--						* because there is no longer a link to follow.
	--						*/
	--						ancestor.sendEvent (SWT.Hide);
	--						if (ancestor.isDisposed ()) break;
	--						ancestor = ancestor.getParentMenu ();
	--					}
	--					/*
	--					* The shell and/or the item could be disposed when
	--					* processing hide events from above.  If this happens,
	--					* ensure that the shell is not accessed and that no
	--					* arm event is sent to the item.
	--					*/
	--					if (!shell.isDisposed ()) {
	--						if (newMenu != null && newMenu.isDisposed ()) {
	--							newMenu = null;
	--						}
	--						shell.activeMenu = newMenu;
	--					}
	--					if (item != null && item.isDisposed ()) item = null;
	--				}
	--			}
	--		}
	--		if (item != null) item.sendEvent (SWT.Arm);
	--	}
	--	return null;
		end

	do_WM_MOUSEACTIVATE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_MOUSEHOVER (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseHover, 0, OS.WM_MOUSEHOVER, wParam, lParam);
	--	return null;
		end

	do_WM_MOUSELEAVE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	int pos = OS.GetMessagePos ();
	--	POINT pt = new POINT ();
	--	pt.x = (short) (pos & 0xFFFF);
	--	pt.y = (short) (pos >> 16); 
	--	OS.ScreenToClient (handle, pt);
	--	lParam = pt.x | (pt.y << 16);
	--	sendMouseEvent (SWT.MouseExit, 0, OS.WM_MOUSELEAVE, wParam, lParam);
	--	return null;
		end

	do_WM_MOUSEMOVE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (!OS.IsWinCE) {
	--		Display display = getDisplay ();
	--		boolean mouseEnter = hooks (SWT.MouseEnter) || display.filters (SWT.MouseEnter);
	--		boolean mouseExit = hooks (SWT.MouseExit) || display.filters (SWT.MouseExit);
	--		boolean mouseHover = hooks (SWT.MouseHover) || display.filters (SWT.MouseHover);
	--		if (mouseEnter || mouseExit || mouseHover) {
	--			TRACKMOUSEEVENT lpEventTrack = new TRACKMOUSEEVENT ();
	--			lpEventTrack.cbSize = TRACKMOUSEEVENT.sizeof;
	--			lpEventTrack.dwFlags = OS.TME_QUERY;
	--			lpEventTrack.hwndTrack = handle;
	--			OS.TrackMouseEvent (lpEventTrack);
	--			if (lpEventTrack.dwFlags == 0) {
	--				lpEventTrack.dwFlags = OS.TME_LEAVE | OS.TME_HOVER;
	--				lpEventTrack.hwndTrack = handle;
	--				OS.TrackMouseEvent (lpEventTrack);
	--				if (mouseEnter) {
	--					sendMouseEvent (SWT.MouseEnter, 0, OS.WM_MOUSEMOVE, wParam, lParam);
	--				}
	--			} else {
	--				lpEventTrack.dwFlags = OS.TME_HOVER;
	--				OS.TrackMouseEvent (lpEventTrack);
	--			}
	--		}
	--	}
	--	Display display = getDisplay ();
	--	int pos = OS.GetMessagePos ();
	--	if (pos != display.lastMouse) {
	--		display.lastMouse = pos;
	--		sendMouseEvent (SWT.MouseMove, 0, OS.WM_MOUSEMOVE, wParam, lParam);
	--	}
	--	return null;
		end

	do_WM_MOUSEWHEEL (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_MOVE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendEvent (SWT.Move);
	--	// widget could be disposed at this point
	--	return null;
		end

	do_WM_NCACTIVATE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_NCCALCSIZE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_NCHITTEST (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (!OS.IsWindowEnabled (handle)) return null;
	--	if (!isActive ()) return new LRESULT (OS.HTTRANSPARENT);
	--	return null;
		end

	do_WM_NOTIFY (wParam, lParam : INTEGER) : LRESULT is
		do
	--	NMHDR hdr = new NMHDR ();
	--	OS.MoveMemory (hdr, lParam, NMHDR.sizeof);
	--	int hwnd = hdr.hwndFrom;
	--	if (hwnd == 0) return null;
	--	Control control = WidgetTable.get (hwnd);
	--	if (control == null) return null;
	--	return control.wmNotifyChild (wParam, lParam);
		end

	do_WM_PAINT (wParam, lParam : INTEGER) : LRESULT is
		do

	--	/* Exit early - don't draw the background */
	--	if (!hooks (SWT.Paint) && !filters (SWT.Paint)) {
	--		return null;
	--	}

	--	/* Get the damage */
	--	int result = 0;
	--	if (OS.IsWinCE) {
	--		RECT rect = new RECT ();
	--		OS.GetUpdateRect (handle, rect, false);
	--		result = callWindowProc (OS.WM_PAINT, wParam, lParam);
	--		OS.InvalidateRect (handle, rect, false);
	--	} else {
	--		int rgn = OS.CreateRectRgn (0, 0, 0, 0);
	--		OS.GetUpdateRgn (handle, rgn, false);
	--		result = callWindowProc (OS.WM_PAINT, wParam, lParam);
	--		OS.InvalidateRgn (handle, rgn, false);
	--		OS.DeleteObject (rgn);
	--	}

	--	/* Create the paint GC */
	--	PAINTSTRUCT ps = new PAINTSTRUCT ();
	--	GCData data = new GCData ();
	--	data.ps = ps;
	--	GC gc = GC.win32_new (this, data);
	--	
	--	/* Send the paint event */
	--	Event event = new Event ();
	--	event.gc = gc;
	--	event.x = ps.left;
	--	event.y = ps.top;
	--	event.width = ps.right - ps.left;
	--	event.height = ps.bottom - ps.top;
	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in the paint
	--	* event.  If this happens, attempt to give back the
	--	* paint GC anyways because this is a scarce Windows
	--	* resource.
	--	*/
	--	sendEvent (SWT.Paint, event);
	--	// widget could be disposed at this point	

	--	/* Dispose the paint GC	*/
	--	event.gc = null;
	--	gc.dispose ();
	--	
	--	if (result == 0) return LRESULT.ZERO;
	--	return new LRESULT (result);
		end

	do_WM_PALETTECHANGED (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_PARENTNOTIFY (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_PASTE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_PRINTCLIENT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_QUERYENDSESSION (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_QUERYNEWPALETTE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_QUERYOPEN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_RBUTTONDBLCLK (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Feature in Windows. Windows sends the following
	--	* messages when the user double clicks the mouse:
	--	*
	--	*	WM_RBUTTONDOWN		- mouse down
	--	*	WM_RBUTTONUP		- mouse up
	--	*	WM_RBUTTONDBLCLK	- double click
	--	*	WM_LBUTTONUP		- mouse up
	--	*
	--	* Applications that expect matching mouse down/up
	--	* pairs will not see the second mouse down.  The
	--	* fix is to send a mouse down event.
	--	*/
	--	sendMouseEvent (SWT.MouseDown, 3, OS.WM_RBUTTONDOWN, wParam, lParam);
	--	sendMouseEvent (SWT.MouseDoubleClick, 3, OS.WM_RBUTTONDBLCLK, wParam, lParam);
	--	int result = callWindowProc (OS.WM_RBUTTONDBLCLK, wParam, lParam);
	--	if (OS.GetCapture () != handle) OS.SetCapture (handle);
	--	return new LRESULT (result);
		end

	do_WM_RBUTTONDOWN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseDown, 3, OS.WM_RBUTTONDOWN, wParam, lParam);
	--	int result = callWindowProc (OS.WM_RBUTTONDOWN, wParam, lParam);
	--	if (OS.GetCapture () != handle) OS.SetCapture (handle);
	--	return new LRESULT (result);
		end

	do_WM_RBUTTONUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendMouseEvent (SWT.MouseUp, 3, OS.WM_RBUTTONUP, wParam, lParam);
	--	int result = callWindowProc (OS.WM_RBUTTONUP, wParam, lParam);
	--	if ((wParam & (OS.MK_LBUTTON | OS.MK_MBUTTON | OS.MK_RBUTTON)) == 0) {
	--		if (OS.GetCapture () == handle) OS.ReleaseCapture ();
	--	}
	--	return new LRESULT (result);
		end

	do_WM_SETCURSOR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	int hitTest = lParam & 0xFFFF;
	-- 	if (hitTest == OS.HTCLIENT) {
	--		Control control = WidgetTable.get (wParam);
	--		if (control == null) return null;
	--		int hCursor = control.findCursor ();
	--		if (hCursor != 0) {
	--			OS.SetCursor (hCursor);
	--			return LRESULT.ONE;
	--		}
	--	}
	--	return null;
		end

	do_WM_SETFOCUS (wParam, lParam : INTEGER) : LRESULT is
		do
	--	int code = callWindowProc (OS.WM_SETFOCUS, wParam, lParam);
	--	Shell shell = getShell ();
	--	
	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in the focus
	--	* in event.  If this happens keep going to send
	--	* the activate events.
	--	*/
	--	sendEvent (SWT.FocusIn);
	--	// widget could be disposed at this point
	--	
	--	/*
	--	* It is possible that the shell may be
	--	* disposed at this point.  If this happens
	--	* don't send the activate and deactivate
	--	* events.
	--	*/	
	--	if (!shell.isDisposed ()) {
	--		shell.setActiveControl (this);
	--	}

	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in the focus
	--	* or activate events.  If this happens, end the
	--	* processing of the Windows message by returning
	--	* zero as the result of the window proc.
	--	*/
	--	if (isDisposed ()) return LRESULT.ZERO;
	--	if (code == 0) return LRESULT.ZERO;
	--	return new LRESULT (code);
		end

	do_WM_SETTINGCHANGE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_SETFONT (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_SETREDRAW (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_SHOWWINDOW (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_SIZE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	sendEvent (SWT.Resize);
	--	// widget could be disposed at this point
	--	return null;
		end

	do_WM_SYSCHAR (wParam, lParam : INTEGER) : LRESULT is
		do
	--	Display display = getDisplay ();

	--	/* Set last key and last ascii because a new key has been typed */
	--	display.lastAscii = display.lastKey = wParam;
	--	display.lastVirtual = display.isVirtualKey (wParam);
	--	display.lastNull = false;

	--	/* Do not issue a key down if a menu bar mnemonic was invoked */
	--	if (!hooks (SWT.KeyDown) && !display.filters (SWT.KeyDown)) {
	--		return null;
	--	}
	--	display.mnemonicKeyHit = true;
	--	int result = callWindowProc (OS.WM_SYSCHAR, wParam, lParam);
	--	if (!display.mnemonicKeyHit) {
	--		sendKeyEvent (SWT.KeyDown, OS.WM_SYSCHAR, wParam, lParam);
	--	}
	--	display.mnemonicKeyHit = false;
	--	return new LRESULT (result);
		end

	do_WM_SYSCOLORCHANGE (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_SYSCOMMAND (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Check to see if the command is a system command or
	--	* a user menu item that was added to the System menu.
	--	* When a user item is added to the System menu,
	--	* WM_SYSCOMMAND must always return zero.
	--	*/
	--	if ((wParam & 0xF000) == 0) {
	--		Decorations shell = menuShell ();
	--		if (shell.isEnabled ()) {
	--			MenuItem item = shell.findMenuItem (wParam & 0xFFFF);
	--			if (item != null) item.wmCommandChild (wParam, lParam);
	--		}
	--		return LRESULT.ZERO;
	--	}

	--	/* Process the System Command */
	--	int cmd = wParam & 0xFFF0;
	--	switch (cmd) {
	--		case OS.SC_CLOSE:
	--			int hwndShell = menuShell ().handle;
	--			int bits = OS.GetWindowLong (hwndShell, OS.GWL_STYLE);
	--			if ((bits & OS.WS_SYSMENU) == 0) return LRESULT.ZERO;
	--			break;
	--		case OS.SC_KEYMENU:
	--			if (hooks (SWT.KeyDown) || hooks (SWT.KeyUp)) {
	--				Decorations shell = menuShell ();
	--				Menu menu = shell.getMenuBar ();
	--				if (menu != null) {
	--					char key = mbcsToWcs (lParam);
	--					if (key != 0) {
	--						key = Character.toUpperCase (key);
	--						MenuItem [] items = menu.getItems ();
	--						for (int i=0; i<items.length; i++) {
	--							MenuItem item = items [i];
	--							String text = item.getText ();
	--							char mnemonic = findMnemonic (text);
	--							if (text.length () > 0 && mnemonic == 0) {
	--								char ch = text.charAt (0);
	--								if (Character.toUpperCase (ch) == key) {
	--									Display display = getDisplay ();
	--									display.mnemonicKeyHit = false;
	--									return LRESULT.ZERO;
	--								}
	--							}
	--						}
	--					}
	--				}
	--			}
	--			// FALL THROUGH
	--		case OS.SC_HSCROLL:
	--		case OS.SC_VSCROLL:
	--			/*
	--			* Do not allow keyboard traversal of the menu bar
	--			* or scrolling when the shell is not enabled.
	--			*/
	--			Decorations shell = menuShell ();
	--			if (!shell.isEnabled () || !shell.isActive ()) {
	--				return LRESULT.ZERO;
	--			}
	--			break;
	--		case OS.SC_MINIMIZE:
	--			/* Save the focus widget when the shell is minimized */
	--			menuShell ().saveFocus ();
	--			break;
	--	}
	--	return null;
		end

	do_WM_SYSKEYDOWN (wParam, lParam : INTEGER) : LRESULT is
		do
	--	/*
	--	* Feature in Windows.  WM_SYSKEYDOWN is sent when
	--	* the user presses ALT-<aKey> or F10 without the ALT key.
	--	* In order to issue events for F10 (without the ALT key)
	--	* but ignore all other key presses without the ALT key,
	--	* make F10 a special case.
	--	*/
	--	if (wParam != OS.VK_F10) {
	--		/* Make sure WM_SYSKEYDOWN was sent by ALT-<aKey>. */
	--		if ((lParam & 0x20000000) == 0) return null;
	--	}
	--	
	--	/* Ignore repeating modifier keys by testing key down state */
	--	switch (wParam) {
	--		case OS.VK_SHIFT:
	--		case OS.VK_MENU:
	--		case OS.VK_CONTROL:
	--		case OS.VK_CAPITAL:
	--		case OS.VK_NUMLOCK:
	--		case OS.VK_SCROLL:
	--			if ((lParam & 0x40000000) != 0) return null;
	--	}
	--	
	--	/* Clear last key and last ascii because a new key has been typed */
	--	Display display = getDisplay ();
	--	display.lastAscii = display.lastKey = 0;
	--	display.lastVirtual = display.lastNull = false;

	--	/* If are going to get a WM_SYSCHAR, ignore this message. */
	--	/*
	--	* Bug on WinCE.  MapVirtualKey() returns incorrect values.
	--	* The fix is to rely on a key mappings table to determine
	--	* whether the key event must be sent now or if a WM_SYSCHAR
	--	* event will follow.
	--	*/
	--	if (!OS.IsWinCE) {
	--		if (OS.MapVirtualKey (wParam, 2) != 0) {
	--			/*
	--			* Feature in Windows.  MapVirtualKey() indicates that
	--			* a WM_SYSCHAR message will occur for Alt+Enter but
	--			* this message never happens.  The fix is to issue the
	--			* event from WM_SYSKEYDOWN and map VK_RETURN to '\r'.
	--			*/
	--			if (wParam != OS.VK_RETURN) return null;
	--			display.lastAscii = '\r';
	--		}
	--	}
	--	display.lastKey = wParam;
	--	display.lastVirtual = true;
	--		
	--	/*
	--	* Feature in Windows.  The virtual key VK_DELETE is not
	--	* treated as both a virtual key and an ASCII key by Windows.
	--	* Therefore, we will not receive a WM_CHAR for this key.
	--	* The fix is to treat VK_DELETE as a special case and map
	--	* the ASCII value explictly (Delete is 0x7F).
	--	*/
	--	if (display.lastKey == OS.VK_DELETE) display.lastAscii = 0x7F;
	--	
	--	/*
	--	* It is possible to get a WM_CHAR for a virtual key when
	--	* Num Lock is on.  If the user types Home while Num Lock 
	--	* is down, a WM_CHAR is issued with WPARM=55 (for the
	--	* character 7).  If we are going to get a WM_CHAR we need
	--	* to ensure that the last key has the correct value.  Note
	--	* that Ctrl+Home does not issue a WM_CHAR when Num Lock is
	--	* down.
	--	*/
	--	if (OS.VK_NUMPAD0 <= display.lastKey && display.lastKey <= OS.VK_DIVIDE) {
	--		if (display.asciiKey (display.lastKey) != 0) return null;
	--	}
	--	
	--	if (!sendKeyEvent (SWT.KeyDown, OS.WM_SYSKEYDOWN, wParam, lParam)) {
	--		return LRESULT.ZERO;
	--	}
	--	return null;
		end

	do_WM_SYSKEYUP (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return WM_KEYUP (wParam, lParam);
		end

	do_WM_TIMER (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_UNDO (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_VSCROLL (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (lParam == 0) return null;
	--	Control control = WidgetTable.get (lParam);
	--	if (control == null) return null;
	--	return control.wmScrollChild (wParam, lParam);
		end

	do_WM_WINDOWPOSCHANGED (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_WM_WINDOWPOSCHANGING (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_wmColorChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	if (background == -1 && foreground == -1) return null;
	--	int forePixel = foreground, backPixel = background;
	--	if (forePixel == -1) forePixel = defaultForeground ();
	--	if (backPixel == -1) backPixel = defaultBackground ();
	--	OS.SetTextColor (wParam, forePixel);
	--	OS.SetBkColor (wParam, backPixel);
	--	return new LRESULT (findBrush (backPixel));
		end

	do_wmCommandChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_wmDrawChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_wmMeasureChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_wmNotifyChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end

	do_wmScrollChild (wParam, lParam : INTEGER) : LRESULT is
		do
	--	return null;
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature -- Basic operations

	translate_accelerator (msg : MSG) : BOOLEAN is
		do
			--FIXME: Result := menu_shell.translate_accelerator (msg)
		end

	translate_mnemonic_character (key : CHARACTER) : BOOLEAN is
		do
			--FIXME
		--	if (!isVisible () || !isEnabled ()) return false;
		--	Event event = new Event ();
		--	event.doit = mnemonicMatch (key);
		--	event.detail = SWT.TRAVERSE_MNEMONIC;
		--	Display display = getDisplay ();
		--	display.lastKey = 0;
		--	display.lastAscii = key;
		--	display.lastVirtual = display.lastNull = false;
		--	if (!setKeyState (event, SWT.Traverse)) {
		--		return false;
		--	}
		--	return traverse (event);
		end
		
	translate_mnemonic (msg : MSG) : BOOLEAN is
		do
			--FIXME:
	--	int hwnd = msg.hwnd;
	--	if (OS.GetKeyState (OS.VK_MENU) >= 0) {
	--		int code = OS.SendMessage (hwnd, OS.WM_GETDLGCODE, 0, 0);
	--		if ((code & OS.DLGC_WANTALLKEYS) != 0) return false;
	--		if ((code & OS.DLGC_BUTTON) == 0) return false;
	--	}
	--	Decorations shell = menuShell ();
	--	if (shell.isVisible () && shell.isEnabled ()) {
	--		char ch = mbcsToWcs ((char) msg.wParam);
	--		return ch != 0 && shell.translateMnemonic (ch);
	--	}
	--	return false;
			
		end

	translate_traversal (msg : MSG) : BOOLEAN is
		do
		--FIXME:			
	--	int key = msg.wParam;
	--	if (key == OS.VK_MENU) {
	--		Shell shell = getShell ();
	--		int hwndShell = shell.handle;
	--		OS.SendMessage (hwndShell, OS.WM_CHANGEUISTATE, OS.UIS_INITIALIZE, 0);
	--		return false;
	--	}
	--	int hwnd = msg.hwnd;
	--	int detail = SWT.TRAVERSE_NONE;
	--	boolean doit = true, all = false;
	--	boolean lastVirtual = false;
	--	int lastKey = key, lastAscii = 0;
	--	switch (key) {
	--		case OS.VK_ESCAPE: {
	--			all = true;
	--			lastAscii = 27;
	--			int code = OS.SendMessage (hwnd, OS.WM_GETDLGCODE, 0, 0);
	--			if ((code & OS.DLGC_WANTALLKEYS) != 0) {
	--				/*
	--				* Use DLGC_HASSETSEL to determine that the control
	--				* is a text widget.  A text widget normally wants
	--				* all keys except VK_ESCAPE.  If this bit is not
	--				* set, then assume the control wants all keys,
	--				* including VK_ESCAPE.
	--				*/
	--				if ((code & OS.DLGC_HASSETSEL) == 0) doit = false;
	--			}
	--			detail = SWT.TRAVERSE_ESCAPE;
	--			break;
	--		}
	--		case OS.VK_RETURN: {
	--			all = true;
	--			lastAscii = '\r';
	--			int code = OS.SendMessage (hwnd, OS.WM_GETDLGCODE, 0, 0);
	--			if ((code & OS.DLGC_WANTALLKEYS) != 0) doit = false;
	--			detail = SWT.TRAVERSE_RETURN;
	--			break;
	--		}
	--		case OS.VK_TAB: {
	--			/*
	--			* NOTE: This code causes Shift+Tab and Ctrl+Tab to
	--			* always attempt traversal which is not correct.
	--			* The default should be the same as a plain Tab key.
	--			* This behavior is currently relied on by StyledText.
	--			*
	--			* The correct behavior is to give every key to a
	--			* control that answers DLGC_WANTALLKEYS.
	--			*/
	--			lastAscii = '\t';
	--			boolean next = OS.GetKeyState (OS.VK_SHIFT) >= 0;
	--			int code = OS.SendMessage (hwnd, OS.WM_GETDLGCODE, 0, 0);
	--			if ((code & (OS.DLGC_WANTTAB | OS.DLGC_WANTALLKEYS)) != 0) {
	--				if (next && OS.GetKeyState (OS.VK_CONTROL) >= 0) doit = false;
	--			}
	--			if (parent != null && (parent.style & SWT.MIRRORED) != 0) {
	--				if (key == OS.VK_LEFT || key == OS.VK_RIGHT) next = !next;
	--			}
	--			detail = next ? SWT.TRAVERSE_TAB_NEXT : SWT.TRAVERSE_TAB_PREVIOUS;
	--			break;
	--		}
	--		case OS.VK_UP:
	--		case OS.VK_LEFT:
	--		case OS.VK_DOWN:
	--		case OS.VK_RIGHT: {
	--			/*
	--			* On WinCE SP there is no tab key.  Focus is assigned
	--			* using only the VK_UP and VK_DOWN keys, not with VK_LEFT
	--			* or VK_RIGHT.
	--			*/
	--			if (OS.IsSP) {
	--				if (key == OS.VK_LEFT || key == OS.VK_RIGHT) return false;
	--			}
	--			lastVirtual = true;
	--			int code = OS.SendMessage (hwnd, OS.WM_GETDLGCODE, 0, 0);
	--			if ((code & (OS.DLGC_WANTARROWS /*| OS.DLGC_WANTALLKEYS*/)) != 0) doit = false;
	--			boolean next = key == OS.VK_DOWN || key == OS.VK_RIGHT;
	--			detail = next ? SWT.TRAVERSE_ARROW_NEXT : SWT.TRAVERSE_ARROW_PREVIOUS;
	--			break;
	--		}
	--		case OS.VK_PRIOR:
	--		case OS.VK_NEXT: {
	--			all = true;
	--			lastVirtual = true;
	--			if (OS.GetKeyState (OS.VK_CONTROL) >= 0) return false;
	--			/*
	--			* The fact that this code is commented causes Ctrl+PgUp
	--			* and Ctrl+PgDn to always attempt traversal which is not
	--			* correct.  This behavior is relied on by StyledText.
	--			* 
	--			* The correct behavior is to give every key to a control
	--			* that answers DLGC_WANTALLKEYS.
	--			*/
	--//			int code = OS.SendMessage (hwnd, OS., 0, 0);
	--//			if ((code & OS.DLGC_WANTALLKEYS) != 0) doit = false;
	--			detail = key == OS.VK_PRIOR ? SWT.TRAVERSE_PAGE_PREVIOUS : SWT.TRAVERSE_PAGE_NEXT;
	--			break;
	--		}
	--		default:
	--			return false;
	--	}
	--	Event event = new Event ();
	--	event.doit = doit;
	--	event.detail = detail;
	--	Display display = getDisplay ();
	--	display.lastKey = lastKey;
	--	display.lastAscii = lastAscii;
	--	display.lastVirtual = lastVirtual;
	--	display.lastNull = false;
	--	if (!setKeyState (event, SWT.Traverse)) {
	--		return false;
	--	}
	--	Shell shell = getShell ();
	--	Control control = this;
	--	do {
	--		if (control.traverse (event)) {
	--			int hwndShell = shell.handle;
	--			OS.SendMessage (hwndShell, OS.WM_CHANGEUISTATE, OS.UIS_INITIALIZE, 0);
	--			return true;
	--		}
	--		if (!event.doit && control.hooks (SWT.Traverse)) {
	--			return false;
	--		}
	--		if (control == shell) return false;
	--		control = control.parent;
	--	} while (all && control != null);
	--	return false;
		end
		
		
	traverse_group (next : BOOLEAN) is --  : BOOLEAN is
		do
	--	Control root = computeTabRoot ();
	--	Control group = computeTabGroup ();
	--	Control [] list = root.computeTabList ();
	--	int length = list.length;
	--	int index = 0;
	--	while (index < length) {
	--		if (list [index] == group) break;
	--		index++;
	--	}
	--	/*
	--	* It is possible (but unlikely), that application
	--	* code could have disposed the widget in focus in
	--	* or out events.  Ensure that a disposed widget is
	--	* not accessed.
	--	*/
	--	if (index == length) return false;
	--	int start = index, offset = (next) ? 1 : -1;
	--	while ((index = ((index + offset + length) % length)) != start) {
	--		Control control = list [index];
	--		if (!control.isDisposed () && control.setTabGroupFocus ()) {
	--			if (!isDisposed () && !isFocusControl ()) return true;
	--		}
	--	}
	--	if (group.isDisposed ()) return false;
	--	return group.setTabGroupFocus ();
		end

feature {CONTROL} -- Basic operations

	call_window_proc (msg, wParam, lParam : INTEGER) : INTEGER is
		deferred
		end
		
feature {NONE} -- Implementation

	destroy_widget is
		local
			l_hwnd : POINTER
			res : INTEGER
		do
			l_hwnd := handle
			release_handle
			if l_hwnd /= default_pointer then
				res := os.destroy_window (l_hwnd)
			end
		end

	release_widget is
		do
			Precursor
			--	if (OS.IsDBLocale) {
			--		OS.ImmAssociateContext (handle, 0);
			--	}
			--	if (toolTipText != null) {
			--		Shell shell = getShell ();
			--		shell.setToolTipText (handle, null);
			--	}
			--	toolTipText = null;
			--	if (menu != null && !menu.isDisposed ()) {
			--		menu.dispose ();
			--	}
			--	menu = null;
			deregister
			--	unsubclass ();
			parent := Void
			--	layoutData = null;
			--	if (accessible != null) {
			--		accessible.internal_dispose_Accessible ();
			--	}
			--	accessible = null;
		end
		
	release_handle is
		do
			Precursor
			handle := default_pointer
		ensure then
			handle_zero: handle = default_pointer
		end
		
	create_handle is
		local
			l_hwnd_parent : POINTER
			l_handle_IMC : INTEGER
			l_bits : INTEGER
			xs_handle : XS_C_POINTER
			dummy : INTEGER
			res : INTEGER
		do		
			l_hwnd_parent := default_pointer
			if (handle /= default_pointer) then
				l_hwnd_parent := handle
			else
				if parent /= Void then
					l_hwnd_Parent := parent.handle
				end
			end
			handle := os.create_window_ex_a_external (
						widget_ext_style ,
						window_class.handle,
						default_pointer,
						widget_style,
						os.Cw_usedefault,
						0,
						os.Cw_usedefault,
						0,
						l_hwnd_parent,
						default_pointer,
						os.get_module_handle_a_external (default_pointer),
						default_pointer)
			if handle = default_pointer then
				error (swt.Error_no_handles)
			end
			l_bits := os.get_window_long_a (handle, os.Gwl_style)
			if UINT32_.u_and (l_bits,os.Ws_child) /= 0 then
				Create xs_handle.make
				xs_handle.put (handle)
				dummy := os.set_window_long_a (handle, os.Gwl_id, xs_handle.as_integer)
			end
			if os.is_db_locale and (parent /= Void) then
				l_handle_IMC := os.imm_get_context (l_hwnd_parent) 
				res := os.imm_associate_context (handle, l_handle_IMC)
				res := os.imm_release_context (l_hwnd_parent, l_handle_IMC)
			end
		end

	check_mirrored is
		local
			bits : INTEGER
		do
			if 0 /= UINT32_.u_and (style, Swt.Style_right_to_left) then
				bits := Os.get_window_long_a (handle, Os.Gwl_exstyle)
				if 0 /= UINT32_.u_and (bits, Os.Ws_ex_layoutrtl) then
					style := UINT32_.u_or (style, Swt.Style_mirrored)
				end
			end
		end


	create_widget is
		do
			foreground := -1
			background := -1
			check_orientation (parent)
			create_handle
			register
			subclass
			set_default_font
			check_mirrored
		end

	register is
		do
			-- FIXME
			-- WidgetTable.put (handle, this)
			Widget_table.put (Current, handle)
		end

	deregister is
		do
			Widget_table.remove (handle)
		end
		
	set_default_font is
		local
			l_display : DISPLAY
			l_handle_font : XS_C_POINTER
			dummy : INTEGER
		do
			l_display := get_display
			Create l_handle_font.make
			l_handle_font.put (l_display.system_font)
			dummy := os.send_message_a_external (handle, os.Wm_setfont, l_handle_font.as_integer, 0)
		end

	subclass is
		do
-- FIXME
--			int oldProc = windowProc ();
--			int newProc = getDisplay ().windowProc;
--			if (oldProc == newProc) return;
--			OS.SetWindowLong (handle, OS.GWL_WNDPROC, newProc);			
		end

	widget_ext_style : INTEGER is
		local
			bits : INTEGER
		do
			if UINT32_.u_and (style, Swt.Style_border) /= 0 then
				bits := UINT32_.u_or (bits, Os.Ws_ex_clientedge)
			end
--FIXME
--			* Feature in Windows NT.  When CreateWindowEx() is called with
--			* WS_EX_LAYOUTRTL or WS_EX_NOINHERITLAYOUT, CreateWindowEx()
--			* fails to create the HWND. The fix is to not use these bits.
--			*/
--			if ((OS.WIN32_MAJOR << 16 | OS.WIN32_MINOR) < (4 << 16 | 10))  {
--				return bits;
--			} 

			bits := UINT32_.u_or (bits, os.Ws_ex_noinheritlayout)
			if 0 /= UINT32_.u_and (style, swt.Style_right_to_left) then
				bits := UINT32_.u_or (bits, os.Ws_ex_layoutrtl)
			end
			Result := bits
		end

	widget_style : INTEGER is
		do
			--|	Force clipping of siblings by setting WS_CLIPSIBLINGS
			Result := UINT32_.u_or (UINT32_.u_or (os.Ws_child, os.Ws_visible), os.Ws_clipsiblings)
		end


	window_class : TCHAR is
		deferred		
		end
		
feature {NONE} -- Attributes

	parent : COMPOSITE

	foreground : INTEGER
	
	background : INTEGER

invariant
	invariant_clause: -- Your invariant here

end -- class CONTROL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
