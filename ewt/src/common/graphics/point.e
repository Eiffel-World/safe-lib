indexing
	description: 
	
		"[
			Instances of this class represent places on the (x, y)
			coordinate plane.
			
			The coordinate space for rectangles and points is considered
			to have increasing values downward and to the right from its
			origin making this the normal, computer graphics oriented notion
			of (x, y) coordinates rather than the strict mathematical one.
			
			Application code does <em>not</em> need to explicitly release the
			resources managed by each instance when those instances are no longer
			required, and thus no <code>dispose()</code> method is provided.
			
			@see Rectangle
		]"

	copyright: 
		"[
			Copyright (c) 2000, 2003 IBM Corporation and others.
			All rights reserved. This program and the accompanying materials 
			are made available under the terms of the Common Public License v1.0
			which accompanies this distribution, and is available at
			http://www.eclipse.org/legal/cpl-v10.html
		]"
		
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	POINT
	
inherit
	HASHABLE
		redefine
			out, is_equal
		end
		
	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		undefine
			out, is_equal
		end
		
create
	make
	
feature -- Initialization

	make (a_x, a_y : INTEGER) is
			-- Constructs a new point with the given x and y coordinates.
		do
			x := a_x
			y := a_y
		ensure
			x_set: x = a_x
			y_set: y = a_y
		end
		
feature -- Access

	x : INTEGER
		-- The x coordinate of the point
		
	y : INTEGER
		-- The y coordinate of the point

	hash_code : INTEGER is
		do
			Result := UINT32_.u_xor (x, y)
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
			Result.append_string ("Point {")
			Result.append_integer (x)
			Result.append_string (", ")
			Result.append_integer (y)
			Result.append_character ('}')
		end
		
feature -- Comparison

	is_equal (other : like Current) : BOOLEAN is
			-- Are Current and `other' equal ?
		do
			if Current = other then
				Result := True
			else
				Result := (x = other.x and then y = other.y)
			end
		ensure then
			definition: Result = (x = other.x and then y = other.y)
			hash_codes: Result implies hash_code = other.hash_code
		end

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

end -- class POINT
