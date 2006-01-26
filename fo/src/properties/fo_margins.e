indexing
	description: "Margins"
	author: "Paul G. Crismer"
	date: "$Date: 2006/01/26 18:27:04 $"
	revision: "$Revision: 1.1 $"

class
	FO_MARGINS

inherit
	FO_TUPLE_4
	
creation
	make, set

feature -- Measurement

	content_region (box : FO_RECTANGLE) : FO_RECTANGLE is
			-- content region of margins applied to `box'
		do
			create Result.set (
			box.left + left,
			box.bottom + bottom,
			box.right - right,
			box.top - top)
		ensure
			content_region_not_void: Result /= Void
			content_region_left: Result.left.is_equal (box.left + left)
			content_region_right: Result.right.is_equal (box.right - right)
			content_region_top: Result.top.is_equal (box.top - top)
			content_region_bottom: Result.bottom.is_equal (box.bottom + bottom)
		end

end -- class FO_ABLE
