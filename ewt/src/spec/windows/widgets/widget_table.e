indexing
	description: "Widget tables"
	author: ""
	date: "$Date: 2003/12/29 21:26:54 $"
	revision: "$Revision: 1.1 $"

class
	WIDGET_TABLE

inherit
	DS_HASH_TABLE[CONTROL, POINTER]
		rename
			make as make_hash_table
		end
		
creation
	make
	
feature {NONE} -- Initialization

	make is
		do
			make_hash_table (1024)
		end
		
feature -- Access

	shells : ARRAY [SHELL] is
		local
			cursor : DS_HASH_TABLE_CURSOR [CONTROL, POINTER]
			shell : SHELL
		do
			create Result.make (1, 0)
			from
				cursor := new_cursor
				cursor.start
			until
				cursor.off
			loop
				shell ?= cursor.item	
				if shell /= Void then
					Result.force (shell, Result.upper + 1)
				end
				cursor.forth
			end
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

end -- class WIDGET_TABLE
