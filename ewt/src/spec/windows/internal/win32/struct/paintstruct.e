indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:18 $"
	revision: "$Revision: 1.2 $"

class
	PAINTSTRUCT

inherit
	TAG_PAINTSTRUCT_STRUCT

	WIN32_STRUCT_COMPLEMENT_FUNCTIONS
		export
			{NONE} all
		end
		
creation
	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared
	
feature -- Access

	rc_paint : RECT is
		do
			if rc_paint_impl = Void then
				rc_paint_impl := get_rc_paint
			end
			Result := rc_paint_impl
		end
		
	left : INTEGER is do Result := rc_paint.left end
	top : INTEGER is do Result := rc_paint.top end
	right : INTEGER is do Result := rc_paint.right end
	bottom : INTEGER is do Result := rc_paint.bottom end
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

	get_rc_paint : RECT is
		do
			create Result.make_shared (ewg_struct_paintstruct_member_get_rc_paint (item))
		end
	
	rc_paint_impl : RECT
	
invariant
	invariant_clause: True -- Your invariant here

end -- class PAINTSTRUCT
