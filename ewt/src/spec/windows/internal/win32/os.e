indexing
	description: "Windows Operating System specific constants and functions"
	date: "$Date: 2004/06/29 16:47:05 $";
	revision: "$Revision: 1.3 $";
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
	
creation
	make
	
feature {SHARED_OS} -- Initialization

	make is
			-- Initialize.
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
		--		
		--		// TEMPORARY CODE
		--		String MBCS = System.getProperty ("MBCS"); //$NON-NLS-1$
		--		if (MBCS != null) {
		--			info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofA;
		--			OS.GetVersionExA (info);
		--		} else {
		--			info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofW;
		--			if (!OS.GetVersionExW (info)) {
		--				info.dwOSVersionInfoSize = OSVERSIONINFO.sizeofA;
		--				OS.GetVersionExA (info);
		--			}
		--		}
		--		OSVERSIONINFO.sizeof = info.dwOSVersionInfoSize;
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
