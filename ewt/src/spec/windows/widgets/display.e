indexing
	description: "Windows implementation of ABSTRACT_DISPLAY"
	date: "$Date: 2004/06/29 19:57:56 $";
	revision: "$Revision: 1.11 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	DISPLAY

inherit
	ABSTRACT_DISPLAY

	DEVICE
		redefine
			init
		end
	
	WNDPROC_CALLBACKABLE
		rename
			call_window_procedure as window_proc
		end

	HOOKPROC_CALLBACKABLE
		rename
			call_hook_procedure as msg_filter_proc
		end
		
	MSGPROC_CALLBACKABLE
		rename
			call_message_procedure as message_proc
		end
	
	XS_IMPORTED_UINT32_ROUTINES

	SHARED_SWT
		export
			{NONE} all
		end
	
	SHARED_WIDGET_TABLE
		export
			{NONE} all
		end
	
creation
	make, make_by_device_data
	
feature {NONE} -- Initialization

	make is
			-- Default initialization.
		do
			make_by_device_data (Void)
		end

feature -- Access

	find_control (handle : POINTER) : CONTROL is
		local
			done : BOOLEAN
			l_handle : POINTER
		do
			if handle /= default_pointer then
				from
					l_handle := handle
				until
					done or else l_handle = default_pointer
				loop
					Result := widget_table.item (handle)
					if Result /= Void and then Result.handle = handle then
						done := True
					else
						l_handle := os.get_parent (handle)
					end
				end
			end
		end
		

	get_current : DISPLAY is
			-- Returns the display which the currently running process.
		do
			-- FIXME
--			public static synchronized Display getCurrent () {
--				return findDisplay (Thread.currentThread ());
--			}
		end

	get_default : DISPLAY is
			-- Returns the default display. 
			-- One is created if it did not already exist.
		do
			-- FIXME
--			public static synchronized Display getDefault () {
--				if (Default == null) Default = new Display ();
--					return Default;
--				}
		end

feature {DISPLAY} -- Access

	trim_enabled : BOOLEAN
		-- static

feature {SCROLLABLE} -- Access

	window_class : TCHAR

feature {CONTROL} -- Access

	system_font : POINTER is
			-- System font handle.
		local
			a_font_handle : POINTER
		do
			if system_fonts /= Void then
				if not system_fonts.is_empty then
					a_font_handle := system_fonts.item (system_fonts.upper)
				end
			end
			if a_font_handle = default_pointer then
				a_font_handle := os.get_stock_object_external (os.Default_gui_font)
			end
			if a_font_handle = default_pointer then
				a_font_handle := os.get_stock_object_external (os.System_font)
			end
			Result := a_font_handle
		ensure
			result_defined : Result /= Void
		end

feature {NONE} -- Access

	
	window_dispatcher_instance : WNDPROC_DISPATCHER_INSTANCE
	window_proc_pointer : POINTER
	
	thread_id : INTEGER	
	process_id : INTEGER

	window_name : STRING is "SWT_Window"

	hwnd_message : POINTER
		-- message only window handle
		
	message_proc_pointer : POINTER
		-- message only procedure

	message_dispatcher_instance : MSGPROC_DISPATCHER_INSTANCE
	msg_filter_proc_pointer : POINTER

	hook_dispatcher_instance : HOOKPROC_DISPATCHER_INSTANCE	
	h_hook : POINTER

	hook_msg : MSG
	
	current_message : MSG is
			-- original SWT: msg
		once
			create Result.make_new_unshared
		end
		

