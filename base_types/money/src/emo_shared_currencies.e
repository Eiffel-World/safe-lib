indexing
	description: "Shared currencies of a market"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:37:25 $"
	revision: "$Revision: 1.1 $"

class
	EMO_SHARED_CURRENCIES

feature -- Access

	market: EMO_CURRENCY_MARKET is
			-- Shared market.
		do
			Result := cell.item
		end

feature -- Element change

	def_market (a_market: EMO_CURRENCY_MARKET) is
			-- Define market with `a_market'). 
		require
			a_market_exists: a_market /= Void
		do		
			cell.put (a_market)
		ensure
			market_defined: market = a_market
		end

feature{NONE} -- Implementation	

	cell: DS_CELL[EMO_CURRENCY_MARKET] is
		once
			!!Result.make (Void)
		end

end -- class EMO_SHARED_CURRENCIES


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--