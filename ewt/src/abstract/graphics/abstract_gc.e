indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

deferred class
	ABSTRACT_GC

inherit
	
	DISPOSABLE_RESOURCE

feature -- Access

	handle : POINTER is
		deferred
		end

	drawable : DRAWABLE is
		deferred
		end

	gc_data : GC_DATA is
		deferred
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

end -- class ABSTRACT_GC
