indexing
	description: "Shared access to ectk system"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/14 19:12:32 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_SHARED_SYSTEM

feature -- Shared item

	ectk_system : ECTK_SYSTEM is
		once
			!!Result
		end

end -- class ECTK_SHARED_SYSTEM

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
