indexing
	description: "Command on a model M"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class
	EMI_COMMAND [M]

inherit
	EMI_FEATURE [M]

feature -- Status setting

	add_observer (an_observer: EMI_OBSERVER) is
			-- Add `an_observer'.
		do
			if observers  = Void then
				!!observers.make
			end
			observers.force_last (an_observer)
		end

feature -- Basic operation

	execute is
			-- Execute the command.
		deferred
		end

feature -- {NONE} Implementation

	observers : DS_LINKED_LIST [EMI_OBSERVER]

	notify_observers is
			-- Notify observers.
		do
			if observers /= Void then
				from
					observers.start
				until
					observers.off
				loop
					observers.item_for_iteration.on_notification
					observers.forth
				end
			end
		end

end -- class EMI_COMMAND


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
