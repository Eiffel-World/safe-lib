indexing
	description: "Windows implementation of ABSTRACT_CONTROL"
	date: "$Date: 2003/12/30 10:58:04 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	CONTROL

inherit	
	WIDGET
	
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

feature {NONE} -- Implementation

feature {NONE} -- Attributes

	parent : COMPOSITE

invariant
	invariant_clause: -- Your invariant here

end -- class CONTROL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