feature {NONE} -- Keyboard and Mouse State

	lock_active_window : BOOLEAN
	last_virtual : BOOLEAN
	last_null : BOOLEAN
	last_key : INTEGER
	last_ascii : INTEGER
	
	last_mouse : INTEGER
	
	keyboard : ARRAY[INTEGER] -- byte [] keyboard = new byte [256];
	accel_key_hit : BOOLEAN
	mnemonic_key_hit : BOOLEAN
		
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

	read_and_dispatch : BOOLEAN is
			-- Reads an event from the operating system's event queue, dispatches it appropriately.
		local
			res : INTEGER
		do
			
			-- check_device  --	checkDevice ();
			
			-- draw_menu_bars	--	drawMenuBars ();
			-- run_popups		--	runPopups ();
			
			if os.peek_message_a (current_message.item, default_pointer, 0, 0, os.PM_REMOVE) /= 0 then
				if not is_wake_message (current_message) then
					if not filter_message (current_message) then
						res := os.translate_message (current_message.item)
						res := os.dispatch_message_a (current_message.item)
					end
					run_deferred_events
					Result := True
				end
			end
			if not Result then
				run_async_messages
			end
		end

	sleep : BOOLEAN is
			-- Causes the user-interface process to sleep (that is, to be put in a state where it does not consume CPU cycles)
			-- until an event is received or it is otherwise awakened.
		do
			-- FIXME
		end

	release is
			-- Releases any internal resources back to the operating system.
		do
			-- FIXME
		end

	run_async_messages is
			-- Run asynchronous messages
			-- NOTE: does nothing since EWT currently does not support threads
		do
			--| FIXME
			do_nothing
		end

	run_deferred_events is
		do
	--boolean runDeferredEvents () {
	--	/*
	--	* Run deferred events.  This code is always
	--	* called in the Display's thread so it must
	--	* be re-enterant but need not be synchronized.
	--	*/
	--	while (eventQueue != null) {
	--		
	--		/* Take an event off the queue */
	--		Event event = eventQueue [0];
	--		if (event == null) break;
	--		int length = eventQueue.length;
	--		System.arraycopy (eventQueue, 1, eventQueue, 0, --length);
	--		eventQueue [length] = null;
	--
	--		/* Run the event */
	--		Widget widget = event.widget;
	--		if (widget != null && !widget.isDisposed ()) {
	--			Widget item = event.item;
	--			if (item == null || !item.isDisposed ()) {
	--				widget.sendEvent (event);
	--			}
	--		}
	--
	--		/*
	--		* At this point, the event queue could
	--		* be null due to a recursive invokation
	--		* when running the event.
	--		*/
	--	}
	--
	--	/* Clear the queue */
	--	eventQueue = null;
	--	return true;
	--}
		end
	run_timer (id : INTEGER) is
			-- run timer identified by `id'
		do
			--| FIXME
		end

	update_font is
			-- update font
		do
			--| FIXME
		end
	
	get_modal_shell : SHELL is
			-- get modal shell
		do
			--| FIXME
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	init is
		local
			l_window_class_name : STRING
			h_instance : POINTER
			lp_wndclass : WNDCLASS
			cursor_index : XS_C_INT32
			msgproc_pointer : XS_C_POINTER
			hclass : INTEGER
			l_system_font : POINTER
			info : NONCLIENTMETRICS
			swl_result : INTEGER
		do
			Precursor {DEVICE}

			--	/* Create the callbacks */

			create window_dispatcher_instance.make (Current)
			window_proc_pointer := window_dispatcher_instance.c_dispatcher
			
			--	/* Remember the current process and thread */
			thread_id := Os.get_current_thread_id_external
			process_id := Os.get_current_process_id_external

			--	/* Use the character encoding for the default locale */
			--	windowClass = new TCHAR (0, WindowName + WindowClassCount++, true);
			create l_window_class_name.make_from_string (window_name)
			l_window_class_name.append_integer (window_class_count)
			increment_window_class_count
			create window_class.make (l_window_class_name.count)
			window_class.from_string (l_window_class_name)

			--	/* Register the SWT window class */
--			h_heap := OS.get_process_heap_external
			h_instance := OS.get_module_handle_a_external (default_pointer)
		
			create lp_wndclass.make_new_unshared
--			lp_wndclass.set_cbsize (lp_wndclass.sizeof)
			lp_wndclass.set_hinstance (h_instance)
			lp_wndclass.set_lpfnwndproc (window_proc_pointer)
			lp_wndclass.set_style (UINT32_.u_or (OS.Cs_bytealignwindow, os.Cs_dblclks))
			create cursor_index.make
			cursor_index.put (os.Idc_arrow)
			lp_wndclass.set_hcursor (os.load_cursor_a_external (default_pointer, cursor_index.as_pointer))
			lp_wndclass.set_lpszclassname (window_class.handle)
			hclass := os.register_class_a_external (lp_wndclass.item)
			check
				window_class_registered: hclass /= 0
			end

			--	/* Initialize the system font */
			l_system_font := default_pointer

			create info.make_new_unshared
			info.set_cbsize (info.sizeof)
			if Os.system_parameters_info_a_external (os.Spi_getnonclientmetrics, 0, info.item, 0) /= 0 then
				l_system_font := os.create_font_indirect_a_external (info.lfMessagefont.item)
			end
			if l_system_font = default_pointer then
				l_system_font := os.get_stock_object_external (os.Default_gui_font)
			end
			if l_system_font = default_pointer then
				l_system_font := os.get_stock_object_external (os.System_font)
			end
			if l_system_font /= default_pointer then
				create system_fonts.make (1,1)
				system_fonts.put (l_system_font, 1)
			end

			--	/* Create the message only HWND */

			hwnd_message := os.create_window_ex_a_external (
				0, --dwexstyle: INTEGER; 
				window_class.handle, --lpclassname: POINTER;
				default_pointer, --lpwindowname: POINTER; 
				os.Ws_overlapped,  --dwstyle: INTEGER; 
				0, --x: INTEGER; 
				0, --y: INTEGER; 
				0, --nwidth: INTEGER; 
				0, --nheight: INTEGER; 
				default_pointer, --hwndparent: POINTER; 
				default_pointer, --hmenu: POINTER; 
				h_instance, --hinstance: POINTER; 
				default_pointer --lpparam: POINTER
				)

			create message_dispatcher_instance.make (Current)
			create msgproc_pointer.make
			msgproc_pointer.put (message_dispatcher_instance.c_dispatcher)
			swl_result := os.set_window_long_a_external (hwnd_message, os.Gwl_wndproc, msgproc_pointer.as_integer)
	
			--	/* Create the message filter hook */
			
			--	if (!OS.IsWinCE) {
			--		msgFilterCallback = new Callback (this, "msgFilterProc", 3);
			--		msgFilterProc = msgFilterCallback.getAddress ();
			--		if (msgFilterProc == 0) error (SWT.ERROR_NO_MORE_CALLBACKS);
			--		hHook = OS.SetWindowsHookEx (OS.WH_MSGFILTER, msgFilterProc, 0, threadId);
			--	}
			create hook_dispatcher_instance.make (Current)
			msg_filter_proc_pointer := hook_dispatcher_instance.c_dispatcher
			h_hook := Os.set_windows_hook_ex_a_external (OS.wh_msgfilter, msg_filter_proc_pointer, default_pointer, thread_id)
	end
	
	create_os_device (a_device_data : DEVICE_DATA) is
			-- Creates the device in the operating system with `a_device_data'.
			-- If the device does not have a handle, this method may do nothing depending on the device.
		do	
				--	checkDisplay (thread = Thread.currentThread ());
			
			create_display (a_device_data)
				--	register (this); FIXME
				--	if (Default == null) Default = this; FIXME
			if default_display = Void then
				default_display_cell.put (Current)
			end
		end

	internal_new_gc (a_gc_data : GC_DATA) : POINTER is
			-- Allocate a new handle for a Graphical Context using `a_gc_data' if defined.
		local
			dc_handle : POINTER
			a_mask : INTEGER
		do
			dc_handle := os.get_dc_external (default_pointer)
			if dc_handle = default_pointer then
				swt.error (swt.Error_no_handles)
			else
				if a_gc_data /= Void then
					a_mask := UINT32_.u_or (swt.Style_left_to_right, swt.Style_right_to_left)
					if (UINT32_.u_and (a_gc_data.style, a_mask)) /= 0 then
						if (UINT32_.u_and (a_gc_data.style,swt.Style_right_to_left)) /= 0 then
							a_gc_data.set_layout (os.WS_EX_LAYOUTRTL)
						else
							a_gc_data.set_layout (0)
						end
					else
						a_gc_data.set_style (UINT32_.u_or (a_gc_data.style, swt.Style_left_to_right))
					end
					a_gc_data.set_device (Current)
					a_gc_data.set_font_handle (system_font)
				end
				Result := dc_handle
			end
		end

	internal_dispose_GC (a_gc_handle : POINTER; a_gc_data : GC_DATA )is
			-- Dispose a platform specific GC handle.
		local
			a_status : INTEGER
		do
			a_status := os.release_dc_external (default_pointer, a_gc_handle)
		end

	is_wake_message (a_message : MSG) : BOOLEAN is
		do
			Result := (a_message.hwnd = hwnd_message and then a_message.message = os.WM_NULL)
		end

	filter_message (a_message : MSG) : BOOLEAN is
		local
			message : INTEGER
			control : CONTROL
		do
			message := a_message.message
			if os.WM_KEYFIRST <= message and then message <= os.WM_KEYLAST then
				control := find_control (a_message.hwnd)
				if control /= Void then
					if translate_accelerator (a_message, control) 
								or else translate_mnemonic (a_message, control) 
								or else translate_traversal (a_message, control) then
						last_ascii := 0
						last_key := 0
						last_virtual := false
						last_null := false
						Result := True
					end
				end
			end
		end

	system_fonts : ARRAY [POINTER]
			-- System fonts.

	window_proc (hwnd : POINTER; msg, wparam, lparam : INTEGER) : INTEGER is
			-- window procedure called back by WIN32
		local
			control : CONTROL
		do
			if widget_table.count > 0 then
				control := widget_table.item (hwnd)
			end
			if control /= Void then
					Result := control.window_proc (msg, wparam, lparam)
			else
				Result := OS.def_window_proc_a_external (hwnd, msg, wParam, lParam);
			end
		end

	message_proc (hwnd : POINTER; msg, wparam, lparam : INTEGER) : INTEGER is
			-- message only window procedure called back by WIN32
		local
			shell : SHELL
		do
			--| FIXME
			if msg = OS.wm_activateapp then
				--			/*
				--			* Feature in Windows.  When multiple shells are
				--			* disabled and one of the shells has an enabled
				--			* dialog child and the user selects a disabled
				--			* shell that does not have the enabled dialog
				--			* child using the Task bar, Windows brings the
				--			* disabled shell to the front.  As soon as the
				--			* user clicks on the disabled shell, the enabled
				--			* dialog child comes to the front.  This behavior
				--			* is unspecified and seems strange.  Normally, a
				--			* disabled shell is frozen on the screen and the
				--			* user cannot change the z-order by clicking with
				--			* the mouse.  The fix is to look for WM_ACTIVATEAPP
				--			* and force the enabled dialog child to the front.
				--			* This is typically what the user is expecting.
				--			*/
				if wparam /= 0 then
					shell := get_modal_shell
					if shell /= Void then
						shell.bring_to_top
					end
				end
			elseif msg = OS.wm_endsession then
				if wparam /= 0 then
					dispose_resource
				end
			elseif msg = OS.wm_null or else msg = OS.wm_queryendsession then
				run_async_messages
			elseif msg = os.wm_queryendsession then
				do_nothing
				--| FIXME
				--			Event event = new Event ();
				--			sendEvent (SWT.Close, event);
				--			if (!event.doit) return 0;
			elseif msg = OS.wm_settingchange then
				update_font
			elseif msg = OS.wm_timer then
				run_timer (wParam)
			end
			Result := OS.def_window_proc_a_external (hwnd, msg, wparam, lparam)
		end

	msg_filter_proc (code: INTEGER; wparam: INTEGER; lparam: INTEGER): INTEGER is 
			-- filter procedure called back by a WIN32 Hook
		do
			if code >= 0 then
				create hook_msg.make_from_integer (lparam)
				if hook_msg.message = os.wm_null then
					run_async_messages
				end
			end
			Result := os.call_next_hook_ex_external (h_hook, code, wparam, lparam)
		end
	
feature {NONE} -- Implementation static code

	create_display (data : DEVICE_DATA) is
		do
			do_nothing
		end

	window_class_count : INTEGER is do Result := window_class_count_ref.item end

	window_class_count_ref : INTEGER_REF is
		once
			create Result
		end

	increment_window_class_count is do window_class_count_ref.set_item (window_class_count + 1) end

	initialize_key_table is 
		do  
			-- Keyboard and Mouse Masks */
			key_table.put (OS.VK_MENU,	SWT.key_ALT)
			key_table.put (OS.VK_SHIFT,	SWT.key_SHIFT)
			key_table.put (OS.VK_CONTROL,	SWT.key_CONTROL)

			-- NOT CURRENTLY USED */		
	--		key_table.put (OS.VK_LBUTTON, SWT.key_BUTTON1)
	--		key_table.put (OS.VK_MBUTTON, SWT.key_BUTTON3)
	--		key_table.put (OS.VK_RBUTTON, SWT.key_BUTTON2)

			-- Non-Numeric Keypad Keys */
			key_table.put (OS.VK_UP,		SWT.key_ARROW_UP)
			key_table.put (OS.VK_DOWN,	SWT.key_ARROW_DOWN)
			key_table.put (OS.VK_LEFT,	SWT.key_ARROW_LEFT)
			key_table.put (OS.VK_RIGHT,	SWT.key_ARROW_RIGHT)
			key_table.put (OS.VK_PRIOR,	SWT.key_PAGE_UP)
			key_table.put (OS.VK_NEXT,	SWT.key_PAGE_DOWN)
			key_table.put (OS.VK_HOME,	SWT.key_HOME)
			key_table.put (OS.VK_END,		SWT.key_END)
			key_table.put (OS.VK_INSERT,	SWT.key_INSERT)

			-- Virtual and Ascii Keys */
			key_table.put (OS.VK_BACK,	SWT.key_BS)
			key_table.put (OS.VK_RETURN,	SWT.key_CR)
			key_table.put (OS.VK_DELETE,	SWT.key_DEL)
			key_table.put (OS.VK_ESCAPE,	SWT.key_ESC)
			key_table.put (OS.VK_RETURN,	SWT.key_LF)
			key_table.put (OS.VK_TAB,		SWT.key_TAB)

			-- Functions Keys */
			key_table.put (OS.VK_F1,	SWT.key_F1)
			key_table.put (OS.VK_F2,	SWT.key_F2)
			key_table.put (OS.VK_F3,	SWT.key_F3)
			key_table.put (OS.VK_F4,	SWT.key_F4)
			key_table.put (OS.VK_F5,	SWT.key_F5)
			key_table.put (OS.VK_F6,	SWT.key_F6)
			key_table.put (OS.VK_F7,	SWT.key_F7)
			key_table.put (OS.VK_F8,	SWT.key_F8)
			key_table.put (OS.VK_F9,	SWT.key_F9)
			key_table.put (OS.VK_F10,	SWT.key_F10)
			key_table.put (OS.VK_F11,	SWT.key_F11)
			key_table.put (OS.VK_F12,	SWT.key_F12)

			-- Numeric Keypad Keys */
	--		key_table.put (OS.VK_ADD,			SWT.key_KP_PLUS)
	--		key_table.put (OS.VK_SUBTRACT,	SWT.key_KP_MINUS)
	--		key_table.put (OS.VK_MULTIPLY,	SWT.key_KP_TIMES)
	--		key_table.put (OS.VK_DIVIDE,		SWT.key_KP_DIVIDE)
	--		key_table.put (OS.VK_DECIMAL,		SWT.key_KP_DECIMAL)
	--		key_table.put (OS.VK_RETURN,		SWT.key_KP_CR)
	--		key_table.put (OS.VK_NUMPAD0,		SWT.key_KP_0)
	--		key_table.put (OS.VK_NUMPAD1,		SWT.key_KP_1)
	--		key_table.put (OS.VK_NUMPAD2,		SWT.key_KP_2)
	--		key_table.put (OS.VK_NUMPAD3,		SWT.key_KP_3)
	--		key_table.put (OS.VK_NUMPAD4,		SWT.key_KP_4)
	--		key_table.put (OS.VK_NUMPAD5,		SWT.key_KP_5)
	--		key_table.put (OS.VK_NUMPAD6,		SWT.key_KP_6)
	--		key_table.put (OS.VK_NUMPAD7,		SWT.key_KP_7)
	--		key_table.put (OS.VK_NUMPAD8,		SWT.key_KP_8)
	--		key_table.put (OS.VK_NUMPAD9,		SWT.key_KP_9)
		end

	translate_accelerator (a_message : MSG; control : CONTROL) : BOOLEAN is
		do
			accel_key_hit := True
			Result := control.translate_accelerator (a_message)
			accel_key_hit := False
		end
		
	translate_mnemonic (a_message : MSG; control : CONTROL) : BOOLEAN is
		do
			if a_message.message = os.WM_CHAR or else a_message.message = os.WM_SYSCHAR then
				Result := control.translate_mnemonic (a_message)
			end
		end
		
	translate_traversal (a_message : MSG; control : CONTROL) : BOOLEAN is
		do
			if a_message.message = os.WM_KEYDOWN then
				if a_message.wparam = os.VK_RETURN or else
				a_message.wparam = os.VK_ESCAPE or else 
				a_message.wparam = os.VK_TAB or else 
				a_message.wparam = os.VK_UP or else 
				a_message.wparam = os.VK_DOWN or else 
				a_message.wparam = os.VK_LEFT or else
				a_message.wparam = os.VK_RIGHT or else
				a_message.wparam = os.VK_PRIOR or else
				a_message.wparam = os.VK_NEXT then
					Result := control.translate_traversal (a_message)					
				end
			elseif a_message.message = os.WM_SYSKEYDOWN then
				if a_message.wparam = os.VK_MENU then
					Result := control.translate_traversal (a_message)
				end
			else
				Result := False
			end
		end
		
	--boolean translateTraversal (MSG msg, Control control) {
	--	switch (msg.message) {
	--		case OS.WM_KEYDOWN:
	--			switch (msg.wParam) {
	--				case OS.VK_RETURN:
	--				case OS.VK_ESCAPE:
	--				case OS.VK_TAB:
	--				case OS.VK_UP:
	--				case OS.VK_DOWN:
	--				case OS.VK_LEFT:
	--				case OS.VK_RIGHT:
	--				case OS.VK_PRIOR:
	--				case OS.VK_NEXT:
	--					return control.translateTraversal (msg);
	--			}
	--			break;
	--		case OS.WM_SYSKEYDOWN:
	--			switch (msg.wParam) {
	--				case OS.VK_MENU:
	--					return control.translateTraversal (msg);
	--			}
	--			break;
	--	}
	--	return false;
	--}

invariant
	
	current_message_not_void: current_message /= Void

end -- class DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
