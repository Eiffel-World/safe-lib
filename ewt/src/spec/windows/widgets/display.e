indexing
	description: "Windows implementation of ABSTRACT_DISPLAY"
	date: "$Date: 2003/12/29 16:49:48 $";
	revision: "$Revision: 1.5 $";
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
	
	WNDPROC_CALLBACK
		rename
			on_callback as window_proc
		end

	MSGPROC_CALLBACKABLE
	
	XS_IMPORTED_UINT32_ROUTINES
	
creation
	make, make_by_device_data
	
feature {NONE} -- Initialization

	make is
			-- Default initialization.
		do
			make_by_device_data (Void)
		end

feature -- Access

feature {DISPLAY} -- Access

	trim_enabled : BOOLEAN
		-- static

feature {NONE} -- Access

	window_procedure : POINTER
	
	window_callback : WNDPROC_DISPATCHER
	
	thread_id : INTEGER
	
	process_id : INTEGER
	
	window_class : TCHAR

	window_name : STRING is "SWT_Window"

	hwnd_message : POINTER
		-- message only window handle
		
	message_procedure : POINTER
		-- message only procedure
		
	message_callback : WNDPROC_DISPATCHER
	
	message_callbacker : MSGPROC_CALLBACK
	
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
		do
			-- FIXME
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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	init is
		local
			l_window_class_name : STRING
			h_heap, h_instance : POINTER
			lp_wndclass : WNDCLASSEX
			cursor_index : XS_C_INT32
			msgproc_pointer : XS_C_POINTER
			hclass : INTEGER
			l_system_font : POINTER
			info : NONCLIENTMETRICS
			swl_result : INTEGER
		do
			Precursor
--		
--	/* Create the callbacks */
--	windowCallback = new Callback (this, "windowProc", 4);
--	windowProc = windowCallback.getAddress ();
--	if (windowProc == 0) error (SWT.ERROR_NO_MORE_CALLBACKS);

			create window_callback.make (Current)
			window_procedure := window_callback.c_dispatcher
			
--	
--	/* Remember the current procsss and thread */
--	threadId = OS.GetCurrentThreadId ();
--	processId = OS.GetCurrentProcessId ();

			thread_id := Os.get_current_thread_id_external
			process_id := Os.get_current_process_id_external
--	
--	/* Use the character encoding for the default locale */
--	windowClass = new TCHAR (0, WindowName + WindowClassCount++, true);
			create l_window_class_name.make_from_string (window_name)
			l_window_class_name.append_integer (window_class_count)
			increment_window_class_count
			create window_class.make (l_window_class_name.count)
			window_class.from_string (l_window_class_name)
--
--	/* Register the SWT window class */
--	int hHeap = OS.GetProcessHeap ();
--	int hInstance = OS.GetModuleHandle (null);
			h_heap := OS.get_process_heap_external
			h_instance := OS.get_module_handle_a_external (default_pointer)
			
--	WNDCLASS lpWndClass = new WNDCLASS ();
			create lp_wndclass.make_new_unshared
			
--	lpWndClass.hInstance = hInstance;
--	lpWndClass.lpfnWndProc = windowProc;
--	lpWndClass.style = OS.CS_BYTEALIGNWINDOW | OS.CS_DBLCLKS;
--	lpWndClass.hCursor = OS.LoadCursor (0, OS.IDC_ARROW);
			lp_wndclass.set_cbsize (lp_wndclass.sizeof)
			lp_wndclass.set_hinstance (h_instance)
			lp_wndclass.set_lpfnwndproc (window_procedure)
			lp_wndclass.set_style (UINT32_.u_or (OS.Cs_bytealignwindow, os.Cs_dblclks))
			create cursor_index.make
			cursor_index.put (os.Idc_arrow)
			lp_wndclass.set_hcursor (os.load_cursor_a_external (default_pointer, cursor_index.as_pointer))

--	int byteCount = windowClass.length () * TCHAR.sizeof;
--	int lpszClassName = OS.HeapAlloc (hHeap, OS.HEAP_ZERO_MEMORY, byteCount);
--	lpWndClass.lpszClassName = lpszClassName;
--	OS.MoveMemory (lpszClassName, windowClass, byteCount);
			lp_wndclass.set_lpszclassname (window_class.handle)
		
--	OS.RegisterClass (lpWndClass);
			hclass := os.register_class_ex_a_external (lp_wndclass.item)
			check
				hclass /= 0
			end
--	
--	/* Initialize the system font */
--	int systemFont = 0;
			l_system_font := default_pointer
		
