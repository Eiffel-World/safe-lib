indexing
	description: "Amount of a currency"
	limitation: "MONEY doesn't inherit of COMPARABLE because order operators (=,<,>,...) can't be symmetric when A.currency /= B.currency"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:37:25 $";
	revision: "$Revision: 1.1 $"

class 
	EMO_MONEY

inherit
	PLATFORM
		redefine
			is_equal, out
		end
creation
	make

feature {NONE} -- Initialization

	make (an_amount: DOUBLE; a_currency: EMO_CURRENCY) is
			-- Initialise with 'an_amount'  of 'a_currency'.
		require
			currency_defined: a_currency /= Void
		do
			currency := a_currency
			amount := an_amount
		ensure
			currency_shared: currency = a_currency
			to_double = an_amount
		end

feature -- Access

	currency: EMO_CURRENCY
			-- Currency (unit of money)


	zero: EMO_MONEY is
			-- Neutral element for addition.
		do
			!!Result.make (0.0, currency)
		end

feature -- Status report

	is_zero: BOOLEAN is
			-- Is this the neutral element for addition?
		do
			Result := to_double = 0.0
		ensure
			Result = (to_double = 0.0)
		end

	is_positive: BOOLEAN is 
			-- Is this a positive amount of money?
		do
			Result := to_double > 0.0
		ensure
			Result = (to_double > 0.0)
		end

	is_negative: BOOLEAN is
			-- Is this a negative amount of money?
		do
			Result := to_double < 0.0
		ensure
			Result = (to_double < 0.0)
		end
 
feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current money equal to `other' money.
		do
			Result := currency.is_equal (other.currency) and to_double = other.to_double
		ensure then
			Result = (currency.is_equal (other.currency) and to_double = other.to_double)
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current ?
		require
			other_exists: other /= Void
			same_currency: currency.is_equal (other.currency)
		do
			Result :=  amount < other.to_double
		ensure
			Result = (to_double < other.to_double)
		end

	infix "<=" (other: like Current): BOOLEAN is
			-- Is current object less than or equal to `other'?
		require
			other_exists: other /= Void
			same_currency: currency.is_equal (other.currency)
		do
			Result := (Current < other) or is_equal (other)
		ensure
			Result = ((Current < other) or is_equal (other))
		end;

	infix ">" (other: like Current): BOOLEAN is
			-- Is current object greater than `other'?
		require
			other_exists: other /= Void
			same_currency: currency.is_equal (other.currency)
		do
			Result := other < Current
		ensure
			Result = (other < Current)
		end;

	infix ">=" (other: like Current): BOOLEAN is
			-- Is current object greater than or equal to `other'?
		require
			other_exists: other /= Void
			same_currency: currency.is_equal (other.currency)
		do
			Result := (other < Current) or is_equal (other)
		ensure
			Result = ((other < Current) or is_equal (other))
		end;

feature -- Element change

	def_amount (an_amount: DOUBLE) is
			-- Define amount with `an_amount'.
		do
			amount := an_amount
		ensure
			to_double = an_amount
		end

	round_and_fit is
			-- Round and fit amount to precision.
		local
			estring : ESTRING
		do
			amount := amount + currency.precision / 2.0

			if (amount / currency.precision).abs < 2 ^ (integer_bits - 1) then --| within INTEGER range => floor can be used
				amount := (amount / currency.precision).floor * currency.precision
			else --| floor can't be used -> use estring to exceeding decimals
				!!estring.make_from_string (amount.out)
				if estring.has ('.') then
					estring.head (estring.index_of ('.', 1) + currency.decimals)
					amount := estring.string.to_double
				end	
			end		
		end

	add (other: like Current) is
			-- Add `other' to `Current'.
		require
			same_currency: currency.is_equal (other.currency)
		do
			amount := to_double + other.to_double
		ensure
			to_double <= (old to_double + other.to_double + currency.precision) and to_double >= (old to_double + other.to_double - currency.precision)			
		end

	multiply (a_double: DOUBLE) is
			-- Multiply `Current' with `a_double'
		do
			amount := amount * a_double
		ensure
			to_double <= ((old to_double * a_double) + currency.precision) and to_double >= ((old to_double * a_double) - currency.precision)			
		end			

	divide (a_double: DOUBLE) is
			-- Divide `Current' with `a_double'
		do
			amount := amount / a_double
		ensure
			to_double <= ((old to_double / a_double) + currency.precision) and to_double >= ((old to_double / a_double) - currency.precision)			
		end			

feature -- Basic operations 

	infix "+" (other: like Current): like Current is
			-- Sum with `other'
		require
			same_currency: currency.is_equal (other.currency)
		do
			!!Result.make(amount + other.to_double, currency);
		ensure
			result_exists: Result /= void
		end

	infix "-" (other: like Current): like Current is
			-- Result of substracting `other'
		require
			same_currency: currency.is_equal (other.currency)
		do
			!!Result.make(amount - other.to_double, currency);
		ensure
			result_exists: Result /= void
		end

	infix "*" (a_double: DOUBLE): like Current is
			-- Result of product with `a_double
		do
			!!Result.make(amount * a_double, currency);
		ensure
			result_exists: Result /= void
		end

	infix "/" (a_double: DOUBLE): like Current is
			-- Result of division by `a_double'
		require
			quantity_not_zero: a_double /= 0.0
		do
			!!Result.make(amount / a_double, currency);
		ensure
			result_exists: Result /= void
		end

	prefix "+": like Current is
			-- Unary plus
		do
			!!Result.make( + amount, currency)
		ensure
			result_exists: Result /= void
		end;

	prefix "-": like Current is
			-- Unary minus
		do
			!!Result.make(- amount, currency)
		ensure
			result_exists: Result /= void
		end;

feature -- Conversion

	exchanged_to (a_currency: EMO_CURRENCY): EMO_MONEY is
			-- Current exchanged to `a_currency'
		require
			has_exchange_rate: currency.exchange_rates.has (a_currency)
		do
			!!Result.make (amount * currency.exchange_rates.item (a_currency), a_currency)
		ensure
			equivalent_in_currency: Result /= Void
		end

	to_double: DOUBLE is
			-- Converted to double value
		do
			Result := amount
		end

feature -- Output

	out: STRING is
			-- String representation.
		do
			Result := to_double.out
			Result.append_string (" ")
			Result.append_string (currency.identifier)
		end

feature {NONE} -- Implementation


	amount: DOUBLE 
			-- Internal representation

	maximum_integer: INTEGER is
			-- Maximum absolute value of INTEGER type.
		once
			Result := (integer_bits - 1 ^ 2).floor
		end

	standard_formatter: EFMT_MONEY_FORMATTER is
			-- Standard formatter for money (used to convert a string representation to a double)
		once
			!!Result.make (40)
			Result.def_padding_character (' ')
			Result.def_overflow_character ('*')	
			Result.def_prefix_string (Void)
			Result.def_suffix_string (Void)
			Result.left_justify
			Result.enable_size_reduction
			Result.def_thousand_separator (',')
			Result.hide_positive_sign
			Result.show_negative_sign
			Result.show_zero
			Result.disable_zero_prefix
			Result.hide_thousand_separator
			Result.def_decimal_character ('.')
			Result.show_trailing_zero
			Result.def_no_decimals_filler (Void)	
		end

invariant
	currency_defined: currency /= Void

end -- class EMO_MONEY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--