indexing
	description: "Interactive SQL";
	author: "Paul G. Crismer"
	date: "$Date: 2001/05/16 13:17:08 $"
	revision: "$Revision: 1.1.1.2 $"
	licensing: "See notice at end of class"
class
	QA_EXAMPLE

creation

	make

feature -- Initialization

	make is
			-- QA_EXAMPLE
		local
			args :  expanded ARGUMENTS
		do
			io.put_string ("Selection of registered participants, by remaining amount to pay%N")
			-- session opening
			if args.argument_count < 3 then
				io.put_string ("Usage: QA_EXAMPLE <data_source> <user_name> <password>%N")
			else
				create session.make (args.argument (1), args.argument (2), args.argument (3))
				session.connect
				if session.has_information_message then
					io.put_string (session.cli_state) 
					io.put_string (session.diagnostic_message)
				end
				if session.is_connected then
					io.put_string ("Connected !!!%N")
				end
				-- definition of statement on session
				create cursor.make (session)
				do_session
			end;
		end
				
	do_session is
		do
			from
				read_command
			until
				last_command.is_equal ("0")
			loop
				io.put_string ("Participants, who still have more than $")
				io.put_string (last_command)
				io.put_string (" to pay%N")
				from
					cursor.start (last_command.to_double)
				until
					not cursor.is_ok or else cursor.off
				loop
					io.put_string (cursor.first_name.item)
					io.put_character ('%T')
					io.put_string (cursor.remaining.to_double.out)
					io.put_character ('%T')
					io.put_string (cursor.state.out)
					io.put_character ('%N')
					cursor.forth
				end
				read_command
			end
			
		end
		
	print_error is
		do
			io.put_string ("** ERROR **%N")
			io.put_string (cursor.diagnostic_message)
			io.put_character ('%N')
		end

feature -- Basic Operations

	read_command is
		-- prompt user
		do
			last_command.copy("")
			io.put_string ("enter value (0=quit) >")
			io.read_line
			last_command.append (io.last_string)
		end

	last_command : STRING is
		once
			create Result.make (1000)

		end

	pad (s : STRING; n : INTEGER) is
			-- pad 's' with 'n' blanks
		local
			i : INTEGER
		do
			from
				i := 1
			until
				i > n
			loop
				s.append_character (' ')
				i := i + 1
			end
		end
			
			
	formatting_buffer : MESSAGE_BUFFER is
		once
			create Result.make (1000)
		end
	
	session : ECLI_SESSION
	
	cursor : PARTICIPANT_BY_REMAINING


end -- class QA_EXAMPLE
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
