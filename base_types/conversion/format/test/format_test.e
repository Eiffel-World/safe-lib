indexing
	description: "System's root class";
	note: "Initial version automatically generated"

class
	FORMAT_TEST

creation

	make

feature -- Initialization

	make is
		local
			efmt_double_formatter: EFMT_DOUBLE_FORMATTER
			efmt_integer_formatter: EFMT_INTEGER_FORMATTER
			efmt_money_formatter: EFMT_MONEY_FORMATTER
			i: INTEGER
			estring: ESTRING
		do
			initialize
			from
				!!efmt_integer_formatter.make (10)
				efmt_integer_formatter.show_positive_sign
				i := integer_samples.lower
			until
				i > integer_samples.upper
			loop	
				efmt_integer_formatter.format (integer_samples.item (i))
				!!estring.make_from_string (integer_samples.item (i).out)
				estring.extend_to_count (' ', 20)
				io.put_string (estring.string)
				io.put_string (" ==> ")
				io.put_string (efmt_integer_formatter.last_formatted)
				io.put_new_line
				i := i + 1
			end


			from
				!!efmt_double_formatter.make (20, 0)
				efmt_double_formatter.show_positive_sign
				i := double_samples.lower
			until
				i > double_samples.upper
			loop	
				efmt_double_formatter.format (double_samples.item (i))
				!!estring.make_from_string (double_samples.item (i).out)
				estring.extend_to_count (' ', 20)
				io.put_string (estring.string)
				io.put_string (" ==> ")
				io.put_string (efmt_double_formatter.last_formatted)
				io.put_new_line
				i := i + 1
			end

			from
				!!efmt_money_formatter.make (9)
				efmt_money_formatter.show_positive_sign
				i := money_samples.lower
			until
				i > money_samples.upper
			loop	
				efmt_money_formatter.format (money_samples.item (i))
				!!estring.make_from_string (money_samples.item (i).out)
				estring.extend_to_count (' ', 20)
				io.put_string (estring.string)
				io.put_string (" ==> ")
				io.put_string (efmt_money_formatter.last_formatted)
				io.put_new_line
				i := i + 1
			end

		end;


	integer_samples: ARRAY[INTEGER] is 
			-- Sample of integers.
		once
			Result := <<0,-1,12,123,1234,12345,123456,1234567,12345678>>
		end

	double_samples: ARRAY[DOUBLE] is
			-- Sample of doubles.
		once
			Result := <<-123.456,0.0,1.9,12.98,123.987,1234.9876,12345.98765,1234567.987654,12345678.9876546>>
		end

	money_samples: ARRAY[EMO_MONEY] is
			-- Sample of doubles.
		local
			euro: EMO_CURRENCY
			bef: EMO_CURRENCY
			a_money: EMO_MONEY
			shared_currencies: EMO_SHARED_CURRENCIES
		once			
			!! shared_currencies
			!!Result.make (1,2)

			!!a_money.make (12.34, shared_currencies.market.currencies.item ("EURO")) 
			Result.force (a_money, 1)

			!!a_money.make (1, shared_currencies.market.currencies.item ("BEF")) 
			Result.force (a_money, 2)
		end


feature {NONE} -- Implementation

	initialize is
			-- Initialize environment.
		local
			currency_market: EMO_CURRENCY_MARKET
			shared_currencies: EMO_SHARED_CURRENCIES
			currency_bef: EMO_CURRENCY
			currency_euro: EMO_CURRENCY
		do
			!!currency_market.make

			!!currency_bef.make ("BEF", 1.0, "FR")
			!!currency_euro.make ("EURO", 0.01, "EURO")
			
			currency_bef.exchange_rates.force (1.0/40.3399, currency_euro)
			currency_euro.exchange_rates.force (40.3399, currency_bef)
			
			currency_market.currencies.force (currency_bef, currency_bef.identifier)
			currency_market.currencies.force (currency_euro, currency_euro.identifier)			
			
			--| Share the currency market

			!! shared_currencies
			shared_currencies.def_market (currency_market)
		end

end -- class FORMAT_TEST

