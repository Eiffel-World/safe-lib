indexing
	description : "OS specific constants"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.6 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"
	note: "This class has been obtained by extracting OS related constants from the corresponding Javadoc"
	
class
	OS_CONSTANTS

inherit
	WIN32_MESSAGE_CONSTANTS
	
feature -- Constants

	BF_BOTTOM : INTEGER is 8 
	BF_RIGHT : INTEGER is 4 
	BFFM_INITIALIZED : INTEGER is 1 
	BFFM_VALIDATEFAILEDA : INTEGER is 3 
	BFFM_VALIDATEFAILEDW : INTEGER is 4 
	BI_BITFIELDS : INTEGER is 3 
	BI_RGB : INTEGER is 0 
	BIF_EDITBOX : INTEGER is 16 
	BIF_NEWDIALOGSTYLE : INTEGER is 64 
	BIF_RETURNONLYFSDIRS : INTEGER is 1 
	BIF_VALIDATE : INTEGER is 32 
	BITSPIXEL : INTEGER is 12 
	BLACKNESS : INTEGER is 66 
	BM_CLICK : INTEGER is 245 
	BM_GETCHECK : INTEGER is 240 
	BM_SETCHECK : INTEGER is 241 
	BM_SETIMAGE : INTEGER is 247 
	BM_SETSTYLE : INTEGER is 244 
	BN_CLICKED : INTEGER is 0 
	BN_DOUBLECLICKED : INTEGER is 5 
	BS_BITMAP : INTEGER is 128 
	BS_CENTER : INTEGER is 768 
	BS_CHECKBOX : INTEGER is 2 
	BS_DEFPUSHBUTTON : INTEGER is 1 
	BS_FLAT : INTEGER is 32768 
	BS_GROUPBOX : INTEGER is 7 
	BS_ICON : INTEGER is 64 
	BS_LEFT : INTEGER is 256 
	BS_NOTIFY : INTEGER is 16384 
	BS_OWNERDRAW : INTEGER is 11 
	BS_PUSHBUTTON : INTEGER is 0 
	BS_PUSHLIKE : INTEGER is 4096 
	BS_RADIOBUTTON : INTEGER is 4 
	BS_RIGHT : INTEGER is 512 
	BS_SOLID : INTEGER is 0 
	BST_CHECKED : INTEGER is 1 
	BST_UNCHECKED : INTEGER is 0 
	BTNS_AUTOSIZE : INTEGER is 16 
	BTNS_BUTTON : INTEGER is 0 
	BTNS_CHECK : INTEGER is 2 
	BTNS_CHECKGROUP : INTEGER is 6 
	BTNS_DROPDOWN : INTEGER is 8 
	BTNS_GROUP : INTEGER is 4 
	BTNS_SEP : INTEGER is 1 
	CB_ADDSTRING : INTEGER is 323 
	CB_DELETESTRING : INTEGER is 324 
	CB_ERR : INTEGER is -1 
	CB_ERRSPACE : INTEGER is -2 
	CB_FINDSTRINGEXACT : INTEGER is 344 
	CB_GETCOUNT : INTEGER is 326 
	CB_GETCURSEL : INTEGER is 327 
	CB_GETDROPPEDCONTROLRECT : INTEGER is 338 
	CB_GETDROPPEDSTATE : INTEGER is 343 
	CB_GETEDITSEL : INTEGER is 320 
	CB_GETITEMHEIGHT : INTEGER is 340 
	CB_GETLBTEXT : INTEGER is 328 
	CB_GETLBTEXTLEN : INTEGER is 329 
	CB_INSERTSTRING : INTEGER is 330 
	CB_LIMITTEXT : INTEGER is 321 
	CB_RESETCONTENT : INTEGER is 331 
	CB_SELECTSTRING : INTEGER is 333 
	CB_SETCURSEL : INTEGER is 334 
	CB_SETEDITSEL : INTEGER is 322 
	CB_SHOWDROPDOWN : INTEGER is 335 
	CBN_EDITCHANGE : INTEGER is 5 
	CBN_KILLFOCUS : INTEGER is 4 
	CBN_SELCHANGE : INTEGER is 1 
	CBN_SETFOCUS : INTEGER is 3 
	CBS_AUTOHSCROLL : INTEGER is 64 
	CBS_DROPDOWN : INTEGER is 2 
	CBS_DROPDOWNLIST : INTEGER is 3 
	CBS_NOINTEGRALHEIGHT : INTEGER is 1024 
	CBS_SIMPLE : INTEGER is 1 
	CC_ANYCOLOR : INTEGER is 256 
	CC_ENABLEHOOK : INTEGER is 16 
	CC_RGBINIT : INTEGER is 1 
	CCM_FIRST : INTEGER is 8192 
	CCM_SETBKCOLOR : INTEGER is 8193 
	CCS_NODIVIDER : INTEGER is 64 
	CCS_NORESIZE : INTEGER is 4 
	CDDS_ITEM : INTEGER is 65536 
	CDDS_ITEMPREPAINT : INTEGER is 65537 
	CDDS_PREPAINT : INTEGER is 1 
	CDDS_SUBITEM : INTEGER is 131072 
	CDRF_DODEFAULT : INTEGER is 0 
	CDRF_NEWFONT : INTEGER is 2 
	CDRF_NOTIFYITEMDRAW : INTEGER is 32 
	CDRF_NOTIFYSUBITEMDRAW : INTEGER is 32 
	CF_EFFECTS : INTEGER is 256 
	CF_INITTOLOGFONTSTRUCT : INTEGER is 64 
	CF_SCREENFONTS : INTEGER is 1 
	CF_TEXT : INTEGER is 1 
	CF_UNICODETEXT : INTEGER is 13 
	CF_USESTYLE : INTEGER is 128 
	CFE_AUTOCOLOR : INTEGER is 1073741824 
	CFE_ITALIC : INTEGER is 2 
	CFE_STRIKEOUT : INTEGER is 8 
	CFE_UNDERLINE : INTEGER is 4 
	CFM_BOLD : INTEGER is 1 
	CFM_CHARSET : INTEGER is 134217728 
	CFM_COLOR : INTEGER is 1073741824 
	CFM_FACE : INTEGER is 536870912 
	CFM_ITALIC : INTEGER is 2 
	CFM_SIZE : INTEGER is -2147483648 
	CFM_STRIKEOUT : INTEGER is 8 
	CFM_UNDERLINE : INTEGER is 4 
	CFM_WEIGHT : INTEGER is 4194304 
	CFS_POINT : INTEGER is 2 
	CLR_DEFAULT : INTEGER is -16777216 
	CLR_INVALID : INTEGER is -1 
	COLORONCOLOR : INTEGER is 3 
	COMPLEXREGION : INTEGER is 3 
	CP_ACP : INTEGER is 0 
	CP_INSTALLED : INTEGER is 1 
	CS_BYTEALIGNWINDOW : INTEGER is 8192 
	CS_DBLCLKS : INTEGER is 8 
	CS_HREDRAW : INTEGER is 2 
	CS_VREDRAW : INTEGER is 1 
	CW_USEDEFAULT : INTEGER is -2147483648 
	DCX_CACHE : INTEGER is 2 
	DCX_CLIPCHILDREN : INTEGER is 8 
	DCX_CLIPSIBLINGS : INTEGER is 16 
	DEFAULT_CHARSET : INTEGER is 1 
	DEFAULT_GUI_FONT : INTEGER is 17 
	DFC_BUTTON : INTEGER is 4 
	DFC_SCROLL : INTEGER is 3 
	DFCS_BUTTONCHECK : INTEGER is 0 
	DFCS_CHECKED : INTEGER is 1024 
	DFCS_FLAT : INTEGER is 16384 
	DFCS_INACTIVE : INTEGER is 256 
	DFCS_PUSHED : INTEGER is 512 
	DFCS_SCROLLDOWN : INTEGER is 1 
	DFCS_SCROLLLEFT : INTEGER is 2 
	DFCS_SCROLLRIGHT : INTEGER is 3 
	DFCS_SCROLLUP : INTEGER is 0 
	DI_NORMAL : INTEGER is 3 
	DIB_RGB_COLORS : INTEGER is 0 
	DISP_E_EXCEPTION : INTEGER is -2147352567 
	DLGC_BUTTON : INTEGER is 8192 
	DLGC_HASSETSEL : INTEGER is 8 
	DLGC_STATIC : INTEGER is 256 
	DLGC_WANTALLKEYS : INTEGER is 4 
	DLGC_WANTARROWS : INTEGER is 1 
	DLGC_WANTTAB : INTEGER is 2 
	DM_SETDEFID : INTEGER is 1025 
	DSS_DISABLED : INTEGER is 32 
	DST_BITMAP : INTEGER is 4 
	DST_ICON : INTEGER is 3 
	DSTINVERT : INTEGER is 5570569 
	DT_CALCRECT : INTEGER is 1024 
	DT_EDITCONTROL : INTEGER is 8192 
	DT_EXPANDTABS : INTEGER is 64 
	DT_LEFT : INTEGER is 0 
	DT_NOPREFIX : INTEGER is 2048 
	DT_SINGLELINE : INTEGER is 32 
	DT_WORDBREAK : INTEGER is 16 
	ECO_AUTOHSCROLL : INTEGER is 128 
	ECOOP_AND : INTEGER is 3 
	ECOOP_OR : INTEGER is 2 
	EDGE_ETCHED : INTEGER is 6 
	EDGE_SUNKEN : INTEGER is 10 
	EM_CANUNDO : INTEGER is 198 
	EM_CHARFROMPOS : INTEGER is 215 
	EM_DISPLAYBAND : INTEGER is 1075 
	EM_GETFIRSTVISIBLELINE : INTEGER is 206 
	EM_GETLIMITTEXT : INTEGER is 213 
	EM_GETLINE : INTEGER is 196 
	EM_GETLINECOUNT : INTEGER is 186 
	EM_GETMARGINS : INTEGER is 212 
	EM_GETPASSWORDCHAR : INTEGER is 210 
	EM_GETSCROLLPOS : INTEGER is 1245 
	EM_GETSEL : INTEGER is 176 
	EM_LIMITTEXT : INTEGER is 197 
	EM_LINEFROMCHAR : INTEGER is 201 
	EM_LINEINDEX : INTEGER is 187 
	EM_LINELENGTH : INTEGER is 193 
	EM_LINESCROLL : INTEGER is 182 
	EM_POSFROMCHAR : INTEGER is 214 
	EM_REPLACESEL : INTEGER is 194 
	EM_SCROLLCARET : INTEGER is 183 
	EM_SETBKGNDCOLOR : INTEGER is 1091 
	EM_SETLIMITTEXT : INTEGER is 197 
	EM_SETOPTIONS : INTEGER is 1101 
	EM_SETPARAFORMAT : INTEGER is 1095 
	EM_SETPASSWORDCHAR : INTEGER is 204 
	EM_SETREADONLY : INTEGER is 207 
	EM_SETSEL : INTEGER is 177 
	EM_SETTABSTOPS : INTEGER is 203 
	EN_CHANGE : INTEGER is 768 
	ERROR_NO_MORE_ITEMS : INTEGER is 259 
	ES_AUTOHSCROLL : INTEGER is 128 
	ES_CENTER : INTEGER is 1 
	ES_MULTILINE : INTEGER is 4 
	ES_NOHIDESEL : INTEGER is 256 
	ES_READONLY : INTEGER is 2048 
	ES_RIGHT : INTEGER is 2 
	ESB_DISABLE_BOTH : INTEGER is 3 
	ESB_ENABLE_BOTH : INTEGER is 0 
	FALT : INTEGER is 16 
	FCONTROL : INTEGER is 8 
	FNERR_INVALIDFILENAME : INTEGER is 12290 
	FSHIFT : INTEGER is 4 
	FVIRTKEY : INTEGER is 1 
	GCS_COMPSTR : INTEGER is 8 
	GCS_RESULTSTR : INTEGER is 2048 
	GMDI_USEDISABLED : INTEGER is 1 
	GMEM_FIXED : INTEGER is 0 
	GMEM_ZEROINIT : INTEGER is 64 
	GN_CONTEXTMENU : INTEGER is 1000 
	GPTR : INTEGER is 64 
	GRADIENT_FILL_RECT_H : INTEGER is 0 
	GRADIENT_FILL_RECT_V : INTEGER is 1 
	GT_DEFAULT : INTEGER is 0 
	GTL_NUMBYTES : INTEGER is 16 
	GTL_NUMCHARS : INTEGER is 8 
	GTL_PRECISE : INTEGER is 2 
	GW_CHILD : INTEGER is 5 
	GW_HWNDFIRST : INTEGER is 0 
	GW_HWNDLAST : INTEGER is 1 
	GW_HWNDNEXT : INTEGER is 2 
	GW_HWNDPREV : INTEGER is 3 
	GWL_EXSTYLE : INTEGER is -20 
	GWL_ID : INTEGER is -12 
	GWL_STYLE : INTEGER is -16 
	GWL_USERDATA : INTEGER is -21 
	GWL_WNDPROC : INTEGER is -4 
	HBMMENU_CALLBACK : INTEGER is -1 
	HDI_WIDTH : INTEGER is 1 
	HDM_FIRST : INTEGER is 4608 
	HDM_GETBITMAPMARGIN : INTEGER is 4629 
	HDM_GETITEMCOUNT : INTEGER is 4608 
	HDN_BEGINTRACKA : INTEGER is -306 
	HDN_BEGINTRACKW : INTEGER is -326 
	HDN_DIVIDERDBLCLICKA : INTEGER is -305 
	HDN_DIVIDERDBLCLICKW : INTEGER is -325 
	HDN_FIRST : INTEGER is -300 
	HDN_ITEMCHANGEDA : INTEGER is -301 
	HDN_ITEMCHANGEDW : INTEGER is -321 
	HDN_ITEMDBLCLICKA : INTEGER is -303 
	HDN_ITEMDBLCLICKW : INTEGER is -323 
	HEAP_ZERO_MEMORY : INTEGER is 8 
	HELPINFO_MENUITEM : INTEGER is 2 
	HINST_COMMCTRL : INTEGER is -1 
	HKEY_CLASSES_ROOT : INTEGER is -2147483648 
	HKEY_CURRENT_USER : INTEGER is -2147483647 
	HORZRES : INTEGER is 8 
	HTBORDER : INTEGER is 18 
	HTCLIENT : INTEGER is 1 
	HTERROR : INTEGER is -2 
	HTHSCROLL : INTEGER is 6 
	HTMENU : INTEGER is 5 
	HTNOWHERE : INTEGER is 0 
	HTTRANSPARENT : INTEGER is -1 
	HTVSCROLL : INTEGER is 7 
	HWND_BOTTOM : INTEGER is 1 
	HWND_NOTOPMOST : INTEGER is -2 
	HWND_TOP : INTEGER is 0 
	HWND_TOPMOST : INTEGER is -1 
	I_IMAGENONE : INTEGER is -2 
	ICC_COOL_CLASSES : INTEGER is 1024 
	ICM_NOTOPEN : INTEGER is 0 
	ICON_BIG : INTEGER is 1 
	ICON_SMALL : INTEGER is 0 
	IDABORT : INTEGER is 3 
	IDB_STD_SMALL_COLOR : INTEGER is 0 
	IDC_APPSTARTING : INTEGER is 32650 
	IDC_ARROW : INTEGER is 32512 
	IDC_CROSS : INTEGER is 32515 
	IDC_HAND : INTEGER is 32649 
	IDC_HELP : INTEGER is 32651 
	IDC_IBEAM : INTEGER is 32513 
	IDC_NO : INTEGER is 32648 
	IDC_SIZE : INTEGER is 32640 
	IDC_SIZEALL : INTEGER is 32646 
	IDC_SIZENESW : INTEGER is 32643 
	IDC_SIZENS : INTEGER is 32645 
	IDC_SIZENWSE : INTEGER is 32642 
	IDC_SIZEWE : INTEGER is 32644 
	IDC_UPARROW : INTEGER is 32516 
	IDC_WAIT : INTEGER is 32514 
	IDI_WINLOGO : INTEGER is 32517 
	IDNO : INTEGER is 7 
	IDOK : INTEGER is 1 
	IDRETRY : INTEGER is 4 
	IDYES : INTEGER is 6 
	ILC_COLOR : INTEGER is 0 
	ILC_COLOR16 : INTEGER is 16 
	ILC_COLOR24 : INTEGER is 24 
	ILC_COLOR32 : INTEGER is 32 
	ILC_COLOR4 : INTEGER is 4 
	ILC_COLOR8 : INTEGER is 8 
	ILC_MASK : INTEGER is 1 
	ILD_NORMAL : INTEGER is 0 
	IMAGE_BITMAP : INTEGER is 0 
	IMAGE_CURSOR : INTEGER is 2 
	IMAGE_ICON : INTEGER is 1 
	IME_CMODE_FULLSHAPE : INTEGER is 8 
	IME_CMODE_KATAKANA : INTEGER is 2 
	IME_CMODE_NATIVE : INTEGER is 1 
	IME_CMODE_ROMAN : INTEGER is 16 
	INFINITE : INTEGER is -1 
	KEY_ENUMERATE_SUB_KEYS : INTEGER is 8 
	KEY_NOTIFY : INTEGER is 16 
	KEY_QUERY_VALUE : INTEGER is 1 
	KEY_READ : INTEGER is 131097 
	LB_ADDSTRING : INTEGER is 384 
	LB_DELETESTRING : INTEGER is 386 
	LB_ERR : INTEGER is -1 
	LB_ERRSPACE : INTEGER is -2 
	LB_FINDSTRINGEXACT : INTEGER is 418 
	LB_GETCARETINDEX : INTEGER is 415 
	LB_GETCOUNT : INTEGER is 395 
	LB_GETCURSEL : INTEGER is 392 
	LB_GETHORIZONTALEXTENT : INTEGER is 403 
	LB_GETITEMHEIGHT : INTEGER is 417 
	LB_GETITEMRECT : INTEGER is 408 
	LB_GETSEL : INTEGER is 391 
	LB_GETSELCOUNT : INTEGER is 400 
	LB_GETSELITEMS : INTEGER is 401 
	LB_GETTEXT : INTEGER is 393 
	LB_GETTEXTLEN : INTEGER is 394 
	LB_GETTOPINDEX : INTEGER is 398 
	LB_INITSTORAGE : INTEGER is 424 
	LB_INSERTSTRING : INTEGER is 385 
	LB_RESETCONTENT : INTEGER is 388 
	LB_SELITEMRANGE : INTEGER is 411 
	LB_SELITEMRANGEEX : INTEGER is 387 
	LB_SETCARETINDEX : INTEGER is 414 
	LB_SETCURSEL : INTEGER is 390 
	LB_SETHORIZONTALEXTENT : INTEGER is 404 
	LB_SETSEL : INTEGER is 389 
	LB_SETTOPINDEX : INTEGER is 407 
	LAYOUT_RTL : INTEGER is 1
	LBN_DBLCLK : INTEGER is 2 
	LBN_SELCHANGE : INTEGER is 1 
	LBS_EXTENDEDSEL : INTEGER is 2048 
	LBS_MULTIPLESEL : INTEGER is 8 
	LBS_NOINTEGRALHEIGHT : INTEGER is 256 
	LBS_NOTIFY : INTEGER is 1 
	LCID_SUPPORTED : INTEGER is 2 
	LGRPID_ARABIC : INTEGER is 13 
	LGRPID_HEBREW : INTEGER is 12 
	LGRPID_INSTALLED : INTEGER is 1 
	LOCALE_IDEFAULTANSICODEPAGE : INTEGER is 4100 
	LOCALE_SISO3166CTRYNAME : INTEGER is 90 
	LOCALE_SISO639LANGNAME : INTEGER is 89 
	LOGPIXELSX : INTEGER is 88 
	LOGPIXELSY : INTEGER is 90 
	LPSTR_TEXTCALLBACK : INTEGER is -1 
	LR_DEFAULTCOLOR : INTEGER is 0 
	LVCF_FMT : INTEGER is 1 
	LVCF_IMAGE : INTEGER is 16 
	LVCF_TEXT : INTEGER is 4 
	LVCF_WIDTH : INTEGER is 2 
	LVCFMT_CENTER : INTEGER is 2 
	LVCFMT_IMAGE : INTEGER is 2048 
	LVCFMT_LEFT : INTEGER is 0 
	LVCFMT_RIGHT : INTEGER is 1 
	LVHT_ONITEM : INTEGER is 14 
	LVHT_ONITEMICON : INTEGER is 2 
	LVHT_ONITEMLABEL : INTEGER is 4 
	LVHT_ONITEMSTATEICON : INTEGER is 8 
	LVIF_IMAGE : INTEGER is 2 
	LVIF_INDENT : INTEGER is 16 
	LVIF_STATE : INTEGER is 8 
	LVIF_TEXT : INTEGER is 1 
	LVIR_BOUNDS : INTEGER is 0 
	LVIR_ICON : INTEGER is 1 
	LVIR_LABEL : INTEGER is 2 
	LVIS_DROPHILITED : INTEGER is 8 
	LVIS_FOCUSED : INTEGER is 1 
	LVIS_SELECTED : INTEGER is 2 
	LVIS_STATEIMAGEMASK : INTEGER is 61440 
	LVM_APPROXIMATEVIEWRECT : INTEGER is 4160 
	LVM_DELETEALLITEMS : INTEGER is 4105 
	LVM_DELETECOLUMN : INTEGER is 4124 
	LVM_DELETEITEM : INTEGER is 4104 
	LVM_ENSUREVISIBLE : INTEGER is 4115 
	LVM_FIRST : INTEGER is 4096 
	LVM_GETBKCOLOR : INTEGER is 4096 
	LVM_GETCOLUMNWIDTH : INTEGER is 4125 
	LVM_GETCOUNTPERPAGE : INTEGER is 4136 
	LVM_GETEXTENDEDLISTVIEWSTYLE : INTEGER is 4151 
	LVM_GETHEADER : INTEGER is 4127 
	LVM_GETIMAGELIST : INTEGER is 4098 
	LVM_GETITEMA : INTEGER is 4101 
	LVM_GETITEMCOUNT : INTEGER is 4100 
	LVM_GETITEMRECT : INTEGER is 4110 
	LVM_GETITEMSTATE : INTEGER is 4140 
	LVM_GETITEMW : INTEGER is 4171 
	LVM_GETNEXTITEM : INTEGER is 4108 
	LVM_GETSELECTEDCOUNT : INTEGER is 4146 
	LVM_GETSUBITEMRECT : INTEGER is 4152 
	LVM_GETTEXTCOLOR : INTEGER is 4131 
	LVM_GETTOPINDEX : INTEGER is 4135 
	LVM_HITTEST : INTEGER is 4114 
	LVM_SCROLL : INTEGER is 4116 
	LVM_SETBKCOLOR : INTEGER is 4097 
	LVM_SETCOLUMNWIDTH : INTEGER is 4126 
	LVM_SETEXTENDEDLISTVIEWSTYLE : INTEGER is 4150 
	LVM_SETIMAGELIST : INTEGER is 4099 
	LVM_SETITEMSTATE : INTEGER is 4139 
	LVM_SETTEXTBKCOLOR : INTEGER is 4134 
	LVM_SETTEXTCOLOR : INTEGER is 4132 
	LVN_BEGINDRAG : INTEGER is -109 
	LVN_BEGINRDRAG : INTEGER is -111 
	LVN_COLUMNCLICK : INTEGER is -108 
	LVN_FIRST : INTEGER is -100 
	LVN_ITEMACTIVATE : INTEGER is -114 
	LVN_ITEMCHANGED : INTEGER is -101 
	LVN_MARQUEEBEGIN : INTEGER is -156 
	LVNI_FOCUSED : INTEGER is 1 
	LVNI_SELECTED : INTEGER is 2 
	LVS_EX_FULLROWSELECT : INTEGER is 32 
	LVS_EX_GRIDLINES : INTEGER is 1 
	LVS_EX_LABELTIP : INTEGER is 16384 
	LVS_EX_ONECLICKACTIVATE : INTEGER is 64 
	LVS_EX_SUBITEMIMAGES : INTEGER is 2 
	LVS_EX_TRACKSELECT : INTEGER is 8 
	LVS_EX_TWOCLICKACTIVATE : INTEGER is 128 
	LVS_NOCOLUMNHEADER : INTEGER is 16384 
	LVS_NOSCROLL : INTEGER is 8192 
	LVS_REPORT : INTEGER is 1 
	LVS_SHAREIMAGELISTS : INTEGER is 64 
	LVS_SHOWSELALWAYS : INTEGER is 8 
	LVS_SINGLESEL : INTEGER is 4 
	LVSCW_AUTOSIZE : INTEGER is -1 
	LVSCW_AUTOSIZE_USEHEADER : INTEGER is -2 
	LVSIL_SMALL : INTEGER is 1 
	LVSIL_STATE : INTEGER is 2 
	MA_NOACTIVATE : INTEGER is 3 
	MB_ABORTRETRYIGNORE : INTEGER is 2 
	MB_APPLMODAL : INTEGER is 0 
	MB_ICONERROR : INTEGER is 16 
	MB_ICONINFORMATION : INTEGER is 64 
	MB_ICONQUESTION : INTEGER is 32 
	MB_ICONWARNING : INTEGER is 48 
	MB_OK : INTEGER is 0 
	MB_OKCANCEL : INTEGER is 1 
	MB_PRECOMPOSED : INTEGER is 1 
	MB_RETRYCANCEL : INTEGER is 5 
	MB_RTLREADING : INTEGER is 1048576 
	MB_SYSTEMMODAL : INTEGER is 4096 
	MB_TASKMODAL : INTEGER is 8192 
	MB_YESNO : INTEGER is 4 
	MB_YESNOCANCEL : INTEGER is 3 
	MF_BYCOMMAND : INTEGER is 0 
	MF_BYPOSITION : INTEGER is 1024 
	MF_CHECKED : INTEGER is 8 
	MF_DISABLED : INTEGER is 2 
	MF_ENABLED : INTEGER is 0 
	MF_GRAYED : INTEGER is 1 
	MF_HILITE : INTEGER is 128 
	MF_POPUP : INTEGER is 16 
	MF_SEPARATOR : INTEGER is 2048 
	MF_SYSMENU : INTEGER is 8192 
	MF_UNCHECKED : INTEGER is 0 
	MFS_CHECKED : INTEGER is 8 
	MFS_DISABLED : INTEGER is 3 
	MFS_GRAYED : INTEGER is 3 
	MFT_RADIOCHECK : INTEGER is 512 
	MFT_RIGHTJUSTIFY : INTEGER is 16384 
	MFT_RIGHTORDER : INTEGER is 8192 
	MFT_SEPARATOR : INTEGER is 2048 
	MFT_STRING : INTEGER is 0 
	MIIM_BITMAP : INTEGER is 128 
	MIIM_DATA : INTEGER is 32 
	MIIM_ID : INTEGER is 2 
	MIIM_STATE : INTEGER is 1 
	MIIM_SUBMENU : INTEGER is 4 
	MIIM_TYPE : INTEGER is 16 
	MIM_STYLE : INTEGER is 16 
	MK_CONTROL : INTEGER is 8 
	MK_LBUTTON : INTEGER is 1 
	MK_MBUTTON : INTEGER is 16 
	MK_RBUTTON : INTEGER is 2 
	MK_SHIFT : INTEGER is 4 
	MM_TEXT : INTEGER is 1 
	MNC_CLOSE : INTEGER is 1 
	MNS_CHECKORBMP : INTEGER is 67108864 
	MWMO_INPUTAVAILABLE : INTEGER is 4 
	NM_CLICK : INTEGER is -2 
	NM_CUSTOMDRAW : INTEGER is -12 
	NM_DBLCLK : INTEGER is -3 
	NM_FIRST : INTEGER is 0 
	NM_RETURN : INTEGER is -4 
	NOTSRCCOPY : INTEGER is 3342344 
	NULL_BRUSH : INTEGER is 5 
	NULL_PEN : INTEGER is 8 
	NULLREGION : INTEGER is 1 
	NUMRESERVED : INTEGER is 106 
	OBJ_FONT : INTEGER is 6 
	OBJ_PEN : INTEGER is 1 
	OBJID_CLIENT : INTEGER is -4 
	OBM_CHECKBOXES : INTEGER is 32759 
	ODS_SELECTED : INTEGER is 1 
	ODT_MENU : INTEGER is 1 
	OFN_ALLOWMULTISELECT : INTEGER is 512 
	OFN_EXPLORER : INTEGER is 524288 
	OFN_HIDEREADONLY : INTEGER is 4 
	OFN_NOCHANGEDIR : INTEGER is 8 
	OPAQUE : INTEGER is 2 
	PATCOPY : INTEGER is 15728673 
	PATINVERT : INTEGER is 5898313 
	PBM_GETPOS : INTEGER is 1032 
	PBM_GETRANGE : INTEGER is 1031 
	PBM_SETBARCOLOR : INTEGER is 1033 
	PBM_SETBKCOLOR : INTEGER is 8193 
	PBM_SETPOS : INTEGER is 1026 
	PBM_SETRANGE32 : INTEGER is 1030 
	PBM_STEPIT : INTEGER is 1029 
	PBS_SMOOTH : INTEGER is 1 
	PBS_VERTICAL : INTEGER is 4 
	PD_ALLPAGES : INTEGER is 0 
	PD_COLLATE : INTEGER is 16 
	PD_PAGENUMS : INTEGER is 2 
	PD_PRINTTOFILE : INTEGER is 32 
	PD_RETURNDC : INTEGER is 256 
	PD_SELECTION : INTEGER is 1 
	PD_USEDEVMODECOPIESANDCOLLATE : INTEGER is 262144 
	PFM_TABSTOPS : INTEGER is 16 
	PHYSICALHEIGHT : INTEGER is 111 
	PHYSICALOFFSETX : INTEGER is 112 
	PHYSICALOFFSETY : INTEGER is 113 
	PHYSICALWIDTH : INTEGER is 110 
	PLANES : INTEGER is 14 
	PM_NOREMOVE : INTEGER is 0 
	PM_REMOVE : INTEGER is 1 
	PROGRESS_CLASS : STRING is "msctls_progress32" 
	PS_DASH : INTEGER is 1 
	PS_DASHDOT : INTEGER is 3 
	PS_DASHDOTDOT : INTEGER is 4 
	PS_DOT : INTEGER is 2 
	PS_ENDCAP_FLAT : INTEGER is 512 
	PS_GEOMETRIC : INTEGER is 65536 
	PS_JOIN_MITER : INTEGER is 8192 
	PS_SOLID : INTEGER is 0 
	PS_STYLE_MASK : INTEGER is 15 
	QS_ALLINPUT : INTEGER is 127 
	QS_KEY : INTEGER is 1 
	QS_MOUSEBUTTON : INTEGER is 4 
	QS_MOUSEMOVE : INTEGER is 2 
	QS_PAINT : INTEGER is 32 
	QS_POSTMESSAGE : INTEGER is 8 
	QS_SENDMESSAGE : INTEGER is 64 
	QS_TIMER : INTEGER is 16 
	R2_COPYPEN : INTEGER is 13 
	R2_XORPEN : INTEGER is 7 
	RASTER_FONTTYPE : INTEGER is 1 
	RASTERCAPS : INTEGER is 38 
	RB_DELETEBAND : INTEGER is 1026 
	RB_GETBANDBORDERS : INTEGER is 1058 
	RB_GETBANDCOUNT : INTEGER is 1036 
	RB_GETBARHEIGHT : INTEGER is 1051 
	RB_GETBKCOLOR : INTEGER is 1044 
	RB_GETRECT : INTEGER is 1033 
	RB_GETTEXTCOLOR : INTEGER is 1046 
	RB_IDTOINDEX : INTEGER is 1040 
	RB_MOVEBAND : INTEGER is 1063 
	RB_SETBKCOLOR : INTEGER is 1043 
	RB_SETTEXTCOLOR : INTEGER is 1045 
	RBBIM_CHILD : INTEGER is 16 
	RBBIM_CHILDSIZE : INTEGER is 32 
	RBBIM_COLORS : INTEGER is 2 
	RBBIM_HEADERSIZE : INTEGER is 2048 
	RBBIM_ID : INTEGER is 256 
	RBBIM_IDEALSIZE : INTEGER is 512 
	RBBIM_SIZE : INTEGER is 64 
	RBBIM_STYLE : INTEGER is 1 
	RBBIM_TEXT : INTEGER is 4 
	RBBS_BREAK : INTEGER is 1 
	RBBS_GRIPPERALWAYS : INTEGER is 128 
	RBBS_NOGRIPPER : INTEGER is 256 
	RBBS_USECHEVRON : INTEGER is 512 
	RBBS_VARIABLEHEIGHT : INTEGER is 64 
	RBN_CHEVRONPUSHED : INTEGER is -841 
	RBN_FIRST : INTEGER is -831 
	RBN_HEIGHTCHANGE : INTEGER is -831 
	RBS_BANDBORDERS : INTEGER is 1024 
	RBS_DBLCLKTOGGLE : INTEGER is 32768 
	RBS_VARHEIGHT : INTEGER is 512 
	RC_BITBLT : INTEGER is 1 
	RC_PALETTE : INTEGER is 256 
	RDW_ALLCHILDREN : INTEGER is 128 
	RDW_ERASE : INTEGER is 4 
	RDW_FRAME : INTEGER is 1024 
	RDW_INVALIDATE : INTEGER is 1 
	RDW_UPDATENOW : INTEGER is 256 
	READ_CONTROL : INTEGER is 131072 
	REBARCLASSNAME : STRING is "ReBarWindow32" 
	RGN_OR : INTEGER is 2 
	S_OK : INTEGER is 0 
	SB_BOTTOM : INTEGER is 7 
	SB_CTL : INTEGER is 2 
	SB_ENDSCROLL : INTEGER is 8 
	SB_HORZ : INTEGER is 0 
	SB_LINEDOWN : INTEGER is 1 
	SB_LINEUP : INTEGER is 0 
	SB_PAGEDOWN : INTEGER is 3 
	SB_PAGEUP : INTEGER is 2 
	SB_THUMBPOSITION : INTEGER is 4 
	SB_THUMBTRACK : INTEGER is 5 
	SB_TOP : INTEGER is 6 
	SB_VERT : INTEGER is 1 
	SBS_HORZ : INTEGER is 0 
	SBS_VERT : INTEGER is 1 
	SC_CLOSE : INTEGER is 61536 
	SC_HSCROLL : INTEGER is 61568 
	SC_KEYMENU : INTEGER is 61696 
	SC_MAXIMIZE : INTEGER is 61488 
	SC_MINIMIZE : INTEGER is 61472 
	SC_RESTORE : INTEGER is 61728 
	SC_SIZE : INTEGER is 61440 
	SC_TASKLIST : INTEGER is 61744 
	SC_VSCROLL : INTEGER is 61552 
	SCF_ALL : INTEGER is 4 
	SCF_DEFAULT : INTEGER is 0 
	SCF_SELECTION : INTEGER is 1 
	SF_RTF : INTEGER is 2 
	SHCMBF_HIDDEN : INTEGER is 2 
	SHCMBM_GETSUBMENU : INTEGER is 1425 
	SHCMBM_OVERRIDEKEY : INTEGER is 1427 
	SHCMBM_SETSUBMENU : INTEGER is 1424 
	SHMBOF_NODEFAULT : INTEGER is 1 
	SHMBOF_NOTIFY : INTEGER is 2 
	SHRG_RETURNCMD : INTEGER is 1 
	SIF_ALL : INTEGER is 23 
	SIF_DISABLENOSCROLL : INTEGER is 8 
	SIF_PAGE : INTEGER is 2 
	SIF_POS : INTEGER is 4 
	SIF_RANGE : INTEGER is 1 
	SIF_TRACKPOS : INTEGER is 16 
	SIP_DOWN : INTEGER is 1 
	SIP_UP : INTEGER is 0 
	SIPF_ON : INTEGER is 1 
	SIZE_MINIMIZED : INTEGER is 1 
	SIZEPALETTE : INTEGER is 104 
	SM_CMONITORS : INTEGER is 80 
	SM_CXBORDER : INTEGER is 5 
	SM_CXCURSOR : INTEGER is 13 
	SM_CXEDGE : INTEGER is 45 
	SM_CXHSCROLL : INTEGER is 21 
	SM_CXICON : INTEGER is 11 
	SM_CXSCREEN : INTEGER is 0 
	SM_CXSMICON : INTEGER is 49 
	SM_CXVIRTUALSCREEN : INTEGER is 78 
	SM_CXVSCROLL : INTEGER is 2 
	SM_CYBORDER : INTEGER is 6 
	SM_CYCURSOR : INTEGER is 14 
	SM_CYHSCROLL : INTEGER is 3 
	SM_CYICON : INTEGER is 12 
	SM_CYMENU : INTEGER is 15 
	SM_CYSCREEN : INTEGER is 1 
	SM_CYSMICON : INTEGER is 50 
	SM_CYVIRTUALSCREEN : INTEGER is 79 
	SM_CYVSCROLL : INTEGER is 20 
	SM_XVIRTUALSCREEN : INTEGER is 76 
	SM_YVIRTUALSCREEN : INTEGER is 77 
	SPI_GETNONCLIENTMETRICS : INTEGER is 41 
	SPI_GETWHEELSCROLLLINES : INTEGER is 104 
	SPI_GETWORKAREA : INTEGER is 48 
	SPI_SETSIPINFO : INTEGER is 224 
	SRCAND : INTEGER is 8913094 
	SRCCOPY : INTEGER is 13369376 
	SRCINVERT : INTEGER is 6684742 
	SRCPAINT : INTEGER is 15597702 
	SS_BITMAP : INTEGER is 14 
	SS_CENTER : INTEGER is 1 
	SS_CENTERIMAGE : INTEGER is 512 
	SS_ICON : INTEGER is 3 
	SS_LEFT : INTEGER is 0 
	SS_LEFTNOWORDWRAP : INTEGER is 12 
	SS_NOTIFY : INTEGER is 256 
	SS_OWNERDRAW : INTEGER is 13 
	SS_REALSIZEIMAGE : INTEGER is 2048 
	SS_RIGHT : INTEGER is 2 
	STANDARD_RIGHTS_READ : INTEGER is 131072 
	STD_COPY : INTEGER is 1 
	STD_CUT : INTEGER is 0 
	STD_FILENEW : INTEGER is 6 
	STD_FILEOPEN : INTEGER is 7 
	STD_FILESAVE : INTEGER is 8 
	STD_PASTE : INTEGER is 2 
	STM_SETIMAGE : INTEGER is 370 
	SW_ERASE : INTEGER is 4 
	SW_HIDE : INTEGER is 0 
	SW_INVALIDATE : INTEGER is 2 
	SW_PARENTOPENING : INTEGER is 3 
	SW_RESTORE : INTEGER is 9
	SW_SCROLLCHILDREN : INTEGER is 1 
	SW_SHOW : INTEGER is 5 
	SW_SHOWMINNOACTIVE : INTEGER is 7 
	SW_SHOWNA : INTEGER is 8 
	SW_SHOWMAXIMIZED : INTEGER is 3
	SW_SHOWNOACTIVATE : INTEGER is 4 
	SWP_DRAWFRAME : INTEGER is 32 
	SWP_NOACTIVATE : INTEGER is 16 
	SWP_NOCOPYBITS : INTEGER is 256 
	SWP_NOMOVE : INTEGER is 2 
	SWP_NOREDRAW : INTEGER is 8 
	SWP_NOSIZE : INTEGER is 1 
	SWP_NOZORDER : INTEGER is 4 
	SYNCHRONIZE : INTEGER is 1048576 
	SYSTEM_FONT : INTEGER is 13 
	TB_BUTTONCOUNT : INTEGER is 1048 
	TB_BUTTONSTRUCTSIZE : INTEGER is 1054 
	TB_COMMANDTOINDEX : INTEGER is 1049 
	TB_DELETEBUTTON : INTEGER is 1046 
	TB_ENDTRACK : INTEGER is 8 
	TB_GETBUTTON : INTEGER is 1047 
	TB_GETBUTTONSIZE : INTEGER is 1082 
	TB_GETDISABLEDIMAGELIST : INTEGER is 1079 
	TB_GETHOTIMAGELIST : INTEGER is 1077 
	TB_GETHOTITEM : INTEGER is 1095 
	TB_GETIMAGELIST : INTEGER is 1073 
	TB_GETITEMRECT : INTEGER is 1053 
	TB_GETROWS : INTEGER is 1064 
	TB_GETSTATE : INTEGER is 1042 
	TB_GETTOOLTIPS : INTEGER is 1059 
	TB_LOADIMAGES : INTEGER is 1074 
	TB_SETBITMAPSIZE : INTEGER is 1056 
	TB_SETBUTTONSIZE : INTEGER is 1055 
	TB_SETDISABLEDIMAGELIST : INTEGER is 1078 
	TB_SETEXTENDEDSTYLE : INTEGER is 1108 
	TB_SETHOTIMAGELIST : INTEGER is 1076 
	TB_SETHOTITEM : INTEGER is 1096 
	TB_SETIMAGELIST : INTEGER is 1072 
	TB_SETROWS : INTEGER is 1063 
	TB_SETSTATE : INTEGER is 1041 
	TBIF_COMMAND : INTEGER is 32 
	TBIF_IMAGE : INTEGER is 1 
	TBIF_LPARAM : INTEGER is 16 
	TBIF_SIZE : INTEGER is 64 
	TBIF_STATE : INTEGER is 4 
	TBIF_STYLE : INTEGER is 8 
	TBIF_TEXT : INTEGER is 2 
	TBM_GETLINESIZE : INTEGER is 1048 
	TBM_GETPAGESIZE : INTEGER is 1046 
	TBM_GETPOS : INTEGER is 1024 
	TBM_GETRANGEMAX : INTEGER is 1026 
	TBM_GETRANGEMIN : INTEGER is 1025 
	TBM_GETTHUMBRECT : INTEGER is 1049 
	TBM_SETLINESIZE : INTEGER is 1047 
	TBM_SETPAGESIZE : INTEGER is 1045 
	TBM_SETPOS : INTEGER is 1029 
	TBM_SETRANGEMAX : INTEGER is 1032 
	TBM_SETRANGEMIN : INTEGER is 1031 
	TBM_SETTICFREQ : INTEGER is 1044 
	TBN_DROPDOWN : INTEGER is -710 
	TBN_FIRST : INTEGER is -700 
	TBS_AUTOTICKS : INTEGER is 1 
	TBS_BOTH : INTEGER is 8 
	TBS_HORZ : INTEGER is 0 
	TBS_VERT : INTEGER is 2 
	TBSTATE_CHECKED : INTEGER is 1 
	TBSTATE_ENABLED : INTEGER is 4 
	TBSTYLE_AUTOSIZE : INTEGER is 16 
	TBSTYLE_DROPDOWN : INTEGER is 8 
	TBSTYLE_EX_DRAWDDARROWS : INTEGER is 1 
	TBSTYLE_FLAT : INTEGER is 2048 
	TBSTYLE_LIST : INTEGER is 4096 
	TBSTYLE_TOOLTIPS : INTEGER is 256 
	TBSTYLE_TRANSPARENT : INTEGER is 32768 
	TBSTYLE_WRAPABLE : INTEGER is 512 
	TCI_SRCCHARSET : INTEGER is 1 
	TCI_SRCCODEPAGE : INTEGER is 2 
	TCIF_IMAGE : INTEGER is 2 
	TCIF_TEXT : INTEGER is 1 
	TCM_ADJUSTRECT : INTEGER is 4904 
	TCM_DELETEITEM : INTEGER is 4872 
	TCM_GETCURSEL : INTEGER is 4875 
	TCM_GETITEMCOUNT : INTEGER is 4868 
	TCM_GETITEMRECT : INTEGER is 4874 
	TCM_GETTOOLTIPS : INTEGER is 4909 
	TCM_SETCURSEL : INTEGER is 4876 
	TCM_SETIMAGELIST : INTEGER is 4867 
	TCN_SELCHANGE : INTEGER is -551 
	TCN_SELCHANGING : INTEGER is -552 
	TCS_FOCUSNEVER : INTEGER is 32768 
	TCS_MULTILINE : INTEGER is 512 
	TCS_TABS : INTEGER is 0 
	TCS_TOOLTIPS : INTEGER is 16384 
	TME_HOVER : INTEGER is 1 
	TME_LEAVE : INTEGER is 2 
	TME_QUERY : INTEGER is 1073741824 
	TMPF_VECTOR : INTEGER is 2 
	TOOLBARCLASSNAME : STRING is "ToolbarWindow32" 
	TOOLTIPS_CLASS : STRING is "tooltips_class32" 
	TPM_LEFTALIGN : INTEGER is 0 
	TPM_LEFTBUTTON : INTEGER is 0 
	TPM_RIGHTALIGN : INTEGER is 8 
	TPM_RIGHTBUTTON : INTEGER is 2 
	TRACKBAR_CLASS : STRING is "msctls_trackbar32" 
	TRANSPARENT : INTEGER is 1 
	TTF_IDISHWND : INTEGER is 1 
	TTF_SUBCLASS : INTEGER is 16 
	TTM_SETMAXTIPWIDTH : INTEGER is 1048 
	TTM_UPDATE : INTEGER is 1053 
	TTN_FIRST : INTEGER is -520 
	TTN_GETDISPINFOA : INTEGER is -520 
	TTN_GETDISPINFOW : INTEGER is -530 
	TTN_POP : INTEGER is -522 
	TTN_SHOW : INTEGER is -521 
	TTS_ALWAYSTIP : INTEGER is 1 
	TV_FIRST : INTEGER is 4352 
	TVE_COLLAPSE : INTEGER is 1 
	TVE_EXPAND : INTEGER is 2 
	TVGN_CARET : INTEGER is 9 
	TVGN_CHILD : INTEGER is 4 
	TVGN_FIRSTVISIBLE : INTEGER is 5 
	TVGN_LASTVISIBLE : INTEGER is 10 
	TVGN_NEXT : INTEGER is 1 
	TVGN_NEXTVISIBLE : INTEGER is 6 
	TVGN_PARENT : INTEGER is 3 
	TVGN_PREVIOUSVISIBLE : INTEGER is 7 
	TVGN_ROOT : INTEGER is 0 
	TVHT_ONITEM : INTEGER is 70 
	TVHT_ONITEMICON : INTEGER is 2 
	TVHT_ONITEMLABEL : INTEGER is 4 
	TVHT_ONITEMSTATEICON : INTEGER is 64 
	TVI_FIRST : INTEGER is -65535 
	TVI_LAST : INTEGER is -65534 
	TVI_ROOT : INTEGER is -65536 
	TVIF_HANDLE : INTEGER is 16 
	TVIF_IMAGE : INTEGER is 2 
	TVIF_PARAM : INTEGER is 4 
	TVIF_SELECTEDIMAGE : INTEGER is 32 
	TVIF_STATE : INTEGER is 8 
	TVIF_TEXT : INTEGER is 1 
	TVIS_DROPHILITED : INTEGER is 8 
	TVIS_EXPANDED : INTEGER is 32 
	TVIS_SELECTED : INTEGER is 2 
	TVIS_STATEIMAGEMASK : INTEGER is 61440 
	TVM_DELETEITEM : INTEGER is 4353 
	TVM_ENSUREVISIBLE : INTEGER is 4372 
	TVM_EXPAND : INTEGER is 4354 
	TVM_GETBKCOLOR : INTEGER is 4383 
	TVM_GETCOUNT : INTEGER is 4357 
	TVM_GETIMAGELIST : INTEGER is 4360 
	TVM_GETITEMHEIGHT : INTEGER is 4380 
	TVM_GETITEMRECT : INTEGER is 4356 
	TVM_GETNEXTITEM : INTEGER is 4362 
	TVM_GETTEXTCOLOR : INTEGER is 4384 
	TVM_GETTOOLTIPS : INTEGER is 4377 
	TVM_GETVISIBLECOUNT : INTEGER is 4368 
	TVM_HITTEST : INTEGER is 4369 
	TVM_SELECTITEM : INTEGER is 4363 
	TVM_SETBKCOLOR : INTEGER is 4381 
	TVM_SETIMAGELIST : INTEGER is 4361 
	TVM_SETINSERTMARK : INTEGER is 4378 
	TVM_SETTEXTCOLOR : INTEGER is 4382 
	TVN_BEGINDRAGA : INTEGER is -407 
	TVN_BEGINDRAGW : INTEGER is -456 
	TVN_BEGINRDRAGA : INTEGER is -408 
	TVN_BEGINRDRAGW : INTEGER is -457 
	TVN_FIRST : INTEGER is -400 
	TVN_ITEMEXPANDINGA : INTEGER is -405 
	TVN_ITEMEXPANDINGW : INTEGER is -454 
	TVN_SELCHANGEDA : INTEGER is -402 
	TVN_SELCHANGEDW : INTEGER is -451 
	TVN_SELCHANGINGA : INTEGER is -401 
	TVN_SELCHANGINGW : INTEGER is -450 
	TVS_DISABLEDRAGDROP : INTEGER is 16 
	TVS_FULLROWSELECT : INTEGER is 4096 
	TVS_HASBUTTONS : INTEGER is 1 
	TVS_HASLINES : INTEGER is 2 
	TVS_LINESATROOT : INTEGER is 4 
	TVS_NOTOOLTIPS : INTEGER is 128 
	TVS_SHOWSELALWAYS : INTEGER is 32 
	TVSIL_NORMAL : INTEGER is 0 
	TVSIL_STATE : INTEGER is 2 
	UIS_INITIALIZE : INTEGER is 3 
	VER_PLATFORM_WIN32_CE : INTEGER is 3 
	VER_PLATFORM_WIN32_NT : INTEGER is 2 
	VER_PLATFORM_WIN32_WINDOWS : INTEGER is 1 
	VER_PLATFORM_WIN32s : INTEGER is 0 
	VERTRES : INTEGER is 10 
	VK_ADD : INTEGER is 107 
	VK_APP1 : INTEGER is 193 
	VK_APP2 : INTEGER is 194 
	VK_APP3 : INTEGER is 195 
	VK_APP4 : INTEGER is 196 
	VK_APP5 : INTEGER is 197 
	VK_APP6 : INTEGER is 198 
	VK_BACK : INTEGER is 8 
	VK_CAPITAL : INTEGER is 20 
	VK_CONTROL : INTEGER is 17 
	VK_DECIMAL : INTEGER is 110 
	VK_DELETE : INTEGER is 46 
	VK_DIVIDE : INTEGER is 111 
	VK_DOWN : INTEGER is 40 
	VK_END : INTEGER is 35 
	VK_ESCAPE : INTEGER is 27 
	VK_F1 : INTEGER is 112 
	VK_F10 : INTEGER is 121 
	VK_F11 : INTEGER is 122 
	VK_F12 : INTEGER is 123 
	VK_F2 : INTEGER is 113 
	VK_F3 : INTEGER is 114 
	VK_F4 : INTEGER is 115 
	VK_F5 : INTEGER is 116 
	VK_F6 : INTEGER is 117 
	VK_F7 : INTEGER is 118 
	VK_F8 : INTEGER is 119 
	VK_F9 : INTEGER is 120 
	VK_HOME : INTEGER is 36 
	VK_INSERT : INTEGER is 45 
	VK_LBUTTON : INTEGER is 1 
	VK_LEFT : INTEGER is 37 
	VK_MBUTTON : INTEGER is 4 
	VK_MENU : INTEGER is 18 
	VK_MULTIPLY : INTEGER is 106 
	VK_NEXT : INTEGER is 34 
	VK_NUMLOCK : INTEGER is 144 
	VK_NUMPAD0 : INTEGER is 96 
	VK_NUMPAD1 : INTEGER is 97 
	VK_NUMPAD2 : INTEGER is 98 
	VK_NUMPAD3 : INTEGER is 99 
	VK_NUMPAD4 : INTEGER is 100 
	VK_NUMPAD5 : INTEGER is 101 
	VK_NUMPAD6 : INTEGER is 102 
	VK_NUMPAD7 : INTEGER is 103 
	VK_NUMPAD8 : INTEGER is 104 
	VK_NUMPAD9 : INTEGER is 105 
	VK_PRIOR : INTEGER is 33 
	VK_RBUTTON : INTEGER is 2 
	VK_RETURN : INTEGER is 13 
	VK_RIGHT : INTEGER is 39 
	VK_SCROLL : INTEGER is 145 
	VK_SEPARATOR : INTEGER is 108 
	VK_SHIFT : INTEGER is 16 
	VK_SPACE : INTEGER is 32 
	VK_SUBTRACT : INTEGER is 109 
	VK_TAB : INTEGER is 9 
	VK_UP : INTEGER is 38 
	WC_LISTVIEW : STRING is "SysListView32" 
	WC_TABCONTROL : STRING is "SysTabControl32" 
	WC_TREEVIEW : STRING is "SysTreeView32" 
	WH_GETMESSAGE : INTEGER is 3 
	WH_MSGFILTER : INTEGER is -1 
	WHEEL_DELTA : INTEGER is 120 
	WHEEL_PAGESCROLL : INTEGER is -1 
	
end 

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
