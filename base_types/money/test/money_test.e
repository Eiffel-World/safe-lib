indexing
	description: "Root class for tests on EMO_MONEY, EMO_CURRENCY";
	author: "Fafchamps Eric"
	
class
	MONEY_TEST

creation

	make

feature -- Initialization

	make is
			-- Initialize
		local
			currency_market: EMO_CURRENCY_MARKET
			shared_currencies: EMO_SHARED_CURRENCIES
			currency_bef: EMO_CURRENCY
			currency_euro: EMO_CURRENCY
			price_1: EMO_MONEY
			price_2: EMO_MONEY
		do

			--| Build a currency market

			!!currency_market.make

			!!currency_bef.make ("BEF", 1.0)
			!!currency_euro.make ("EURO", 0.01)
			
			currency_bef.exchange_rates.force (1.0/40.3399, currency_euro)
			currency_euro.exchange_rates.force (40.3399, currency_bef)
			
			currency_market.currencies.force (currency_bef, currency_bef)
			currency_market.currencies.force (currency_euro, currency_euro)			
			

			--| Share a currency market

			!! shared_currencies
			shared_currencies.def_market (currency_market)


			--| Initialize amounts
			!!price_1.make (2000, shared_currencies.market.currency ("BEF"))
			!!price_2.make (50.345, shared_currencies.market.currency ("EURO"))
			
			io.put_string (price_1.out)
			io.put_new_line

			io.put_string (price_2.out)
			io.put_new_line

			io.readline
		end

end -- class MONEY_TEST

