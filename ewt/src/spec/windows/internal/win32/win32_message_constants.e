indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 19:57:56 $"
	revision: "$Revision: 1.1 $"

class
	WIN32_MESSAGE_CONSTANTS

feature -- Access

	WM_ACTIVATE : INTEGER is 6 
	WM_ACTIVATEAPP : INTEGER is 28 
	WM_APP : INTEGER is 32768 
	WM_CANCELMODE : INTEGER is 31 
	WM_CHANGEUISTATE : INTEGER is 295 
	WM_CHAR : INTEGER is 258 
	WM_CLEAR : INTEGER is 771 
	WM_CLOSE : INTEGER is 16 
	WM_COMMAND : INTEGER is 273 
	WM_CONTEXTMENU : INTEGER is 123 
	WM_COPY : INTEGER is 769 
	WM_CTLCOLORBTN : INTEGER is 309 
	WM_CTLCOLORDLG : INTEGER is 310 
	WM_CTLCOLOREDIT : INTEGER is 307 
	WM_CTLCOLORLISTBOX : INTEGER is 308 
	WM_CTLCOLORMSGBOX : INTEGER is 306 
	WM_CTLCOLORSCROLLBAR : INTEGER is 311 
	WM_CTLCOLORSTATIC : INTEGER is 312 
	WM_CUT : INTEGER is 768 
	WM_DESTROY : INTEGER is 2 
	WM_DRAWITEM : INTEGER is 43 
	WM_ENDSESSION : INTEGER is 22 
	WM_ERASEBKGND : INTEGER is 20 
	WM_GETDLGCODE : INTEGER is 135 
	WM_GETFONT : INTEGER is 49 
	WM_GETOBJECT : INTEGER is 61 
	WM_HELP : INTEGER is 83 
	WM_HOTKEY : INTEGER is 786 
	WM_HSCROLL : INTEGER is 276 
	WM_IME_CHAR : INTEGER is 646 
	WM_IME_COMPOSITION : INTEGER is 271 
	WM_INITDIALOG : INTEGER is 272 
	WM_INITMENUPOPUP : INTEGER is 279 
	WM_KEYDOWN : INTEGER is 256 
	WM_KEYFIRST : INTEGER is 256 
	WM_KEYLAST : INTEGER is 264 
	WM_KEYUP : INTEGER is 257 
	WM_KILLFOCUS : INTEGER is 8 
	WM_LBUTTONDBLCLK : INTEGER is 515 
	WM_LBUTTONDOWN : INTEGER is 513 
	WM_LBUTTONUP : INTEGER is 514 
	WM_MBUTTONDBLCLK : INTEGER is 521 
	WM_MBUTTONDOWN : INTEGER is 519 
	WM_MBUTTONUP : INTEGER is 520 
	WM_MEASUREITEM : INTEGER is 44 
	WM_MENUCHAR : INTEGER is 288 
	WM_MENUSELECT : INTEGER is 287 
	WM_MOUSEACTIVATE : INTEGER is 33 
	WM_MOUSEFIRST : INTEGER is 512 
	WM_MOUSEHOVER : INTEGER is 673 
	WM_MOUSELAST : INTEGER is 525 
	WM_MOUSELEAVE : INTEGER is 675 
	WM_MOUSEMOVE : INTEGER is 512 
	WM_MOUSEWHEEL : INTEGER is 522 
	WM_MOVE : INTEGER is 3 
	WM_NCACTIVATE : INTEGER is 134 
	WM_NCCALCSIZE : INTEGER is 131 
	WM_NCHITTEST : INTEGER is 132 
	WM_NOTIFY : INTEGER is 78 
	WM_NULL : INTEGER is 0 
	WM_PAINT : INTEGER is 15 
	WM_PALETTECHANGED : INTEGER is 785 
	WM_PARENTNOTIFY : INTEGER is 528
	WM_PASTE : INTEGER is 770
	WM_PRINTCLIENT : INTEGER is 792 
	WM_QUERYENDSESSION : INTEGER is 17 
	WM_QUERYNEWPALETTE : INTEGER is 783 
	WM_QUERYOPEN : INTEGER is 19 
	WM_RBUTTONDBLCLK : INTEGER is 518 
	WM_RBUTTONDOWN : INTEGER is 516 
	WM_RBUTTONUP : INTEGER is 517 
	WM_SETCURSOR : INTEGER is 32 
	WM_SETFOCUS : INTEGER is 7 
	WM_SETFONT : INTEGER is 48 
	WM_SETICON : INTEGER is 128 
	WM_SETREDRAW : INTEGER is 11 
	WM_SETTINGCHANGE : INTEGER is 26 
	WM_SHOWWINDOW : INTEGER is 24 
	WM_SIZE : INTEGER is 5 
	WM_SYSCHAR : INTEGER is 262 
	WM_SYSCOLORCHANGE : INTEGER is 21 
	WM_SYSCOMMAND : INTEGER is 274 
	WM_SYSKEYDOWN : INTEGER is 260 
	WM_SYSKEYUP : INTEGER is 261 
	WM_TIMER : INTEGER is 275 
	WM_UNDO : INTEGER is 772 
	WM_USER : INTEGER is 1024 
	WM_VSCROLL : INTEGER is 277 
	WM_WINDOWPOSCHANGING : INTEGER is 70
	WM_WINDOWPOSCHANGED : INTEGER is 71
	WS_BORDER : INTEGER is 8388608 
	WS_CAPTION : INTEGER is 12582912 
	WS_CHILD : INTEGER is 1073741824 
	WS_CLIPCHILDREN : INTEGER is 33554432 
	WS_CLIPSIBLINGS : INTEGER is 67108864 
	WS_EX_CAPTIONOKBTN : INTEGER is -2147483648 
	WS_EX_CLIENTEDGE : INTEGER is 512 
	WS_EX_DLGMODALFRAME : INTEGER is 1 
	WS_EX_LAYOUTRTL : INTEGER is 4194304 
	WS_EX_NOINHERITLAYOUT : INTEGER is 1048576 
	WS_EX_STATICEDGE : INTEGER is 131072 
	WS_EX_TOOLWINDOW : INTEGER is 128 
	WS_EX_TOPMOST : INTEGER is 8 
	WS_EX_TRANSPARENT : INTEGER is 32 
	WS_HSCROLL : INTEGER is 1048576 
	WS_MAXIMIZEBOX : INTEGER is 65536 -- 0x10000;
	WS_MINIMIZEBOX : INTEGER is 131072 -- 0x20000;
	WS_OVERLAPPED : INTEGER is 0
	WS_OVERLAPPEDWINDOW : INTEGER is 13565952 
	WS_POPUP : INTEGER is -2147483648 
	WS_SYSMENU : INTEGER is 524288 
	WS_TABSTOP : INTEGER is 65536 
	WS_THICKFRAME : INTEGER is 262144 
	WS_VISIBLE : INTEGER is 268435456 
	WS_VSCROLL : INTEGER is 2097152 

end -- class WIN32_MESSAGE_CONSTANTS