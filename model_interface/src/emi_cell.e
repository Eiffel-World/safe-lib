indexing
	description: "Reference to an object of type G, refers to a cell that can contain an item of type G"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:30:02 $"
	revision: "$Revision: 1.2 $"

class
	EMI_CELL [G]

inherit
	EMI_REFERENCE [G]
	
creation
	make
	
feature -- Access
	
	item: G is
			-- Content of cell
		do
			Result := item_i
		end

feature -- Element change

	put, make (an_item: G) is
			-- Insert `an_item' into cell.
		do
			item_i := an_item
		ensure
			inserted: item = an_item 
		end

feature {NONE} -- Implementation

	item_i: G

end -- class EMI_CELL

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
