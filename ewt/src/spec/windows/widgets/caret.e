indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:18 $"
	revision: "$Revision: 1.1 $"

class
	CARET

inherit
	WIDGET
	
	ABSTRACT_CARET
	
feature -- Access

	get_bounds : RECTANGLE is
		do		
		end
		
	get_display : DISPLAY is
		do
		end
		
	get_font : FONT is
		do
		end
		
	get_image : IMAGE is
		do
		end
		
	get_location : POINT is
		do
		end
		
	get_parent : CANVAS is
		do
		end
		
	get_size : POINT is
		do
		end
		
	get_visible : BOOLEAN is
		do
		end
		
	is_visible : BOOLEAN is
		do
		end

feature -- Measurement

feature -- Status report

	is_focus_caret : BOOLEAN is
		do
			
		end
		
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_bounds_x_y_width_height (x, y, width, height : INTEGER) is
		do	
		end
	
	set_bounds (rect : RECTANGLE) is
		do
		end
	
	set_font (font : FONT) is
		do
		end
		
	set_image (an_image : IMAGE) is
		do
		end
		
	set_location_x_y (x, y : INTEGER) is
		do
		end
	
	set_location (a_location : POINT) is
		do
		end
		
	set_size_width_height (width, height : INTEGER) is
		do
		end
	
	set_size (size : POINT) is
		do
		end
		
	set_visible (visible : BOOLEAN) is
		do
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature {ABSTRACT_WIDGET} -- Basic operations

	kill_focus is
		do
			
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class CARET
