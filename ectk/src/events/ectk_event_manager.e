indexing
	description: "Basic event manager"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:14:20 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECTK_EVENT_MANAGER

feature -- Basic Operations

	do_events is
			-- Handle event loop.
		local
			end_loop : BOOLEAN		
		do
			from
				in_event_loop := True
				initialize
			until
				end_loop
			loop
				get_event
				if event_available then
					on_event
				else
					on_idle
				end
				if exit_condition then
					end_loop := True
				end
			end
			in_event_loop := False
			terminate
		end


feature -- Status


	in_event_loop: BOOLEAN
			-- Is the event manager in the event loop?

	
feature {NONE} -- Implementations

	event_available : BOOLEAN is
			-- is there an available event ?
		deferred
		end

	exit_condition : BOOLEAN is
			-- has the exit condition been met ?
		deferred
		end

	initialize is
			-- initialize event loop
		deferred
		end

	get_event is
			-- get an event
		deferred
		end

	on_event is
			-- process event
		require
			event_available: event_available
		deferred
		end

	on_idle is
			-- idle processing (no event)
		require
			no_event_available: not event_available
		deferred
		end

	terminate is
			-- terminate event loop
		deferred
		end


end -- class ECTK_EVENT_MANAGER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
