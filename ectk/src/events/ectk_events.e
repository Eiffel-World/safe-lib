indexing
	description: "Standard Events"
	author: "Fafchamps Eric"
	usage: "use as client relation e.g : events.key_hit_f10"
	date: "$Date: 2001/09/15 07:14:20 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_EVENTS

inherit
	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	ANY


feature -- Event factory

	event (a_key: INTEGER): ECTK_EVENT is
			-- New event for `a_key'.
		do
			if a_key >=  32 and a_key <= 255 then
				!!Result
				Result.set (Character_event_id, a_key)
			else
				if a_key = curses_error_handling.curses_error_value then
					Result := clone (Idle_event)
				else 
					!!Result
					Result.set (a_key, 0)
				end
			end			
		ensure
			defined: Result /= Void
		end

feature -- Events

	back_space_event: ECTK_EVENT is
			-- Event for a backspace ( <-- )
		once
			!!Result
			Result.set (Back_space_code, 0)
		end

	btab_event: ECTK_EVENT is
			-- Event for back tabulation (shift <tab>).
		once
			!!Result
			Result.set (curses_key_constants.Key_BTAB, 0)
		end


	carriage_return_event: ECTK_EVENT is
			-- Event for carriage return.
		once
			!!Result
			Result.set (Carriage_return_code, 0)
		end

	character_event: ECTK_EVENT is
			-- Event for a character.
		once
			!!Result
			Result.set (Character_event_id, Lower_a_code )
		end

	down_event: ECTK_EVENT is
			-- Event for down arrow key.
		once
			!!Result
			Result.set (curses_key_constants.key_down, 0)
		end

	delete_event: ECTK_EVENT is
			-- Event for delete
		once
			!!Result
			Result.set (curses_key_constants.Key_DC, 0)
		end

	end_event: ECTK_EVENT is
			-- Event for end
		once
			!!Result
			Result.set (curses_key_constants.Key_END, 0)
		end

	esc_event: ECTK_EVENT is
			-- Event for Esc key.
		once
			!!Result
			Result.set (27, 0)
		end


	
	f1_event: ECTK_EVENT is
			-- Event for F1
		once
			!!Result
			Result.set (curses_key_constants.key_f(1), 0)
		end

	f2_event: ECTK_EVENT is
			-- Event for F2
		once
			!!Result
			Result.set (curses_key_constants.key_f(2), 0)
		end


	f3_event: ECTK_EVENT is
			-- Event for F3
		once
			!!Result
			Result.set (curses_key_constants.key_f(3), 0)
		end

	f4_event: ECTK_EVENT is
			-- Event for F4
		once
			!!Result
			Result.set (curses_key_constants.key_f(4), 0)
		end

	f5_event: ECTK_EVENT is
			-- Event for F5
		once
			!!Result
			Result.set (curses_key_constants.key_f(5), 0)
		end

	f6_event: ECTK_EVENT is
			-- Event for F6
		once
			!!Result
			Result.set (curses_key_constants.key_f(6), 0)
		end
	f7_event: ECTK_EVENT is
			-- Event for F7
		once
			!!Result
			Result.set (curses_key_constants.key_f(7), 0)
		end
	f8_event: ECTK_EVENT is
			-- Event for F8
		once
			!!Result
			Result.set (curses_key_constants.key_f(8), 0)
		end

	f9_event: ECTK_EVENT is
			-- Event for F9
		once
			!!Result
			Result.set (curses_key_constants.key_f(9), 0)
		end
	f10_event: ECTK_EVENT is
			-- Event for F10
		once
			!!Result
			Result.set (curses_key_constants.key_f(10), 0)
		end
	f11_event: ECTK_EVENT is
			-- Event for F11
		once
			!!Result
			Result.set (curses_key_constants.key_f(11), 0)
		end
	f12_event: ECTK_EVENT is
			-- Event for F12
		once
			!!Result
			Result.set (curses_key_constants.key_f(12), 0)
		end


--	focus_out_event: ECTK_EVENT is
--			-- Event when a widget get's out of focus (the event loop terminates for the widget)
--		once
--			!!Result
--			Result.set (Focus_out_event_id, 0)
--		end

	home_event: ECTK_EVENT is
			-- Event for home.
		once
			!!Result
			Result.set (curses_key_constants.Key_home, 0)
		end

	idle_event: ECTK_EVENT is 
			-- Event for idle.
		once
			!!Result
			Result.set (Idle_event_id, 0)
		end

	insert_event: ECTK_EVENT is 
			-- Event for insert.
		once
			!!Result
			Result.set (curses_key_constants.Key_IC, 0)
		end


	left_event: ECTK_EVENT is 
			-- Event for left arrow key <-.
		once
			!!Result
			Result.set (curses_key_constants.Key_left, 0)
		end

	right_event: ECTK_EVENT is 
			-- Event for right arrow key ->.
		once
			!!Result
			Result.set (curses_key_constants.Key_right, 0)
		end


	tab_event: ECTK_EVENT is
			-- Event for tabulation <tab>.
		once
			!!Result
			Result.set (Tabulation_code, 0)
		end


	terminate_event: ECTK_EVENT is
			-- Event to terminate the application.
		once
			!!Result
			Result.set (Terminate_event_id, 0)
		end

	up_event: ECTK_EVENT is
			-- Event for up arrow key.
		once
			!!Result
			Result.set (curses_key_constants.key_up, 0)
		end


feature {NONE} -- Implementation

	curses_key_constants: CURSES_KEY_CONSTANTS is 
		once 
			!!Result
		end

	curses_error_handling: CURSES_ERROR_HANDLING is
		once
			!!Result
		end

feature {NONE} -- Reserved key values for internal events.
	
	Idle_event_id: INTEGER is 1000

	Terminate_event_id: INTEGER is 1001
	
	Character_event_id: INTEGER is 1002	

--	Focus_out_event_id: INTEGER is 1003

end -- class ECTK_EVENTS


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
