indexing
	description: "Objects that scan a string representation of an INTEGER"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:40:22 $"
	revision: "$Revision: 1.1 $"

class
	ESC_INTEGER_SCANNER

inherit 
	ESC_SCANNER [INTEGER]
		rename
			last_object as last_integer
		end

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		do
			if a_string.count = 0 then
				last_integer := 0
				error := Void
			else
				if a_string.is_integer then
					last_integer := a_string.to_integer
					error := Void
				else
					!ESC_SYNTAX_ERROR!error.make (a_string)
				end
			end
		end

end -- class ESC_INTEGER_SCANNER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--