indexing
	description: "Objects that can output characters on a medium"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

deferred class
	EREP_OUTPUT_MEDIUM

feature -- Access

	name: STRING is
			-- Medium name
		deferred
		end

feature -- Element change

	put_new_line is
			-- Write a new line character to medium
		require
			is_open_write: is_open_write
		deferred
		end;

	put_string (a_string: STRING) is
			-- Write `a_string' to medium.
		require
			is_open_write: is_open_write
			string_defined: a_string /= Void
		deferred
		end;

	put_character (a_character: CHARACTER) is
			-- Write `a_character' to medium.
		require
			is_open_write: is_open_write
		deferred
		end;

feature -- Status report

	is_open_write: BOOLEAN is
			-- Is this medium opened for output
		deferred
		end

	is_closed: BOOLEAN is
			-- Is the I/O medium open
		deferred
		end;

feature -- Status setting

	close is
			-- Close medium.
		require
			medium_is_open: not is_closed;
		deferred
		end;

end -- class EREP_OUTPUT_MEDIUM

--
-- Copyright: 2001, Paul G. Crismer, Eric Fafchamps
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
