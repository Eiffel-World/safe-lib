indexing
	description: "Objects that build other objects of type G"
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:20:39 $"
	revision: "$Revision: 1.1 $"

deferred class
	EPAT_FACTORY [G]

feature -- Access

	last_created: G is
		deferred
		end

feature -- Basic operation

	create_object is
				-- Create a new object.
		deferred
		end

end -- class EPAT_FACTORY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
