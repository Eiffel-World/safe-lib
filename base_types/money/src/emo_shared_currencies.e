indexing
	description: "Shared currencies of a market"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

class
	EMO_SHARED_CURRENCIES

feature -- Access

	market: EMO_CURRENCY_MARKET is
			-- Shared market.
		do
			Result := cell.item
		end

feature -- Element change

	set_market (a_market: EMO_CURRENCY_MARKET) is
			-- Set market with `a_market'). 
		require
			a_market_exists: a_market /= Void
		do		
			cell.put (a_market)
		ensure
			market_set: market = a_market
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