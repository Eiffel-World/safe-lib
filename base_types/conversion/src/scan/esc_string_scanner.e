indexing
	description: "Objects that scan a string representation of an STRING"
	comments: "Could be used to check string patterns e.g all uppercase, all digits .."
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

class
	ESC_STRING_SCANNER

inherit 
	ESC_SCANNER [STRING]
		rename
			last_object as last_string
		end

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		do
			last_string := clone (a_string)
			error := Void		
		end

end -- class ESC_STRING_SCANNER


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--