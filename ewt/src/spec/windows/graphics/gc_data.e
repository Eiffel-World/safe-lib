indexing
	description: "[
					Windows implementation of ABSTRACT_GC_DATA.
					]"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.3 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	GC_DATA
	
inherit
	ABSTRACT_GC_DATA

creation
	make
	
feature {NONE} -- Initialization

	make is
			-- Initialize with default values.
		do
			set_style (-1)
			set_background (-1)
			set_foreground (-1)
		ensure
			style_set : style = -1
			background_set : background = -1
			foreground_set : foreground = -1
		end

feature -- Access

	device : DEVICE
			-- Device.
			
	style : INTEGER
			-- Style.
			
	image : IMAGE
			-- Image.
			
	foreground : INTEGER
			-- Foreground.
			
	background : INTEGER
			-- Background.
	
	font_handle : POINTER
			-- Handle of the font.
	
	null_bitmap_handle : POINTER
			-- Handle of a null bitmap.
	
	window_handle : POINTER
			-- Handle of the window.
			
	paint_structure : PAINTSTRUCT
			-- Paint structure. FIXME
	
	layout : INTEGER
			-- Layout.

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_font_handle (a_font_handle : POINTER) is
			-- Set font handle with `a_font_handle'.
		do
			font_handle := a_font_handle
		ensure
			font_handle_shared : font_handle = a_font_handle
		end

	set_null_bitmap_handle (a_null_bitmap_handle : POINTER) is
			-- Set null bitmap handle with `a_null_bitmap_handle'.
		do
			null_bitmap_handle := a_null_bitmap_handle
		ensure
			null_bitmap_handle_shared : null_bitmap_handle = a_null_bitmap_handle
		end

	set_window_handle (a_window_handle : POINTER) is
			-- Set window handle with `a_window_handle'.
		do
			window_handle := a_window_handle
		ensure
			window_handle_shared : window_handle = a_window_handle
		end

	set_device (a_device : DEVICE) is
			-- Set device with `a_device'.
		do
			device := a_device
		ensure
			device_shared : device = a_device
		end

	set_style (a_style : INTEGER) is
			-- Set style with `a_style'.
		do
			style := a_style
		ensure
			style_copied : style = a_style
		end

	set_layout (a_layout : INTEGER) is
			-- Set layout with `a_layout'.
		do
			layout := a_layout
		ensure
			layout_copied : layout = a_layout
		end

	set_background (a_background : INTEGER) is
			-- Set background with `a_background'.
		do
			background := a_background
		ensure
			background_copied : background = a_background
		end

	set_foreground (a_foreground : INTEGER) is
			-- Set foreground with `a_foreground'.
		do
			foreground := a_foreground
		ensure
			foreground_copied : foreground = a_foreground
		end

	set_paint_structure (a_paint_structure : like paint_structure) is
			-- Set foreground with `a_foreground'.
		require
			a_paint_structure_not_void: a_paint_structure /= Void
		do
			paint_structure := a_paint_structure
		ensure
			paint_structure_copied : paint_structure = a_paint_structure
		end

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

end -- class GC_DATA

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
