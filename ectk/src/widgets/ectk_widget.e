indexing
	description: "Objects that display information in a character window, they have a behaviour that executes commands upon user-events"
	author: "Fafchamps"
	date: "$Date: 2001/11/28 10:24:46 $"
	revision: "$Revision: 1.3 $"

deferred class
	ECTK_WIDGET

inherit
	
	EPAT_OBSERVER

	ECTK_SHARED_SYSTEM
		export	
			{NONE} all;
		end

feature -- Access

	window: CURSES_WINDOW
			-- Window in which input/output occurs.

feature -- Behaviour setting

	add_command (a_command: EPAT_COMMAND; an_event: ECTK_EVENT; ) is
			-- Add `a_command object' to handle `an_event'.
		do
			behaviour.force (a_command, an_event)
		end

feature -- Status report
			
	is_editable: BOOLEAN is
			-- Is the data of the current widget editable?
		deferred
		end

	is_ready: BOOLEAN is
			-- Is `Current' ready for it's basic operations?
		do
			Result := window.exists
		ensure then
			Result implies window.exists
		end

	is_event_handler: BOOLEAN
			--  Is Current the widget that handles the events now?

	last_error: UT_ERROR
			-- Last error.

	last_event: ECTK_EVENT
			-- What is the last event?


feature -- Basic operations

	do_events is
			-- Handle event loop.
		require
			is_ready: is_ready
			is_editable: is_editable
		local
			end_loop : BOOLEAN		
		do
			from
				is_event_handler := True
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
			terminate
			is_event_handler := False
		end

	terminate_event_loop is
			-- Terminate the event loop.
		do
			last_event := clone (events_catalog.terminate_event)
		ensure
			-- Control will be returned to caller of do_events.
			-- Window remains open.
		end

feature {NONE} -- Implementation of initialization and behaviour

	initialize_widget is
			-- Initialise widget.
		do
			window.disable_leave_cursor
			window.enable_metacharacters
			window.enable_keypad
			window.enable_blocking_input
			!!last_event
			!!behaviour.make (20)
			initialize_behaviour
		end

	initialize_behaviour is
			-- Initialise behaviour.
		deferred
		end

	behaviour: DS_HASH_TABLE [EPAT_COMMAND,ECTK_EVENT]
			-- Behaviour definition.
	
feature {NONE} -- Implementation of Event handling

	initialize is
			-- Initialize event loop.
		do
			--| Set cursor on origin of widget
			window.move (0, 0)
			window.memory_refresh				
		end
	

	get_event is
			-- Get an event.
		do
			window.do_update --| Best place to update the physical screen in one place in your application (cfr . the Ncurses Introduction paper)
			window.read_character
			last_event := events_catalog.event (window.last_key)
		end

	on_idle is
			-- Idle processing (no event).
		do
		end

	on_event is
			-- Try to handle the last event.
		local
			command: EPAT_COMMAND
			ectk_message: ECTK_MESSAGE			
		do
			behaviour.search (last_event)

			if behaviour.found then
				command := behaviour.found_item
				if command.check_precondition then --| The precondition to handle the event is met
					command.execute
					if command.last_error /= Void then
						!!ectk_message.make ( command.last_error.default_message)
					end
					last_event.set_processed
				end
			end							
		end

	event_available : BOOLEAN is
			-- Is there an available event ?
		do
			Result := not last_event.is_equal (events_catalog.idle_event)
		end

	exit_condition : BOOLEAN is
			-- Has the exit condition been met ?
		do
			Result := (not last_event.is_processed) or (last_event.is_equal (events_catalog.terminate_event))
		end

	terminate is
			-- Terminate the event loop.
		do
		end

feature {NONE} -- Implementation facilities for descendants

	ut_character_codes: UT_CHARACTER_CODES is
			-- Character integer codes
		once
			!!Result
		end

	curses_attribute_constants: CURSES_ATTRIBUTE_CONSTANTS is
			-- Curses attribute constants
		once
			!!Result
		end

	events_catalog: ECTK_EVENTS is
			-- Access to event catalog.
		once
			!!Result
		end

end -- class ECTK_WIDGET

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
