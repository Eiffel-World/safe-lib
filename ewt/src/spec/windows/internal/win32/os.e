indexing
	description: "Windows Operating System specific constants and functions"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	OS

inherit

	OS_CONSTANTS

	WINGDI_FUNCTIONS
	
	WINBASE_FUNCTIONS
	
	WINUSER_FUNCTIONS

	WINNLS_FUNCTIONS
	
	WINREG_FUNCTIONS
	
	COMMDLG_FUNCTIONS
	
	IMM_FUNCTIONS
	
	OLE2_FUNCTIONS
	
	SHELLAPI_FUNCTIONS
	
	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		end
	
	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		end
	
creation
	make
	
feature {SHARED_OS} -- Initialization

	make is
			-- Initialize.
		local
			info : OSVERSIONINFO
			res : INTEGER
			
		do
		-- FIXME
		--		/* Load the SWT library */
		--		Library.loadLibrary ("swt"); //$NON-NLS-1$
		--
		--		/*
		--		* Try the UNICODE version of GetVersionEx first
		--		* and then the ANSI version.  The UNICODE version
		--		* is present on all versions of Windows but is not
		--		* implemented on Win95/98/ME.
		--		* 
		--		* NOTE: The value of OSVERSIONINFO.sizeof cannot
		--		* be static final because it relies on the Windows
		--		* platform version to be initialized and IsUnicode
		--		* has not been calculated.  It must be initialized
		--		* here, after the platform is determined in order
		--		* for the value to be correct.
		--		*/
		--		OSVERSIONINFO info = new OSVERSIONINFO ();
			create info.make_new_unshared
			
		--		
		--		// TEMPORARY CODE
		--		String MBCS = System.getProperty ("MBCS"); //$NON-NLS-1$
		--		if (MBCS != null) {
		--			info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofA;
		--			OS.GetVersionExA (info);
			info.set_dwosversioninfosize (info.sizeof)
			res := get_version_ex_a (info.item)
		--		} else {
		--			info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofW;
		--			if (!OS.GetVersionExW (info)) {
		--				info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofA;
		--				OS.GetVersionExA (info);
		--			}
		--		}
		--		OSVERSIONINFO.sizeof = info.dwOSVersionInfoSize;
			is_win32s := info.dwplatformid = Ver_platform_win32s
			is_win95 := info.dwplatformid = Ver_platform_win32_windows
			is_winnt := info.dwplatformid = Ver_platform_win32_nt
			is_wince := info.dwplatformid = Ver_platform_win32_ce
			win32_major := info.dwmajorversion
			win32_minor := info.dwminorversion
		--		
		--		IsWin32s = info.dwPlatformId == VER_PLATFORM_WIN32s;
		--		IsWin95 = info.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS;
		--		IsWinNT = info.dwPlatformId == VER_PLATFORM_WIN32_NT;
		--		IsWinCE = info.dwPlatformId == VER_PLATFORM_WIN32_CE;
		--		IsSP = IsSP();
		--		IsPPC = IsPPC();
		--		IsHPC = IsWinCE && !IsPPC && !IsSP;	
		--		WIN32_MAJOR = info.dwMajorVersion;
		--		WIN32_MINOR = info.dwMinorVersion;
		--		
		--		// TEMPORARY CODE
		--		if (MBCS != null) {
		--			IsUnicode = false;
		--			System.out.println ("*** SWT - Warning: Unicode disabled"); //$NON-NLS-1$
		--		} else {
		--			IsUnicode = !IsWin32s && !IsWin95;
		--		}
		--
		--		/* Get the DBCS flag */
		--		int index = 0;
		--		while (index <= 0xFF) {
		--			if (OS.IsDBCSLeadByte ((byte) index)) break;
		--			index++;
		--		}
		--		IsDBLocale = index <= 0xFF;
		--	}
		init_constants
	end
	
	init_constants is
		do
			if is_wince then
				sys_color_index_flag := STRING_.hexadecimal_to_integer ("40000000")
			end
			color_3ddkshadow := UINT32_.u_or (string_.hexadecimal_to_integer ("15"), sys_color_index_flag);
			color_3dface := UINT32_.u_or (string_.hexadecimal_to_integer ("f"), sys_color_index_flag);
			color_3dhighlight := UINT32_.u_or (string_.hexadecimal_to_integer ("14"), sys_color_index_flag);
			color_3dhilight := UINT32_.u_or (string_.hexadecimal_to_integer ("14"), sys_color_index_flag);
			color_3dlight := UINT32_.u_or (string_.hexadecimal_to_integer ("16"), sys_color_index_flag);
			color_3dshadow := UINT32_.u_or (string_.hexadecimal_to_integer ("10"), sys_color_index_flag);
			color_activecaption := UINT32_.u_or (string_.hexadecimal_to_integer ("2"), sys_color_index_flag);
			color_btnface := UINT32_.u_or (string_.hexadecimal_to_integer ("f"), sys_color_index_flag);
			color_btnhighlight := UINT32_.u_or (string_.hexadecimal_to_integer ("14"), sys_color_index_flag);
			color_btnshadow := UINT32_.u_or (string_.hexadecimal_to_integer ("10"), sys_color_index_flag);
			color_btntext := UINT32_.u_or (string_.hexadecimal_to_integer ("12"), sys_color_index_flag);
			color_captiontext := UINT32_.u_or (string_.hexadecimal_to_integer ("9"), sys_color_index_flag);
			color_gradientactivecaption := UINT32_.u_or (string_.hexadecimal_to_integer ("1b"), sys_color_index_flag);
			color_gradientinactivecaption := UINT32_.u_or (string_.hexadecimal_to_integer ("1c"), sys_color_index_flag);
			color_highlight := UINT32_.u_or (string_.hexadecimal_to_integer ("d"), sys_color_index_flag);
			color_highlighttext := UINT32_.u_or (string_.hexadecimal_to_integer ("e"), sys_color_index_flag);
			color_inactivecaption := UINT32_.u_or (string_.hexadecimal_to_integer ("3"), sys_color_index_flag);
			color_inactivecaptiontext := UINT32_.u_or (string_.hexadecimal_to_integer ("13"), sys_color_index_flag);
			color_infobk := UINT32_.u_or (string_.hexadecimal_to_integer ("18"), sys_color_index_flag);
			color_infotext := UINT32_.u_or (string_.hexadecimal_to_integer ("17"), sys_color_index_flag);
			color_menu := UINT32_.u_or (string_.hexadecimal_to_integer ("4"), sys_color_index_flag);
			color_menutext := UINT32_.u_or (string_.hexadecimal_to_integer ("7"), sys_color_index_flag);
			color_scrollbar := UINT32_.u_or (string_.hexadecimal_to_integer ("0"), sys_color_index_flag);
			color_window := UINT32_.u_or (string_.hexadecimal_to_integer ("5"), sys_color_index_flag);
			color_windowframe := UINT32_.u_or (string_.hexadecimal_to_integer ("6"), sys_color_index_flag);
			color_windowtext := UINT32_.u_or (string_.hexadecimal_to_integer ("8"), sys_color_index_flag);
		end
		

