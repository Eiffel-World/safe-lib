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
			big_test
			from
				!FRENCH_NUMBER_TO_WORDS_CONVERTER!eint_number_to_words_converter
			until 
				terminate
			loop
				io.put_string ("Input a number (-1 to end this test) :%N")
				io.read_double
				a_number := io.last_double
				if a_number = -1 then
					terminate := True
				else
					eint_number_to_words_converter.convert (a_number)
					io.put_string (eint_number_to_words_converter.last_converted)
					io.put_string ("%N")
				end
			end			
		end


feature {NONE} -- Implementation

	big_test is
			-- Test all number from 0.01 to 2.000.000.
			-- (usefull for assertion checking)
		local
			eint_number_to_words_converter: EINT_NUMBER_TO_WORDS_CONVERTER
			a_number: DOUBLE
		do
			from
				!FRENCH_NUMBER_TO_WORDS_CONVERTER!eint_number_to_words_converter
				a_number := 0.01
			until
				a_number >= 2000000
			loop
				eint_number_to_words_converter.convert (a_number)
				a_number := a_number + 0.01
			end
		end	
	
end -- class ROOT_CLASS

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--