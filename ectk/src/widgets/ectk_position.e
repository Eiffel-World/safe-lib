indexing
	description: "Objects that represents a position in a character based system"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

class
	ECTK_POSITION


creation
	make, make_origin, make_lower_right_corner

feature {NONE} -- Initialization

	make (a_x,a_y: INTEGER) is
			-- Initialize with `a_x' and `a_y'.
		require
			x_positif: a_x >= 0
			y_positif: a_y >= 0
		do
			set_x (a_x)
			set_y (a_y)
		ensure
			x_copied: x = a_x
			y_copied: y = a_y
		end

	make_origin is
			-- Initialize with the character based system's origin.
		do
			make (0, 0)
		ensure
			is_origin
		end

	make_lower_right_corner (a_window: CURSES_WINDOW) is
			-- Initialize with the coordinates of the lower right corner of `a_window'.
		require
			window_not_void: a_window /= Void
		do
			set_x (a_window.width - 1)
			set_y (a_window.height - 1)
		ensure
			x_set: x = a_window.width - 1
			y_set: y = a_window.height - 1
		end
feature -- Access

	x: INTEGER
			-- Column coordinate.

	y: INTEGER
			-- Row coordinate

feature -- Element change

	set_x (a_x: INTEGER) is
			-- Set x with `a_x'.
		require
			x_positif: x >= 0
		do
			x := a_x
		ensure
			x_copied: x = a_x
		end

	set_y (a_y: INTEGER) is
			-- Set y with `a_y'.
		require
			y_positif: y >= 0
		do
			y := a_y
		ensure
			y_copied: y = a_y
		end

feature -- Status

	is_origin: BOOLEAN is
			-- Is `Current' the origin of the character based system?
		do
			Result := (x = 0) and (y = 0)
		ensure
			Result = ((x = 0) and (y = 0))
		end

invariant
	x_positif: x >= 0
	y_positif: y >= 0

end -- class ECTK_POSITION

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