feature -- Access

	is_win32s : BOOLEAN

	is_win95 : BOOLEAN

	is_winnt : BOOLEAN

	is_WinCE : BOOLEAN

	is_PPC	: BOOLEAN

	is_HPC : BOOLEAN

	is_SP : BOOLEAN

	is_DB_locale : BOOLEAN

	is_unicode : BOOLEAN

	WIN32_MAJOR : INTEGER

	WIN32_MINOR : INTEGER

	sys_color_index_flag : INTEGER
	
	color_3ddkshadow : INTEGER
	color_3dface : INTEGER
	color_3dhighlight : INTEGER
	color_3dhilight : INTEGER
	color_3dlight : INTEGER
	color_3dshadow : INTEGER
	color_activecaption : INTEGER
	color_btnface : INTEGER
	color_btnhighlight : INTEGER
	color_btnshadow : INTEGER
	color_btntext : INTEGER
	color_captiontext : INTEGER
	color_gradientactivecaption : INTEGER
	color_gradientinactivecaption : INTEGER
	color_highlight : INTEGER
	color_highlighttext : INTEGER
	color_inactivecaption : INTEGER
	color_inactivecaptiontext : INTEGER
	color_infobk : INTEGER
	color_infotext : INTEGER
	color_menu : INTEGER
	color_menutext : INTEGER
	color_scrollbar : INTEGER
	color_window : INTEGER
	color_windowframe : INTEGER
	color_windowtext : INTEGER
	
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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class OS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
