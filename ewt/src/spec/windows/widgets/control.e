indexing
	description: "Windows implementation of ABSTRACT_CONTROL"
	date: "$Date: 2004/06/29 16:49:46 $";
	revision: "$Revision: 1.7 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	CONTROL

inherit	
	WIDGET
	
	DRAWABLE
	
	ABSTRACT_CONTROL

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
		do
			--| FIXME
			--	LRESULT result = null;
			--	switch (msg) {
			--		case OS.WM_ACTIVATE:			result = WM_ACTIVATE (wParam, lParam); break;
			--		case OS.WM_CHAR:				result = WM_CHAR (wParam, lParam); break;
			--		case OS.WM_CLEAR:				result = WM_CLEAR (wParam, lParam); break;
			--		case OS.WM_CLOSE:				result = WM_CLOSE (wParam, lParam); break;
			--		case OS.WM_COMMAND:			result = WM_COMMAND (wParam, lParam); break;
			--		case OS.WM_CONTEXTMENU:		result = WM_CONTEXTMENU (wParam, lParam); break;
			--		case OS.WM_CTLCOLORBTN:
			--		case OS.WM_CTLCOLORDLG:
			--		case OS.WM_CTLCOLOREDIT:
			--		case OS.WM_CTLCOLORLISTBOX:
			--		case OS.WM_CTLCOLORMSGBOX:
			--		case OS.WM_CTLCOLORSCROLLBAR:
			--		case OS.WM_CTLCOLORSTATIC:		result = WM_CTLCOLOR (wParam, lParam); break;
			--		case OS.WM_CUT:				result = WM_CUT (wParam, lParam); break;
			--		case OS.WM_DESTROY:			result = WM_DESTROY (wParam, lParam); break;
			--		case OS.WM_DRAWITEM:			result = WM_DRAWITEM (wParam, lParam); break;
			--		case OS.WM_ENDSESSION:			result = WM_ENDSESSION (wParam, lParam); break;
			--		case OS.WM_ERASEBKGND:			result = WM_ERASEBKGND (wParam, lParam); break;
			--		case OS.WM_GETDLGCODE:			result = WM_GETDLGCODE (wParam, lParam); break;
			--		case OS.WM_HELP:				result = WM_HELP (wParam, lParam); break;
			--		case OS.WM_HSCROLL:			result = WM_HSCROLL (wParam, lParam); break;
			--		case OS.WM_IME_CHAR:			result = WM_IME_CHAR (wParam, lParam); break;
			--		case OS.WM_IME_COMPOSITION:	result = WM_IME_COMPOSITION (wParam, lParam); break;
			--		case OS.WM_INITMENUPOPUP:		result = WM_INITMENUPOPUP (wParam, lParam); break;
			--		case OS.WM_GETFONT:			result = WM_GETFONT (wParam, lParam); break;
			--		case OS.WM_GETOBJECT:			result = WM_GETOBJECT (wParam, lParam); break;
			--		case OS.WM_HOTKEY:				result = WM_HOTKEY (wParam, lParam); break;		
			--		case OS.WM_KEYDOWN:			result = WM_KEYDOWN (wParam, lParam); break;
			--		case OS.WM_KEYUP:				result = WM_KEYUP (wParam, lParam); break;
			--		case OS.WM_KILLFOCUS:			result = WM_KILLFOCUS (wParam, lParam); break;
			--		case OS.WM_LBUTTONDBLCLK:		result = WM_LBUTTONDBLCLK (wParam, lParam); break;
			--		case OS.WM_LBUTTONDOWN:		result = WM_LBUTTONDOWN (wParam, lParam); break;
			--		case OS.WM_LBUTTONUP:			result = WM_LBUTTONUP (wParam, lParam); break;
			--		case OS.WM_MBUTTONDBLCLK:		result = WM_MBUTTONDBLCLK (wParam, lParam); break;
			--		case OS.WM_MBUTTONDOWN:		result = WM_MBUTTONDOWN (wParam, lParam); break;
			--		case OS.WM_MBUTTONUP:			result = WM_MBUTTONUP (wParam, lParam); break;
			--		case OS.WM_MEASUREITEM:		result = WM_MEASUREITEM (wParam, lParam); break;
			--		case OS.WM_MENUCHAR:			result = WM_MENUCHAR (wParam, lParam); break;
			--		case OS.WM_MENUSELECT:			result = WM_MENUSELECT (wParam, lParam); break;
			--		case OS.WM_MOUSEACTIVATE:		result = WM_MOUSEACTIVATE (wParam, lParam); break;
			--		case OS.WM_MOUSEHOVER:			result = WM_MOUSEHOVER (wParam, lParam); break;
			--		case OS.WM_MOUSELEAVE:			result = WM_MOUSELEAVE (wParam, lParam); break;
			--		case OS.WM_MOUSEMOVE:			result = WM_MOUSEMOVE (wParam, lParam); break;
			--		case OS.WM_MOUSEWHEEL:			result = WM_MOUSEWHEEL (wParam, lParam); break;
			--		case OS.WM_MOVE:				result = WM_MOVE (wParam, lParam); break;
			--		case OS.WM_NCACTIVATE:			result = WM_NCACTIVATE (wParam, lParam); break;
			--		case OS.WM_NCCALCSIZE:			result = WM_NCCALCSIZE (wParam, lParam); break;
			--		case OS.WM_NCHITTEST:			result = WM_NCHITTEST (wParam, lParam); break;
			--		case OS.WM_NOTIFY:				result = WM_NOTIFY (wParam, lParam); break;
			--		case OS.WM_PAINT:				result = WM_PAINT (wParam, lParam); break;
			--		case OS.WM_PALETTECHANGED:		result = WM_PALETTECHANGED (wParam, lParam); break;
			--		case OS.WM_PARENTNOTIFY:		result = WM_PARENTNOTIFY (wParam, lParam); break;
			--		case OS.WM_PASTE:				result = WM_PASTE (wParam, lParam); break;
			--		case OS.WM_PRINTCLIENT:		result = WM_PRINTCLIENT (wParam, lParam); break;
			--		case OS.WM_QUERYENDSESSION:	result = WM_QUERYENDSESSION (wParam, lParam); break;
			--		case OS.WM_QUERYNEWPALETTE:	result = WM_QUERYNEWPALETTE (wParam, lParam); break;
			--		case OS.WM_QUERYOPEN:			result = WM_QUERYOPEN (wParam, lParam); break;
			--		case OS.WM_RBUTTONDBLCLK:		result = WM_RBUTTONDBLCLK (wParam, lParam); break;
			--		case OS.WM_RBUTTONDOWN:		result = WM_RBUTTONDOWN (wParam, lParam); break;
			--		case OS.WM_RBUTTONUP:			result = WM_RBUTTONUP (wParam, lParam); break;
			--		case OS.WM_SETCURSOR:			result = WM_SETCURSOR (wParam, lParam); break;
			--		case OS.WM_SETFOCUS:			result = WM_SETFOCUS (wParam, lParam); break;
			--		case OS.WM_SETFONT:			result = WM_SETFONT (wParam, lParam); break;
			--		case OS.WM_SETTINGCHANGE:		result = WM_SETTINGCHANGE (wParam, lParam); break;
			--		case OS.WM_SETREDRAW:			result = WM_SETREDRAW (wParam, lParam); break;
			--		case OS.WM_SHOWWINDOW:			result = WM_SHOWWINDOW (wParam, lParam); break;
			--		case OS.WM_SIZE:				result = WM_SIZE (wParam, lParam); break;
			--		case OS.WM_SYSCHAR:			result = WM_SYSCHAR (wParam, lParam); break;
			--		case OS.WM_SYSCOLORCHANGE:		result = WM_SYSCOLORCHANGE (wParam, lParam); break;
			--		case OS.WM_SYSCOMMAND:			result = WM_SYSCOMMAND (wParam, lParam); break;
			--		case OS.WM_SYSKEYDOWN:			result = WM_SYSKEYDOWN (wParam, lParam); break;
			--		case OS.WM_SYSKEYUP:			result = WM_SYSKEYUP (wParam, lParam); break;
			--		case OS.WM_TIMER:				result = WM_TIMER (wParam, lParam); break;
			--		case OS.WM_UNDO:				result = WM_UNDO (wParam, lParam); break;
			--		case OS.WM_VSCROLL:			result = WM_VSCROLL (wParam, lParam); break;
			--		case OS.WM_WINDOWPOSCHANGED:	result = WM_WINDOWPOSCHANGED (wParam, lParam); break;
			--		case OS.WM_WINDOWPOSCHANGING:	result = WM_WINDOWPOSCHANGING (wParam, lParam); break;
			--	}
			--	if (result != null) return result.value;
			--	return callWindowProc (msg, wParam, lParam);
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

feature {NONE} -- Implementation

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
			l_bits := os.get_window_long_a_external (handle, os.Gwl_style)
			if UINT32_.u_and (l_bits,os.Ws_child) /= 0 then
				Create xs_handle.make
				xs_handle.put (handle)
				dummy := os.set_window_long_a_external (handle, os.Gwl_id, xs_handle.as_integer)
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
