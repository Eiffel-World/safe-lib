indexing
	description: "Windows implementation of ABSTRACT_DECORATIONS"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.9 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DECORATIONS

inherit
	CANVAS
		redefine
			get_bounds,
			create_widget,
			widget_ext_style,
			widget_style,
			create_handle,
			set_visible,
			menu_shell,
			compute_tab_root,
			compute_tab_group,
			is_tab_group,
			window_proc,
			do_WM_WINDOWPOSCHANGING,
			do_WM_NCACTIVATE,
			do_WM_ACTIVATE,
			do_WM_CLOSE
		end
		
	ABSTRACT_DECORATIONS
		undefine
			release_handle
		redefine
			saved_focus
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

	get_bounds : RECTANGLE is
		local
			placement : WINDOWPLACEMENT
			res : INTEGER
			width, height : INTEGER
		do
			check_widget
			if not os.is_wince then
				if os.is_iconic (handle) /= 0 then
					create placement.make_new_unshared
					placement.set_length (placement.sizeof)
					res := os.get_window_placement (handle, placement.item)
					width := placement.right - placement.left
					height := placement.bottom - placement.top
					create Result.make (placement.left, placement.top, width, height)
				end
			else
				Result := Precursor
			end
		end
		
feature {CONTROL} -- Access

	menu_shell : DECORATIONS is
		do
			Result := Current
		end

	image : IMAGE 
		
	menu_bar : MENU
	menus : ARRAY[MENU]
	saved_focus : CONTROL
	default_button : BUTTON
	save_default : BUTTON
	
	items : ARRAY[ABSTRACT_MENU_ITEM]
	sw_flags : INTEGER
	h_accel : INTEGER
	n_accel : INTEGER
	h_icon : INTEGER

		
feature -- Measurement

feature -- Comparison

feature -- Status report

	is_tab_group : BOOLEAN is
		do
			Result := True
		end
	
feature -- Status setting

	set_visible (visible : BOOLEAN) is
		local
			res : INTEGER
		do
			check_widget
			if visible = (os.is_window_visible (handle) /= 0) then
				do_nothing
			else
				if visible then
					send_event_by_type (swt.event_show)
				--		if (isDisposed ()) return;
				--		if (OS.IsHPC) {
				--			if (menuBar != null) {
				--				int hwndCB = menuBar.hwndCB;
				--				OS.CommandBar_DrawMenuBar (hwndCB, 0);
				--			}
				--		}
				--		if (OS.IsWinCE) {
				--			OS.ShowWindow (handle, OS.SW_SHOW);
				--		} else {
				--			if (menuBar != null) {
				--				Display display = getDisplay ();
				--				display.removeBar (menuBar);
				--				OS.DrawMenuBar (handle);
				--			}
							res := os.show_window (handle, sw_flags)
				--		}
						res := os.update_window (handle)
				else
						if not os.is_wince then
							if os.is_iconic (handle) /= 0 then
								sw_flags := os.SW_SHOWMINNOACTIVE
							else
								if os.is_zoomed (handle) /= 0 then
									sw_flags := os.SW_SHOWMAXIMIZED
								else
									if handle = os.get_active_window then
										sw_flags := os.SW_RESTORE
									else
										sw_flags := os.SW_SHOWNOACTIVATE
									end
								end
							end						
						end
						res := os.show_window (handle, os.SW_HIDE)
						send_event_by_type (swt.Event_hide);
				--	}
				end
			end			
		end
		
feature -- Cursor movement