--	if (!OS.IsWinCE) {
--		NONCLIENTMETRICS info = new NONCLIENTMETRICS ();
--		info.cbSize = NONCLIENTMETRICS.sizeof;
--		if (OS.SystemParametersInfo (OS.SPI_GETNONCLIENTMETRICS, 0, info, 0)) {
--			systemFont = OS.CreateFontIndirect (info.lfMessageFont);
--		}
--	}
--	if (systemFont == 0) systemFont = OS.GetStockObject (OS.DEFAULT_GUI_FONT);
--	if (systemFont == 0) systemFont = OS.GetStockObject (OS.SYSTEM_FONT);
--	if (systemFont != 0) systemFonts = new int [] {systemFont};

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
--	
--	/* Create the message only HWND */
--	hwndMessage = OS.CreateWindowEx (0,
--		windowClass,
--		null,
--		OS.WS_OVERLAPPED,
--		0, 0, 0, 0,
--		0,
--		0,
--		hInstance,
--		null);

		hwnd_message := os.create_window_ex_a_external (
			0, --dwexstyle: INTEGER; 
			window_class.handle, --lpclassname: POINTER;
			default_pointer, --lpwindowname: POINTER; 
			0,  --dwstyle: INTEGER; 
			0, --x: INTEGER; 
			0, --y: INTEGER; 
			0, --nwidth: INTEGER; 
			0, --nheight: INTEGER; 
			default_pointer, --hwndparent: POINTER; 
			default_pointer, --hmenu: POINTER; 
			h_instance, --hinstance: POINTER; 
			default_pointer --lpparam: POINTER
			)

--		hwnd_message := os.create_window_ex_a_external (0,
--				window_class.handle,
--				default_pointer,
--				os.Ws_overlappedwindow,
--				0,0,0,0,
--				default_pointer,
--				default_pointer,
--				h_instance,
--				default_pointer)
		
--	messageCallback = new Callback (this, "messageProc", 4);
--	messageProc = messageCallback.getAddress ();
--	if (messageProc == 0) error (SWT.ERROR_NO_MORE_CALLBACKS);
--	OS.SetWindowLong (hwndMessage, OS.GWL_WNDPROC, messageProc);

		create message_callbacker.make (Current)
		create message_callback.make (message_callbacker)
		create msgproc_pointer.make
		msgproc_pointer.put (message_callback.c_dispatcher)
		swl_result := os.set_window_long_a_external (hwnd_message, os.Gwl_wndproc, msgproc_pointer.as_integer)
		
--
--	/* Create the message filter hook */
--	if (!OS.IsWinCE) {
--		msgFilterCallback = new Callback (this, "msgFilterProc", 3);
--		msgFilterProc = msgFilterCallback.getAddress ();
--		if (msgFilterProc == 0) error (SWT.ERROR_NO_MORE_CALLBACKS);
--		hHook = OS.SetWindowsHookEx (OS.WH_MSGFILTER, msgFilterProc, 0, threadId);
--	}
		end
		
	create_os_device (a_device_data : DEVICE_DATA) is
			-- Creates the device in the operating system with `a_device_data'.
			-- If the device does not have a handle, this method may do nothing depending on the device.
		do	
				--	checkDisplay (thread = Thread.currentThread ());
			create_display (a_device_data)
				--	register (this);
				--	if (Default == null) Default = this;
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

	system_fonts : ARRAY [POINTER]
			-- System fonts.

	window_proc (hwnd : POINTER; msg, wparam, lparam : INTEGER) : INTEGER is
		do
--		Control control = WidgetTable.get (hwnd);
--		if (control != null) {
--			return control.windowProc (msg, wParam, lParam);
--		}
			Result := OS.def_window_proc_a_external (hwnd, msg, wParam, lParam);
		end

	message_proc (hwnd : POINTER; msg, wparam, lparam : INTEGER) : INTEGER is
		do
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
					--			if (wParam != 0) {
					--				Shell shell = getModalShell ();
					--				if (shell != null) shell.bringToTop ();
					--			}
					--			break;				
				elseif msg = OS.wm_endsession then
					--			if (wParam != 0) dispose ();
					--			break;
				elseif msg = OS.wm_null or else msg = OS.wm_queryendsession then
				--		case OS.WM_ENDSESSION:
				--		case OS.WM_NULL:
				--			runAsyncMessages ();
				--			break;
				elseif msg = os.wm_queryendsession then
				--		case OS.WM_QUERYENDSESSION:
				--			Event event = new Event ();
				--			sendEvent (SWT.Close, event);
				--			if (!event.doit) return 0;
				--			break;
				elseif msg = OS.wm_settingchange then
				--		case OS.WM_SETTINGCHANGE:
				--			updateFont ();
				--			break;
				elseif msg = OS.wm_timer then
				--		case OS.WM_TIMER:
				--			runTimer (wParam);
				--			break;
				end
				Result := OS.def_window_proc_a_external (hwnd, msg, wparam, lparam)
				--	return OS.DefWindowProc (hwnd, msg, wParam, lParam);					
		end
		
feature {NONE} -- Implementation static code

	create_display (data : DEVICE_DATA) is
		do
			
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
	
invariant
	invariant_clause: -- Your invariant here

end -- class DISPLAY

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
