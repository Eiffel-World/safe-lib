indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.3 $"

class
	EVENT

create
	make
	
feature -- Initialization

	make is
		do
			
			doit := True
		end
	
feature -- Access

	gc : GC
	
	x : INTEGER
	
	y : INTEGER
	
	width : INTEGER
	
	height : INTEGER
	
	count : INTEGER
	
feature -- Measurement

feature -- Status report

	doit : BOOLEAN

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_gc (a_gc : GC) is
		do
			gc := a_gc
		ensure
			gc_set: gc = a_gc
		end
		
	set_x (a_x : INTEGER) is
		do
			x := a_x
		ensure
			x_set: x = a_x
		end

	set_y (a_y : INTEGER) is
		do
			y := a_y
		ensure
			y_set: y = a_y
		end

	set_count (a_count : INTEGER) is
		do
			count := a_count
		ensure
			count_set: count = a_count
		end

	set_width (a_width : INTEGER) is
		do
			width := a_width
		ensure
			width_set: width = a_width
		end

	set_height (a_height : INTEGER) is
		do
			height := a_height
		ensure
			height_set: height = a_height
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

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class EVENT
