indexing
	description: "Objects that converts a number to it's representation in words"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/13 18:09:40 $"
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
