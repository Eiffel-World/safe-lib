indexing
	description: "Objects that scan a string representation of a CURRENCY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:40:22 $"
	revision: "$Revision: 1.1 $"

class
	ESC_CURRENCY_SCANNER

inherit 
	ESC_SCANNER [EMO_CURRENCY]
		rename
			last_object as last_currency
		end

	EMO_SHARED_CURRENCIES
		export
			{NONE} all
		end

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		do
			if not market.currencies.has (a_string) then
					!ESC_SYNTAX_ERROR!error.make (a_string)
			else		
				last_currency := clone (market.currencies.item (a_string))
				error := Void
			end		
		end

end -- class ESC_CURRENCY_SCANNER



--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--