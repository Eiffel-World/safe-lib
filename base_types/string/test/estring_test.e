indexing

	description: "Root class of a test of estring"
	
	author: "Fafchamps Eric"
	date: "$date: $"
	revision: "$Revision: 1.1 $"

class ESTRING_TEST

creation
	make

feature -- Initialization

	make is
			-- Initialization
		local
			estring: ESTRING
			lines: ARRAY [ESTRING]
			i: INTEGER
		do
			!!estring.make_from_string ("This is a sentence which should not fit on a line of 20 columns")
			lines := estring.word_wrapped (20)
			from
				i := lines.lower
			until
				i > lines.upper
			loop
				io.put_string (lines.item (i).string)
				io.new_line
				i := i + 1
			end
		end
		
end -- ROOT_CLASS

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--