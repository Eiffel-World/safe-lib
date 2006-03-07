indexing
	description: 
	
	"[	
		Instances of this class represent rectangular areas in an
		(x, y) coordinate system. The top left corner of the rectangle
		is specified by its x and y values, and the extent of the
		rectangle is specified by its width and height.

		The coordinate space for rectangles and points is considered
		to have increasing values downward and to the right from its
		origin making this the normal, computer graphics oriented notion
		of (x, y) coordinates rather than the strict mathematical one.

		Application code does <em>not</em> need to explicitly release the
		resources managed by each instance when those instances are no longer
		required, and thus no <code>dispose()</code> method is provided.
		</p>
		@see Point
	]"

	copyright: "[
		Copyright (c) 2000, 2003 IBM Corporation and others.
		All rights reserved. This program and the accompanying materials 
		are made available under the terms of the Common Public License v1.0
		which accompanies this distribution, and is available at
		http://www.eclipse.org/legal/cpl-v10.html
	]"
		
	author: ""
	date: "$Date: 2006/03/07 17:10:11 $"
	revision: "$Revision: 1.2 $"

class
	RECTANGLE

inherit
	HASHABLE
		redefine
			is_equal, out
		end
	
	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, out
		end
		
creation
	make
	
feature -- Initialization

	make (a_x, a_y, a_width, a_height : INTEGER) is
			-- Construct a new instance of this class given the 
			-- `a_x', `a_y', `a_width' and `a_height' values.
		do
			x := a_x
			y := a_y
			width := a_width
			height := a_height
		ensure
			x_set: x = a_x
			y_set: y = a_y
			width_set: width = a_width
			height_set: height = a_height
		end

feature -- Access

	x : INTEGER
		-- The x coordinate of the rectangle.

	y : INTEGER
		-- The y coordinate of the rectangle.

	width : INTEGER
		-- The width of the rectangle.

	height : INTEGER
		-- The height of the rectangle.


	hash_code : INTEGER is
		do
			Result := UINT32_.u_xor (UINT32_.u_xor (UINT32_.u_xor (x, y), width), height)
		end

	intersection (other : like Current) : RECTANGLE is
			-- The intersection of two rectangles is the rectangle that covers the area which is contained within both rectangles.
		require
			other_not_void: other /= Void
		local
			left, top, lhs, rhs, right, bottom : INTEGER
			a_x, a_y, a_width, a_height : INTEGER
		do
			if Current = other then
				create Result.make (x, y, width, height)
			else
				if x > other.x then	left := x else left := other.x end
				if y > other.y then top := y else top := other.y end
				lhs := x + width
				rhs := other.x + other.width
				if lhs < rhs then right := lhs else right := rhs end
				lhs := y + height
				rhs := other.y + other.height
				if lhs < rhs then bottom := lhs else bottom := rhs end
				if right < left then 
					a_x := 0
					a_width := 0
				else 
					a_x := left
					a_width := right - left
				end
				if bottom < top then 
					a_y := 0 
					a_height := 0
				else 
					a_y := top 
					a_height := bottom - top
				end
				create Result.make (a_x, a_y, a_width, a_height)
			end
		ensure
			intersection_not_void: Result /= Void
		end

	union (other : like Current) : RECTANGLE is
			-- The union of two rectangles is the smallest single rectangle
			-- that completely covers both of the areas covered by the two
			-- given rectangles. See: add
		require
			other_not_void: other /= Void
		local
			left, top, lhs, rhs, right, bottom : INTEGER
		do
--			if x < other.x then left := x else left := other.x end
--			if y < other.y then top := y else top := other.y end
--			lhs := x + width
--			rhs := other.x + other.width
--			if lhs > rhs then right := lhs else right := rhs end
--			lhs := y + height
--			rhs := other.y + other.height
--			if lhs > rhs then bottom := lhs else bottom := rhs end
--			create Result.make (left, top, right - left, bottom - top)
			create Result.make (x, y, width, height)
			Result.add (other)
		ensure
			union_not_void: Result /= Void
		end
		
feature -- Measurement

feature -- Status report

	contains (a_x, a_y : INTEGER) : BOOLEAN is
			-- Is the point (`a_x', `a_y') inside the area specified by Current ?
		do
			Result := a_x >= x and then a_y >= y and then (a_x - x) < width and then (a_y - y) < height
		ensure
			definition: Result = (a_x >= x and then a_y >= y and then (a_x - x) < width and then (a_y - y) < height)
		end

	contains_point (point : POINT) : BOOLEAN is
			-- Is `point' inside the area specified by Current ?
		require
			point_not_void: point /= Void
		do
			Result := contains (point.x, point.y)
		ensure
			definition: Result = contains (point.x, point.y)
		end

	is_empty : BOOLEAN is
			-- Is Current an emtpy rectangle, i.e. it does not cover any area in the coordinate plane ?
			-- A rectangle is considered to cover area in the (x, y) coordinate plane 
			-- if both its width and height are non-zero.
		do
			Result := (width <= 0) or else (height <= 0)
		ensure
			definition: Result = (width <= 0) or else (height <= 0)
		end

	intersects (other : like Current) : BOOLEAN is
			-- Two rectangles intersect if the area of the rectangle representing their intersection is not empty.
		require
			other_not_void: other /= Void
		do
			Result := (other = Current) or else 
				((other.x < x + width) and then (other.y < y + height) and then
				 (other.x + other.width > x) and then (other.y + other.height > y))
		ensure
			definition: not intersection (other).is_empty
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
			-- 
		do
			create Result.make (20)
			Result.append_string("Rectangle {")
			Result.append_integer (x)
			Result.append_string (", ")
			Result.append_integer (y)
			Result.append_string (", ")
			Result.append_integer (width)
			Result.append_string (", ")
			Result.append_integer (height)
			Result.append_character ('}')			
		end

feature -- Duplication

feature -- Miscellaneous

feature -- Comparison

	is_equal (other : like Current) : BOOLEAN is
			-- Are Current and `other' equal ?
		do
			Result := other = Current
			if not Result then
				Result := other.x = x and then other.y = y and then other.width = width and then other.height = height
			end
		ensure then
			definition: Result = (other.x = x and then other.y = y and then other.width = width and then other.height = height)
			hash_codes: Result implies hash_code = other.hash_code
		end

feature -- Basic operations

	add (other : like Current) is
			-- Destructively replaces the x, y, width and height values
			-- in the receiver with ones which represent the union of the
			-- rectangles specified by the receiver and the given rectangle.

			-- The union of two rectangles is the smallest single rectangle
			-- that completely covers both of the areas covered by the two
			-- given rectangles.
		require
			other_not_void: other /= Void
		local
			left, top, lhs, rhs, right, bottom : INTEGER
		do
			if x < other.x then	left := x else left := other.x end
			if y < other.y then top := y else top := other.y end
			lhs := x + width
			rhs := other.x + other.width
			if lhs > rhs then right := lhs else right := rhs end
			lhs := y + height
			rhs := other.y + other.height
			if lhs > rhs then bottom := lhs else bottom := rhs end
			x := left
			y := top
			width := right - left
			height := bottom - top
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation


end -- class RECTANGLE
