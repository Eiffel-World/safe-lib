indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	RGB

inherit
	HASHABLE
		redefine
			out
		end
		
create
	make

feature -- Initialization

	make (a_red, a_green, a_blue : INTEGER) is
		require
			a_red_within_limits: 0 <= a_red and a_red <= 255
			a_green_within_limits: 0 <= a_green and a_green <= 255
			a_blue_within_limits: 0 <= a_blue and a_blue <= 255
		do
			red := a_red
			green := a_green
			blue := a_blue
		ensure
			red_set: red = a_red
			green_set: green = a_green
			blue_set: blue = a_blue
		end
		
feature -- Access

	red : INTEGER
			-- Red component.
	
	green : INTEGER
			-- Green component.
	
	blue : INTEGER
			-- Blue component.

	hash_code : INTEGER is
		do
			Result := red * 16384 + green * 256 + blue
		end
	
feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
		do
			create Result.make (20)
			Result.append_string ("RGB {")
			Result.append_integer (red)
			Result.append_string (", ")
			Result.append_integer (green)
			Result.append_string (", ")
			Result.append_integer (blue)
			Result.append_character ('}')
		end
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant

	red_within_limits: 0 <= red and red <= 255
	green_within_limits: 0 <= green and green <= 255
	blue_within_limits: 0 <= blue and blue <= 255

end
