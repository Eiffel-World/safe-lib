indexing
	description: "Objects that observes commands on the model"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class
	EMI_OBSERVER

feature -- Basic operations

	on_notification is
			-- Action to be performed on a notification.
		require	
			is_ready: is_ready
		deferred
		end

feature -- Status report

	is_ready: BOOLEAN is
			-- Is `Current' ready to handle notifications.
		deferred
		end
		
end -- class EMI_OBSERVER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
