indexing
	description: "ECTK application"
	Usage: "Root class should inherit from this class"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:15:23 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_APPLICATION

inherit
	CURSES_APPLICATION

creation
	initialize, initialize_323, initialize_44, initialize_444,
	initialize_444i, initialize_55

feature -- Events

	events_catalog: ECTK_EVENTS is
			-- Access to event catalog.
		once
			!!Result
		end


end -- class ECTK_APPLICATION

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
