indexing
	description: "Abstract class that offers an access to a model object G"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class
	EMI_REFERENCE [G]

feature -- Access
	
	item: G is
			-- item
		deferred
		end
		
end -- class EMI_REFERENCE

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
