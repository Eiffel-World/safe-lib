indexing
	description: "Objects that build other objects of type G"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class
	EMI_FACTORY [G]

feature -- Access

	last_created: G is
		deferred
		end

feature -- Basic operation

	create_object is
				-- Create a new object.
		deferred
		end

end -- class EMI_FACTORY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
