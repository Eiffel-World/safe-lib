indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2002/04/15 20:09:28 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_DATA_SOURCE

creation
	make
	
feature {NONE} -- Initialization

	make (cursor : ECLI_DATA_SOURCES_CURSOR) is
			-- create from current item in cursor
		require
			cursor_valid: cursor /= Void and then not cursor.off
		do
			name := clone (cursor.name)
			description := clone (cursor.description)
		end
		
feature -- Access
	
	name : STRING
	
	description : STRING

invariant
	name: name /= Void
	description: description /= Void

end -- class ECLI_DATA_SOURCE
