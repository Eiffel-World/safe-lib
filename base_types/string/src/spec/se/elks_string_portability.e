indexing
	description: "Elks string portability"
	author: "Paul George Crismer, Fafchamps Eric"
	revision: "$revision $"
	date: "$date $"

class ELKS_STRING_PORTABILITY


feature -- Initialization

	from_c (string: STRING; c_string: POINTER) is		
			-- Reset contents of string from contents of c_string,  
			-- a string created by some external C function. 
		require 
			string_exists: string /= Void
			c_string_exists: c_string /= Void 
		do 
			string.from_external (c_string)
		end 

	insert (string: STRING; s:STRING; i:INTEGER) is
			-- Add s to the left of position i in string.
		require
			strings_exists: string /= Void and s /= Void
			index_small_enough: i <= string.count
			index_large_enough: i > 0
		local
			j	 : INTEGER
		do
			from
				j := 1
			until
				j > s.count
			loop
				string.insert_character (s @ j, i + j - 1)
				j := J + 1
			end					
		ensure
			new_count: string.count = old string.count + s.count
		end

end -- ELKS_STRING_PORTABILITY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--