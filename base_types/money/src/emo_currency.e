indexing
	description: "Currency of money";
	Author: "Fafchamps"
	date: "$Date: 2001/09/15 08:37:25 $";
	revision: "$Revision: 1.1 $"

class 
	EMO_CURRENCY

inherit
	HASHABLE
		redefine
			is_equal
		end

creation
	make

feature{NONE} -- Initialization

	make (an_identifier: STRING; a_precision: DOUBLE; a_code: STRING) is
			-- Initialise a new currency with `an_identifier', `a_precision' and `a_code'.
		require
			identifier_exists: an_identifier /= Void
			precision_strict_positive: a_precision > 0.0
			a_code_exists: a_code /= Void
		do
			identifier := an_identifier
			precision := a_precision
			code := a_code
			!!exchange_rates.make (100)
		ensure
			identifier_shared: identifier = an_identifier
			precision_copied: precision = a_precision
			code_shared: code = a_code
		end

feature -- Access
	
	identifier: STRING
			-- Identifier of the currency.		

	code: STRING
			-- Representation as a code.

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := identifier.hash_code
		end

feature -- Status report

	precision: DOUBLE
			-- Smallest possible amount in curency
			-- (e.g 1 cent implies precision = 0.01) 

	decimals: INTEGER is
			-- Number of decimals corresponding to precision.
		local
			p: DOUBLE
		do
			from
				p := precision
				Result := 0	
			until
				p >= 1 
			loop
				Result := Result + 1
				p := p * 10
			end
			ensure
				precision >= 1 implies (Result = 0)
				-- 1 > precision and precision >= 0.1 implies (Result = 1)
				-- 0.1 > precision and precision >= 0.01 implies (Result = 2)
				-- ...
		end


	exchange_rates: DS_HASH_TABLE [DOUBLE, EMO_CURRENCY]
			-- Rates of exchange to another currency.
		
feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is the code of the current currency the same as the code of `other' currency.
		do
			Result := identifier.is_equal(other.identifier)
		end

feature -- Status setting

	def_precision (a_precision: DOUBLE) is
			-- Define precision with `a_precision'.
		require
			strict_positive: a_precision > 0.0
		do
			precision := a_precision
		ensure
			precision_copied: precision = a_precision
		end

invariant
	identifier_exists: identifier /= Void
	precision_strict_positive: precision > 0.0
	code_exists: code /= Void
	exchange_rates_exists: exchange_rates /= Void
	
end -- class EMO_CURRENCY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--