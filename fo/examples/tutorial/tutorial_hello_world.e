indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2006/02/16 17:29:22 $"
	revision: "$Revision: 1.1 $"

class
	TUTORIAL_HELLO_WORLD

inherit
	
	FO_SHARED_FONT_FACTORY
	FO_MEASUREMENT_ROUTINES
	
create
	execute

feature {NONE} -- Initialization

	execute is
			-- Initialize `Current'.
		do
			--| 1
			create writer.make ("hello_world.pdf")
			create document.make (writer)

			--| 2
			document.open
			
			--| 3
			create block.make_default
			
			--| 4
			block.append_string ("Hello World")
			
			--| 5
			document.append_block (block)

			--| 6
			document.close
		end

feature -- Access

	document : FO_DOCUMENT
	
	writer : FO_DOCUMENT_WRITER
	
	block : FO_BLOCK
	
	
end
