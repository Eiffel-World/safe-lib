indexing
	description: "Objects that scan a string representation of an DOUBLE"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

class
	ESC_DOUBLE_SCANNER

inherit 
	ESC_SCANNER [DOUBLE]
		rename
			last_object as last_double
		end

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		local
			estring: ESTRING
		do
			!!estring.make_from_string (a_string)
			if estring.count = 0 then
				last_double := 0.0
				error := Void
			else
				--| Replace , with . to allow both decimal conventions in input
				estring.replace_character_all (',', '.')
				if estring.is_integer then
					last_double := estring.to_integer + 0.0
					error := Void
				else 
					if estring.is_double then
						last_double := estring.to_double
						error := Void	
					else
						!ESC_SYNTAX_ERROR!error.make (estring.string)
					end
				end
			end
		end

end -- class ESC_DOUBLE_SCANNER


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--