indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

deferred class
	ABSTRACT_CARET

inherit
	ABSTRACT_WIDGET
	
feature -- Access

	get_bounds : RECTANGLE is
		deferred		
		end
		
	get_display : ABSTRACT_DISPLAY is
		deferred
		end
		
	get_font : ABSTRACT_FONT is
		deferred
		end
		
	get_image : ABSTRACT_IMAGE is
		deferred
		end
		
	get_location : POINT is
		deferred
		end
		
	get_parent : ABSTRACT_CANVAS is
		deferred
		end
		
	get_size : POINT is
		deferred
		end
		
	get_visible : BOOLEAN is
		deferred
		end
		
	is_visible : BOOLEAN is
		deferred
		end
	
feature -- Measurement

feature {ABSTRACT_WIDGET} -- Status report

	is_focus_caret : BOOLEAN is
		deferred		
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_bounds_x_y_width_height (x, y, width, height : INTEGER) is
		deferred	
		end
	
	set_bounds (rect : RECTANGLE) is
		require
			rect_not_void: rect /= Void
		deferred
		end
	
	set_font (font : ABSTRACT_FONT) is
		deferred
		end
		
	set_image (an_image : ABSTRACT_IMAGE) is
		deferred
		end
		
	set_location_x_y (x, y : INTEGER) is
		deferred
		end
	
	set_location (location : POINT) is
		deferred
		end
		
	set_size_width_height (width, height : INTEGER) is
		deferred
		end
	
	set_size (size : POINT) is
		require
			size_not_void: size /= Void
		deferred
		end
		
	set_visible (visible : BOOLEAN) is
		deferred
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature {ABSTRACT_WIDGET} -- Basic operations

	kill_focus is
		deferred
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class ABSTRACT_CARET
