indexing
	description: "Windows implementation of ABSTRACT_DECORATIONS"
	date: "$Date: 2004/06/29 19:57:56 $";
	revision: "$Revision: 1.8 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DECORATIONS

inherit
	CANVAS
		redefine
			create_widget,
			widget_ext_style,
			widget_style,
			create_handle
		end
		
	ABSTRACT_DECORATIONS
		undefine
			release_handle,
			destroy_widget,
			release_widget
		end
	
	SHARED_OS
		export
			{NONE} all
		end
	
feature {NONE} -- Initialization

	make is
			-- Initialize
		do
			do_nothing
		end
		

feature -- Access

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

	restore_focus : BOOLEAN is
		do
		
	--	if (savedFocus != null && savedFocus.isDisposed ()) savedFocus = null;
	--	if (savedFocus != null && savedFocus.setSavedFocus ()) return true;
	--	/*
	--	* This code is intentionally commented.  When no widget
	--	* has been given focus, some platforms give focus to the
	--	* default button.  Windows doesn't do this.
	--	*/
	--//	if (defaultButton != null && !defaultButton.isDisposed ()) {
	--//		if (defaultButton.setFocus ()) return true;
	--//	}
	--	return false;
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	create_handle is
		do
			Precursor
			if parent = Void then
				do_nothing
			else
--FIXME
--				set_parent
--				set_system_menu
			end
		end
		
	create_widget is
		do
			Precursor
			sw_flags := os.SW_SHOWNOACTIVATE
			h_accel := -1;
		end

	widget_ext_style : INTEGER is
		do
			Result := UINT32_.u_and (Precursor, UINT32_.u_not (os.Ws_ex_clientedge))
			if UINT32_.u_and (style, swt.style_no_trim) /= 0 then
				do_nothing
			else
				if UINT32_.u_and (style, swt.style_tool) /= 0 then
					Result := UINT32_.u_or (Result, os.Ws_ex_toolwindow)
				end
				if UINT32_.u_and (style, swt.style_resize) /= 0 then
					do_nothing
				else
					if UINT32_.u_and (style, swt.style_border) /= 0 then
						Result := UINT32_.u_or (Result, os.Ws_ex_dlgmodalframe)
					end
				end
			end
		end
		

	widget_style : INTEGER is
		do
	--		/* 
	--		* Set WS_POPUP and clear WS_VISIBLE and WS_TABSTOP.
	--		* NOTE: WS_TABSTOP is the same as WS_MAXIMIZEBOX so
	--		* it cannot be used to do tabbing with decorations.
	--		*/
			
	--		int bits = super.widgetStyle () | OS.WS_POPUP;
	--		bits &= ~(OS.WS_VISIBLE | OS.WS_TABSTOP);
			Result := UINT32_.u_or (Precursor, Os.Ws_popup)
			Result := UINT32_.u_and (Result, UINT32_.u_not (UINT32_.u_or (os.Ws_visible, os.Ws_tabstop)))
			
	--		/* Set the title bits and no-trim bits */
	--		bits &= ~OS.WS_BORDER;
	--		if ((style & SWT.NO_TRIM) != 0) return bits;
	--		if ((style & SWT.TITLE) != 0) bits |= OS.WS_CAPTION;

			Result := UINT32_.u_and (Result, UINT32_.u_not (os.Ws_border))
			if UINT32_.u_and (style, swt.style_no_trim) /= 0 then
				do_nothing
			else
				if UINT32_.u_and (style, swt.style_title) /= 0 then
					Result := UINT32_.u_or (Result, os.Ws_caption)
				end
		--		/* Set the min and max button bits */
		--		if ((style & SWT.MIN) != 0) bits |= OS.WS_MINIMIZEBOX;
		--		if ((style & SWT.MAX) != 0) bits |= OS.WS_MAXIMIZEBOX;
		
				if UINT32_.u_and (style, swt.style_min) /= 0 then
					Result := UINT32_.u_or (Result, os.Ws_minimizebox)
				end
				if UINT32_.u_and (style, swt.style_max) /= 0 then
					Result := UINT32_.u_or (Result, os.ws_maximizebox)
				end
		--		
		--		/* Set the resize, dialog border or border bits */
		--		if ((style & SWT.RESIZE) != 0) {
		--			/*
		--			* Note on WinCE PPC.  SWT.RESIZE is used to resize
		--			* the Shell according to the state of the IME.
		--			* It does not set the WS_THICKFRAME style.
		--			*/
		--			if (!OS.IsPPC) bits |= OS.WS_THICKFRAME;	
		--		} else {
		--			if ((style & SWT.BORDER) == 0) bits |= OS.WS_BORDER;
		--		}
		
				if UINT32_.u_and (style, swt.Style_resize) /= 0 then
					do_nothing
				else
					if UINT32_.u_and (style, swt.Style_border) = 0 then
						Result := UINT32_.u_or (Result, os.ws_border)
					end
				end
		--	
		--		/* Set the system menu and close box bits */
		--		if (!OS.IsPPC && !OS.IsSP) {
		--			if ((style & SWT.CLOSE) != 0) bits |= OS.WS_SYSMENU;
		--		}

				if UINT32_.u_and (style, swt.style_close) /= 0 then
					Result := UINT32_.u_or (Result, os.Ws_sysmenu)
				end
		--		return bits;
		--	}				
			end
		end

feature {NONE} -- Attributes

	h_accel : INTEGER
	
	sw_flags : INTEGER

invariant
	invariant_clause: -- Your invariant here

end -- class DECORATIONS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
