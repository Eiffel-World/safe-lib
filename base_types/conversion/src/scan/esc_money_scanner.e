indexing
	description: "Objects that scan a string representation of an EMO_MONEY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

class
	ESC_MONEY_SCANNER

inherit 
	ESC_SCANNER [EMO_MONEY]
		rename
			last_object as last_money
		end


feature -- Status report

	currency: EMO_CURRENCY
			-- Currency of scanned money

feature -- Status setting
	
	def_currency (a_currency: EMO_CURRENCY) is
			-- Define currency with `a_currency'.
		require
			a_currency_exists: a_currency /= Void
		do
			currency := a_currency
		ensure
			currency_defined: currency = a_currency
		end

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		local
			estring: ESTRING
			money: EMO_MONEY
		do
			!!money.make (0.0, currency)
			last_money := money
			!!estring.make_from_string (a_string)
			if estring.count = 0 then
				error := Void
			else
				--| Replace , with . to allow both decimal conventions in input
				estring.replace_character_all (',', '.')
				if estring.is_integer then
					last_money.def_amount (estring.to_integer + 0.0)
					error := Void
				else 
					if estring.is_double then
						last_money.def_amount (estring.to_double)
						error := Void	
					else
						!ESC_SYNTAX_ERROR!error.make (estring.string)
					end
				end
			end
		end

end -- class ESC_MONEY_SCANNER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--