feature {CONTROL} -- Element change

	save_focus is
		local
			control : CONTROL
		do
			control := get_display.get_focus_control
			if control /= Void then
				set_saved_focus_control (control)
			end
		end
		
	set_saved_focus_control (control : CONTROL) is
		do
			if control = Current then
				saved_focus := Void
			else
				if Current /= control.menu_shell then
					do_nothing
				else
					saved_focus := control
				end
			end
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature {CONTROL} -- Miscellaneous

	compute_tab_root : CONTROL is
		do
			Result := Current
		end
	
	compute_tab_group : CONTROL is
		do
			Result := Current
		end
		
	window_proc (msg: INTEGER; wparam: INTEGER; lparam: INTEGER) : INTEGER is
		do
			if msg = os.WM_APP or else msg = os.WM_APP + 1 then
				if (h_accel = -1) then
					create_accelerators
				end
				if msg = os.WM_APP then
					Result := n_accel
				else
					Result := h_accel
				end
			else
				Result := Precursor (msg, wparam, lparam)
			end
		end
		
	
feature -- Basic operations

	restore_focus : BOOLEAN is
		do
			if saved_focus /= Void and then saved_focus.is_resource_disposed  then
				saved_focus := Void
			end
			if saved_focus /= Void and then saved_focus.set_saved_focus then
				do_nothing
			else
				--	/*
				--	* This code is intentionally commented.  When no widget
				--	* has been given focus, some platforms give focus to the
				--	* default button.  Windows doesn't do this.
				--	*/
				--//	if (defaultButton != null && !defaultButton.isDisposed ()) {
				--//		if (defaultButton.setFocus ()) return true;
				--//	}
				Result := False
			end
		end

	bring_to_top is
		local
			res : INTEGER
		do
			res := os.bring_window_to_top (handle)
		end

feature {CONTROL} -- Basic operations

	do_WM_ACTIVATE (wparam, lparam : INTEGER) : LRESULT is
		local
			shell : SHELL
		do
			Result := Precursor (wparam, lparam)
			if Result /= Void then
				do_nothing
			else
				if UINT32_.u_and (wparam, 0xFFFF) /= 0 then
					if UINT32_.right_shift (wparam, 16) /= 0 then
						do_nothing
					else
						send_event_by_type (swt.Event_activate)
						if is_resource_disposed or else restore_focus or else traverse_group (true) then
							create Result
							Result.set_value (0)
						end
					end
				else
					shell := get_shell
					shell.set_active_control (Void)
					if is_resource_disposed then
						create Result
						Result.set_value (0)
					else
						send_event_by_type (swt.Event_deactivate)
						if is_resource_disposed then
							create Result
							Result.set_value (0)
						else
							save_focus
						end
					end
				end
			end
		end
		
	do_WM_CLOSE (wparam, lparam : INTEGER) : LRESULT is
		local
			event : EVENT
		do
			Result := Precursor (wparam, lparam)
			if result /= Void then
				do_nothing
			else
				create event.make
				send_event_by_type_and_event (swt.Event_close,event)
				if event.doit and then not is_resource_disposed then
					dispose_resource
				else
					create Result
					Result.set_value (0)
				end
			end
		end
		
	do_WM_NCACTIVATE (wparam: INTEGER; lparam: INTEGER) : LRESULT is
		local
			display : DISPLAY
		do
			Result := Precursor (wparam, lparam)	
			if Result /= Void then
				do_nothing
			else
				if wparam = 0 then
					display := get_display
					if display.lock_active_window then
						create Result
						Result.set_value (0)
					end
				end
			end
		end

	do_WM_WINDOWPOSCHANGING (wparam: INTEGER; lparam: INTEGER) : LRESULT is
		local
			windowpos : WINDOWPOS
			windowpos_pointer : XS_C_INT32
			display : DISPLAY
		do
			Result := Precursor (wparam, lparam)
			if Result /= Void then
				do_nothing
			else
				display := get_display
				if (display.lock_active_window) then
					create windowpos_pointer.make
					windowpos_pointer.put (lparam)
					create windowpos.make_shared (windowpos_pointer.as_pointer)
					windowpos.set_flags (UINT32_.u_or (windowpos.flags, os.SWP_NOZORDER))
				end
			end
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
	
	create_accelerators is
		do
			--FIXME
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
					Result := UINT32_.u_or (Result, os.Ws_thickframe)
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
	
invariant
	invariant_clause: -- Your invariant here

end -- class DECORATIONS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
