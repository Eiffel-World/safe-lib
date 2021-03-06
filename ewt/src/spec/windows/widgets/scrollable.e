indexing
	description: "Windows implementation of ABSTRACT_SCROLLABLE"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.7 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	SCROLLABLE

inherit
	CONTROL
		redefine
			create_widget,
			widget_ext_style,
			widget_style
		end
		
	ABSTRACT_SCROLLABLE
		undefine
			release_handle
		end
	
feature {NONE} -- Initialization

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

feature {CONTROL}-- Basic operations

	call_window_proc (msg, wParam, lParam : INTEGER) : INTEGER is
		do
			if handle = default_pointer then
				Result := 0
			else
				Result := os.def_window_proc_a (handle, msg, wParam, lParam)
			end
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	create_widget is
		do
			-- FIXME
			Precursor
			if UINT32_.u_and (style, swt.Style_h_scroll) /= 0 then
				-- horizontalBar = createScrollBar (swt.Style_event_h_scroll)
			end
			if UINT32_.u_and (style, swt.style_V_SCROLL) /= 0 then
				-- verticalBar = createScrollBar (swt.style_V_SCROLL)
			end
		end

	widget_ext_style : INTEGER is
		do
			Result := Precursor

--			* This code is intentionally commented.  In future,
--			* we may wish to support different standard Windows
--			* edge styles.  The issue here is that not all of
--			* these styles are available on the other platforms
--			* this would need to be a hint.
--			*/
--		//	if ((style & SWT.BORDER) != 0) return OS.WS_EX_CLIENTEDGE;
--		//	if ((style & SWT.SHADOW_IN) != 0) return OS.WS_EX_STATICEDGE;
--		//	return super.widgetExtStyle ();			
		end
	
	widget_style : INTEGER is
		do
			Result := UINT32_.u_or (Precursor, OS.Ws_tabstop)
			if UINT32_.u_and (style, swt.style_h_scroll) /= 0 then
				Result := UINT32_.u_or (Result, os.Ws_hscroll)
			end
			if UINT32_.u_and (style, swt.style_v_scroll) /= 0 then
				Result := UINT32_.u_or (Result, os.Ws_vscroll)
			end
		end

	window_class : TCHAR is
		do		
			Result := get_display.window_class
		end

	window_proc_pointer : POINTER is
		do
			Result := get_display.window_proc_pointer
		end
		
invariant
	invariant_clause: -- Your invariant here

end -- class SCROLLABLE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
