indexing
	description: "Market of currencies"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:37:25 $"
	revision: "$Revision: 1.1 $"

class
	EMO_CURRENCY_MARKET

creation
	make

feature {NONE} -- Initialization
	
	make is
			-- Initialize.
		do
			!!currencies.make (100)
		end

feature -- Access

	currencies: DS_HASH_TABLE [EMO_CURRENCY, STRING]
			-- Table of currencies

end -- class EMO_CURRENCY_MARKET


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--