indexing
	description: "Objects that converts a number to it's representation in words"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

deferred class
	EINT_NUMBER_TO_WORDS_CONVERTER

feature -- Access

	last_converted: STRING
			-- Result of last conversion

feature -- Basic operations

	convert (a_double: DOUBLE) is
			-- Convert `a_double' into it's representation in words.
		deferred
		end

end -- class EINT_NUMBER_TO_WORDS_CONVERTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--