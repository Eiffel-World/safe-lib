indexing
	description: "Reference to an object of type G, the reference can be modified"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

class
	EMI_CELL [G]

inherit
	EMI_REFERENCE [G]

feature -- Access
	
	item: G is
			-- item
		do
			Result := item_i
		end

feature -- Element change

	define (an_item: G) is
			-- Define with `an_item'.
		do
			item_i := an_item
		end

feature {NONE} -- Implementation

	item_i: G

end -- class EMI_CELL

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
