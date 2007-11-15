indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	GC

inherit
	SHARED_OS

	ABSTRACT_GC
	
	XS_IMPORTED_UINT32_ROUTINES
	
	SHARED_SWT
	
create
	make_win32
	
feature {NONE} -- Initialization
		
	make_win32 (a_drawable : DRAWABLE; a_data : GC_DATA) is
			-- 
		require
			a_drawable_not_void:a_drawable /= Void
			a_data_not_void: a_data /= Void
		local
			hdc : POINTER
		do
			hdc := a_drawable.internal_new_gc (a_data)
			init (a_drawable, a_data, hdc)
		end

	make (a_drawable : DRAWABLE) is
		require
			a_drawable_not_void: a_drawable /= Void
		do
			make_with_style (a_drawable, 0)
		end
		
	make_with_style (a_drawable : DRAWABLE; style : INTEGER) is
		require
			a_drawable_not_void: a_drawable /= Void
		local
			l_data : GC_DATA
			hdc : POINTER
			shared_display : SHARED_DISPLAY
			device : DEVICE
		do
			create l_data.make
			l_data.set_style (style)
			hdc := a_drawable.internal_new_gc (l_data)
			device := l_data.device
			if device = Void then
				create shared_display
				device := shared_display.default_display
			end
			l_data.set_device (device)
			init (a_drawable, l_data, hdc)
			if device.tracking then
				device.new_object (Current)
			end
		end
		
	init (a_drawable : DRAWABLE; a_data : GC_DATA; hdc : POINTER) is
		local
			foreground, background, layout, flags : INTEGER
			hpen, hfont, hpalette, hbrush : POINTER
			image : IMAGE
			res : INTEGER
			pres : POINTER
		do
			foreground := a_data.foreground
			if foreground /= -1 and then os.get_text_color (hdc) /= foreground then
				res := os.set_text_color (hdc, foreground)
				hpen := os.create_pen (os.PS_SOLID, 0, foreground)
				pres := os.select_object (hdc, hpen)
			end
			background := a_data.background
			if background /= -1 and then os.get_text_color (hdc) /= background then
				res := os.set_bk_color (hdc, background)
				hbrush := os.create_solid_brush (background)
				pres := os.select_object (hdc, hbrush)
			end
			hfont := a_data.font_handle
			if hfont /= default_pointer then
				pres := os.select_object (hdc, hfont)
			end
			hpalette := a_data.device.h_palette
			if hpalette /= default_pointer then
				pres := os.select_palette (hdc, hpalette, 1)
				res := os.realize_palette (hdc)
			end
			image := a_data.image
			if image /= Void then
				a_data.set_null_bitmap_handle (os.select_object (hdc, image.handle))
				image.set_mem_gc (Current)
			end
--FIXME			
--	Image image = data.image;
--	if (image != null) {
--		data.hNullBitmap = OS.SelectObject(hDC, image.handle);
--		image.memGC = this;
--	}
			layout := a_data.layout
			if layout /= -1 then
				if UINT32_.u_or (UINT32_.left_shift (os.win32_major, 16), os.win32_minor) >=
					UINT32_.u_or (UINT32_.left_shift (4, 16), 10) then
					flags := os.get_layout (hdc)
					if UINT32_.u_and (flags, os.layout_rtl) /= UINT32_.u_and (layout, os.layout_rtl) then
						flags := UINT32_.u_and (flags, UINT32_.u_not (os.layout_rtl))
						res := os.set_layout (hdc, UINT32_.u_or (flags, layout))
					end
					if UINT32_.u_and (a_data.style, swt.style_right_to_left) /= 0 then
						a_data.set_style (UINT32_.u_or (a_data.style, swt.style_mirrored))
					end
				end
			end
			drawable := a_drawable
			gc_data := a_data
			handle := hdc
		end
		
feature -- Access

	gc_data : GC_DATA
	
	handle : POINTER
	
	drawable : DRAWABLE
	
	
feature -- Measurement

feature -- Status report

	is_resource_disposed : BOOLEAN is
		do
			Result := handle = default_pointer
		end
		
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

	dispose_resource is
		do
			
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class GC
