indexing
	description: "Windows implementation of ABSTRACT_COMPOSITE"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.7 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	COMPOSITE

inherit	
	ABSTRACT_COMPOSITE
		undefine
			release_handle
		end
	
	SCROLLABLE
		redefine
			widget_style,
			create_handle,
			compute_tab_list,
			do_WM_SETFONT,
			do_WM_PAINT
		end
	
feature {NONE} -- Initialization

feature {WIDGET} -- Access

	tab_list : DS_LIST[CONTROL]
	
	font : INTEGER
			-- font handle

	lpwp : DS_LIST[WINDOWPOS]
	
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

	compute_tab_list : DS_LIST[CONTROL] is
		local
			children : DS_LIST[CONTROL]
			children_cursor : DS_LIST_CURSOR[CONTROL]
		do
			Result := Precursor
			if Result.count > 0 then
				if tab_list /= Void then
					children := get_tab_list_
				else
					children := get_children_
				end
				from
					children_cursor := children.new_cursor
					children_cursor.start
				until
					children_cursor.off
				loop
					Result.extend_last (children_cursor.item.compute_tab_list)
					children_cursor.forth
				end			
			end
		end

feature {CONTROL} -- Miscellaneous

	get_tab_list_ : DS_LIST[CONTROL] is
		local
			cursor : DS_LIST_CURSOR[CONTROL]
		do
			if tab_list = Void then
				do_nothing
			else
				cursor := tab_list.new_cursor
				from
					cursor.start
					create {DS_LINKED_LIST[CONTROL]}Result.make
				until
					cursor.off
				loop
					if not cursor.item.is_resource_disposed then
						Result.put_last (cursor.item)
					end
					cursor.forth
				end
			end
		end
		
	get_children_ : DS_LIST[CONTROL] is
		local
			hwndChild : POINTER
			control : CONTROL
		do
			hwndChild := os.get_window (handle, OS.GW_CHILD)
			create {DS_LINKED_LIST[CONTROL]} Result.make
			if hwndChild = default_pointer then
				do_nothing
			else
				from					
				until
					hwndChild = default_pointer
				loop
					control := Widget_table.item (hwndChild)
					if control /= Void and then control /= Current then
						Result.put_last (control)
					end
					hwndChild := os.get_window (hwndChild, os.GW_HWNDNEXT)
				end
			end
		ensure
			get_children_not_void: Result /= Void
		end

feature {CONTROL} -- Basic operations

	do_WM_SETFONT (wparam: INTEGER; lparam: INTEGER) : LRESULT is
		do
			font := wparam
			Result := Precursor (wparam, lparam)
		end

	do_WM_PAINT (wparam: INTEGER; lparam: INTEGER) : LRESULT is
		local
			rgn : POINTER
			is_complex : BOOLEAN
			expose_region : BOOLEAN
			region_data : XS_C_ARRAY_INT32
			nbytes : INTEGER
			oldbits, newbits : INTEGER
			res : INTEGER
			ps : PAINTSTRUCT
			l_data : GC_DATA
			gc : GC
			hdc : POINTER
			rect : RECT
			count, i, index : INTEGER
			event : EVENT
		do	
			if UINT32_.u_and (state, Canvas_constant) = 0 then
				Result := Precursor (wparam, lparam)
			else
				if UINT32_.u_and (style, swt.Style_no_merge_paints) /= 0 then
					rgn := os.create_rect_rgn (0, 0, 0, 0)
					is_complex := os.get_update_rgn (handle, rgn, 0) = os.COMPLEXREGION
					if is_complex then
						nbytes := os.get_region_data (rgn, 0, default_pointer)
						create region_data.make ((nbytes + 3) // 4)
						expose_region := os.get_region_data (rgn, nbytes, region_data.handle) /= 0
					end
					res := os.delete_object (rgn)
				end
				-- Set the clipping bits
				if not os.is_wince then
					oldbits := os.get_window_long_a (handle, os.GWL_STYLE)
					newbits := UINT32_.u_or (UINT32_.u_or (oldbits, os.WS_CLIPSIBLINGS), os.WS_CLIPCHILDREN)
					res :=os.set_window_long_a (handle, os.GWL_STYLE, newbits)
				end
				-- Create the paint gc 
				create ps.make_new_unshared
				create l_data.make
				l_data.set_paint_structure (ps)
				create gc.make_win32 (Current, l_data)
				hdc := gc.handle
				create event.make
				event.set_gc (gc)
				if is_complex and then expose_region then
					create rect.make_new_unshared
					count := region_data.item (2)
					from
						i := 0
					until
						i >= count or else is_resource_disposed
					loop
						index := 8 + i * 4
						res := os.set_rect (rect.item, region_data.item (index),
							region_data.item (index)+1 ,
							region_data.item (index)+2,
							region_data.item (index)+3)
						if UINT32_.u_and (style, swt.Style_no_background) = 0 then
							draw_background (hdc, rect)
						end
						event.set_x (rect.left)
						event.set_y (rect.top)
						event.set_width (rect.right - rect.left)
						event.set_height (rect.bottom - rect.top)
						event.set_count (count - 1 - i)
						
						send_event_by_type_and_event (swt.Event_paint, event)
						i := index + 1
					end
				else
					if UINT32_.u_and (style, swt.Style_no_background) = 0 then
						create rect.make_new_unshared
						res := os.set_rect (rect.item, ps.left, ps.top, ps.right, ps.bottom)
						draw_background (hdc, rect)
					end
					event.set_x (rect.left)
					event.set_y (rect.top)
					event.set_width (rect.right - rect.left)
					event.set_height (rect.bottom - rect.top)
					
					send_event_by_type_and_event (swt.Event_paint, event)

				end
				event.set_gc (Void)
				gc.dispose_resource
				if not os.is_wince then
					if not is_resource_disposed then
						res := os.set_window_long_a (handle, os.GWL_STYLE, oldbits)
					end
				end
				create Result
			end
		end
		
			
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	widget_style : INTEGER is
		do
		--	/* Force clipping of children by setting WS_CLIPCHILDREN */
			Result := UINT32_.u_or (Precursor, OS.WS_CLIPCHILDREN)
		end
	
	create_handle is
		do
			Precursor
			state := UINT32_.u_or (state, Canvas_constant)
		end
		
		
invariant
	invariant_clause: -- Your invariant here

end -- class COMPOSITE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
