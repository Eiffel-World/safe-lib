indexing
	description: "System's root class";
	note: "Initial version automatically generated"

class
	ROOT_CLASS

creation

	make

feature -- Initialization

	make is
			-- Output a welcome message.
			--| (Automatically generated.)
		local
			eint_number_to_words_converter: EINT_NUMBER_TO_WORDS_CONVERTER
			a_number: DOUBLE
			terminate: BOOLEAN
		do
			from
				!FRENCH_NUMBER_TO_WORDS_CONVERTER!eint_number_to_words_converter
			until 
				terminate
			loop
				io.put_string ("Input a number (0 to end this test) :%N")
				io.read_double
				a_number := io.last_double
				if a_number = 0 then
					terminate := True
				else
					eint_number_to_words_converter.convert (a_number)
					io.put_string (eint_number_to_words_converter.last_converted)
					io.put_string ("%N")
				end
			end			
		end

	
end -- class ROOT_CLASS

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--