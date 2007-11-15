indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	WINDOWPLACEMENT

inherit
	TAG_WINDOWPLACEMENT_STRUCT
		export
			{ANY} sizeof
		end
		
create
	make_shared, make_new_unshared
	
feature -- Access

	left : INTEGER is
			-- restored rectangle - left
		do
			Result := restored_rectangle.left
		end
		
	top : INTEGER is
			-- restored rectangle - top
		do
			Result := restored_rectangle.top
			end
		
	right : INTEGER is
			-- restored rectangle - right
		do
			Result := restored_rectangle.right
			end
	
	bottom : INTEGER is
			-- restored rectangle - bottom
		do
			Result := restored_rectangle.bottom			
		end

	restored_rectangle : RECT is
		do
--FIXME			create Result.make_new_shared ()
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

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class WINDOWPLACEMENT
