indexing
	description: "DECIMAL numbers.  Following the 'General Decimal Arithmetic Specification'."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/02/06 22:42:26 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	EDA_DECIMAL

inherit
	EDA_NUMERIC
		redefine
			out, is_equal, copy, infix "+", infix "-", prefix "+", prefix "-"
		end

	EDA_CONSTANTS
		export 
			{NONE} all;
			{ANY} Maximum_integer_as_decimal, Minimum_integer_as_decimal
		undefine
			out, is_equal, copy
		end
		
	KL_PART_COMPARABLE
		undefine
			out, is_equal, copy
		end

	EDA_SHARED_MATH_CONTEXT
		export
			{NONE} all;
			{ANY} shared_decimal_context, set_shared_decimal_context
		undefine
			out, is_equal, copy
		end
	
	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all
		undefine
			out, is_equal, copy
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all
		undefine
			out, is_equal, copy
		end
		
creation
--	make, 
	make_from_integer, 
	make_from_string,
	make_from_string_ctx,
	make_zero,
	make
	
feature {NONE} -- Initialization

	make (precision : INTEGER) is
			-- make using `precision' digits
		require
			positive_precision: precision > 0
		do
			!EDA_COEFFICIENT_IMP!coefficient.make (precision)
			set_positive
			coefficient.put (0, 0)
		ensure
			zero: is_zero
		end

	make_zero is
			-- make zero
		do
			make (1)
		ensure
			zero: is_zero
		end
		
	make_from_integer (value : INTEGER) is
			-- make a new decimal from integer `value'
		local
			temp_value, v, index, ten_exponent : INTEGER
		do
			-- sign handling
			temp_value := value
			if value >= 0 then
				set_positive
				temp_value := -temp_value
			else
				set_negative
			end
			v := temp_value
			-- calculate size of coefficient
			from
				ten_exponent := 0
			until
				v = 0
			loop
				v := v // 10
				if v /= 0 then
					ten_exponent := ten_exponent + 1
				end
			end
			-- create coefficient
			!EDA_COEFFICIENT_IMP!coefficient.make (ten_exponent+1)
			-- fill it, from least significant digit (lower index) to most significant (upper index) digit
			if temp_value = 0 then
				coefficient.put (0,0)
			else
				from 
					index := 0 --ten_exponent
					v := temp_value
				until
					v = 0
				loop
					coefficient.put (- (v\\10),index)
					v := v // 10
					if v /= 0 then
						index := index + 1
					end
				end
			end
		end

	make_from_string_ctx (value_string : STRING; ctx : EDA_MATH_CONTEXT) is
			-- make a new decimal from `value_string' relative to `ctx'
		require
			value_string_exists: value_string /= Void --and then value_string.count > 0
			context_exists: ctx /= Void
		local
			parser : EDA_DECIMAL_TEXT_PARSER
			e : expanded EXCEPTIONS
			invalid_nan : BOOLEAN
		do
			!!parser
			parser.decimal_parse (value_string)
			--! TODO : CHECK if error
			invalid_nan := ((parser.is_nan or else parser.is_snan) and then parser.coefficient_sign /= '%U')
			if parser.error or else invalid_nan then 
				if ctx.is_extended then
					!EDA_COEFFICIENT_IMP!coefficient.make (1)
					coefficient.put (0, 0)
					set_quiet_nan
				else					
					if invalid_nan then
						e.raise ("Sign with NaN or sNaN")
					else
						e.raise (parser.error_message)
					end
				end
			else
				-- Set the sign indicator
				if parser.coefficient_sign = '-' then
					set_negative
				else
					set_positive
				end
				-- Check for special values
				if parser.is_special then
					make_special (parser)
				else
					make_standard (parser, ctx)
				end
				-- Trailing zeros are preserved
			end
		end
		
	make_from_string (value_string : STRING) is
			-- make a new decimal from string `value_string' relative to `shared_decimal_context'
		require
			value_string_exists: value_string /= Void --and then value_string.count > 0
		do
			make_from_string_ctx (value_string, shared_decimal_context)
		end
		
feature -- Access

	one: like Current is
			-- Neutral element for "*" and "/"
		do
			!!Result.make_from_integer (1)
		end
		
	zero: like Current is
			-- Neutral element for "+" and "-"
		do
			!!Result.make_from_integer (0)
		end

	sign : INTEGER is
			-- sign of Current
		do
			if is_negative then
				Result := -1
			else
				Result := 1
			end
		ensure
			definition1: Result = -1 implies is_negative
			definition2: Result = 1 implies is_positive
		end

	exponent : INTEGER
			-- current exponent
			
	adjusted_exponent : INTEGER is
			-- exponent of the most significant digit; see SDAS page 5
		do
			Result := exponent + count - 1
		ensure
			definition: Result = (exponent + count - 1)
		end

feature {EDA_DECIMAL, EDA_DECIMAL_PARSER} -- Access

	coefficient : EDA_COEFFICIENT
			-- storage for digits

feature -- Status report

	is_integer : BOOLEAN is
			-- is this an integer ? i.e. no fractional part other than all zeroes?
		local
			fractional_count, index : INTEGER
		do
			if exponent < 0 then
				if adjusted_exponent >= 0 then
					fractional_count := -exponent
					from
						index := fractional_count.min (count)
					variant
						index
					until
						index <= 0 or else coefficient.item (index - 1) /= 0					
					loop
						index := index - 1
					end
					Result := index = 0
				else
					Result := False
				end
			else
				Result := True
			end
		end

	is_double : BOOLEAN is
			-- is this a double ?
		local
			str : STRING
		do
			str := to_scientific_string
			Result := str.is_double
		end
		
	divisible (other: like Current): BOOLEAN is
			-- May current object be divided by `other'?
		do
			--| TODO
		end
		
	exponentiable (other: NUMERIC): BOOLEAN is
			-- May current object be elevated to the power `other'?
		do
			--| TODO	
		end

	is_negative : BOOLEAN
			-- is the number negative ?
	
	is_positive : BOOLEAN is
			-- is the number positive ?
		do 
			Result := not is_negative 
		end
		
	is_nan : BOOLEAN is
			-- is this "Not a Number" (NaN) ?
		do
			Result := is_signaling_nan or is_quiet_nan
		ensure
			definition: Result = (is_signaling_nan or is_quiet_nan)
		end
		
	is_special : BOOLEAN is
			-- is this a special value ?
		do
			Result := (special /= Special_none) --is_nan or else is_infinity		
		ensure
			definition: Result = (is_nan or else is_infinity)
		end
		
	is_signaling_nan : BOOLEAN is
			-- is this a "Signaling NaN" ?
		do
			Result := (special = Special_signaling_nan)
		end
		
	is_quiet_nan : BOOLEAN is
			-- is this a "Quiet NaN" ?
		do
			Result := (special = Special_quiet_nan)
		end

	is_infinity : BOOLEAN is
			-- is this an Infinity ?
		do
			Result := (special = Special_infinity)
		end

	is_zero : BOOLEAN is
			-- is this a Zero value ?
		do
			if not is_special and then coefficient.is_zero then
				Result := True
			end
		ensure
			definition: Result implies (coefficient.count = 1 and then 
				coefficient.item (0) = 0)
		end
		
feature -- Basic operations

	infix "*" (other: like Current): like Current is
			-- Product by `other'
		do
			Result := multiply (other, shared_decimal_context)
		end

	prefix "+": like Current is
			-- Unary plus
		do
			Result := plus (shared_decimal_context)
		end
		
	infix "+" (other: like Current): like Current is
			-- Sum with `other' (commutative).
		do
			Result := add (other, shared_decimal_context)	
		end
		
	prefix "-": like Current is		
			-- Unary minus
		do
			Result := minus (shared_decimal_context)
		end

	infix "-" (other: like Current): like Current is
			-- Result of subtracting `other'
		do
			Result := subtract (other, shared_decimal_context)
		end
		
	infix "/" (other: like Current): like Current is
			-- Division by `other'
		do
			Result := divide (other, shared_decimal_context)	
		end
		
	infix "\\" (other : like Current) : like Current is
			-- Remainder of integer division
		do
			Result := remainder (other, shared_decimal_context)
		end
		
	infix "//" (other : like Current) : like Current is
			-- Integer division
		do
			Result := divide_integer (other, shared_decimal_context)
		end
		
	infix "<" (other : like Current) : BOOLEAN is
		local
			res : EDA_DECIMAL
		do
			res := compare (other, shared_decimal_context)
			if res.is_negative then
				Result := True
			end
		end
		
feature -- Measurement
	
	count : INTEGER is
			-- count of significant digits
		do
			if is_special then
				Result := 0
			else
				Result := coefficient.count
			end
		ensure
			zero_when_special: is_special implies Result = 0
		end
		
feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

	to_double : DOUBLE is
			-- Current as a double
		require
			is_double: is_double
		local
			str : STRING
		do
			str := to_scientific_string
			if str.is_double then
				Result := str.to_double
			end
		end
		
	to_integer : INTEGER is
			-- Current as an INTEGER
		require
			is_integer: is_integer
			within_limits: Current <= Maximum_integer_as_decimal or else Current >= Minimum_integer_as_decimal
		local
			ctx : EDA_MATH_CONTEXT
		do
			create ctx.make_double
			Result := to_integer_ctx (ctx)
		end
	
	to_integer_ctx (ctx : EDA_MATH_CONTEXT) : INTEGER is
			-- Current as an INTEGER
		require
			is_integer: is_integer
			within_limits: Current <= Maximum_integer_as_decimal or else Current >= Minimum_integer_as_decimal
		local
			temp : like Current
			index : INTEGER
		do
			temp := round_to_integer (ctx)
			from
				index := temp.count - 1
				Result := 0
			variant 
				index 
			until
				index < 0
			loop
				Result := Result * 10 + temp.coefficient.item (index)
				index := index - 1
			end
			if is_negative then
				Result := -Result
			end
		end
		
	to_engineering_string : STRING is
			-- Current as a number in engineering notation
		do
			Result := to_string_general (True)
		end
		
	to_scientific_string : STRING is
			-- Current as a sting expressed in scientific notation.
		do
			Result := to_string_general (False)
		end
		
	to_string_general (is_engineering : BOOLEAN) : STRING is
			-- 
		local
			str_coefficient : STRING
			str_zero_pad : STRING
			index, after_point_count, the_exponent, printed_exponent, exponent_difference : INTEGER
			digits_before_point : INTEGER
			exponential : BOOLEAN
		do
			!!Result.make (0)
			if is_special then
				if is_quiet_nan then
					Result.append ("NaN")
				elseif is_signaling_nan then
					Result.append ("sNaN")
				else
					if is_negative then
						Result.append ("-")
					end
					Result.append ("Infinity")
				end	
			else
				-- coefficient conversion
				if is_negative then
					Result.append ("-")
				end
				!!str_coefficient.make (count)
				from
					index := count - 1
				until
					index < 0
				loop
					str_coefficient.append_character (INTEGER_.to_character(('0').code + coefficient.item (index)))	
					index := index - 1
				end
				-- determine if exponential notation shall be used
				the_exponent := adjusted_exponent
				exponential := not (exponent <= 0 and then adjusted_exponent >= - 6) -- (exponent > 0 or else the_exponent < -6) --or else (exponent > 0 and then formatting_style /= Format_plain)
				if exponential then
					printed_exponent := the_exponent
					if is_engineering then
						from
							
						until
							printed_exponent \\ 3 = 0
						loop
							printed_exponent := printed_exponent - 1
						end
						exponent_difference := the_exponent - printed_exponent
						if not is_zero then
							digits_before_point := 1 + exponent_difference
							from						
							until
								str_coefficient.count >= digits_before_point
							loop
								str_coefficient.append_character ('0')
							end
						else
							digits_before_point := 1
						end
					else
						digits_before_point := 1
					end
					if str_coefficient.count > digits_before_point then
						Result.append (str_coefficient.substring (1, digits_before_point))
						Result.append_character ('.')
						Result.append (str_coefficient.substring (digits_before_point + 1, str_coefficient.count))
					else
						Result.append (str_coefficient)
					end
					if printed_exponent /= 0 then
						Result.append_character ('E')
						if the_exponent < 0 then
							Result.append_character ('-')
						else
							Result.append_character ('+')
						end
						Result.append ((printed_exponent.abs).out)
					end
				else
					if exponent < 0 then
						after_point_count := exponent.abs
						if after_point_count > str_coefficient.count then
							str_zero_pad := STRING_.make_filled ('0', after_point_count - str_coefficient.count)
							Result.append ("0.")
							Result.append (str_zero_pad)
							Result.append (str_coefficient)
						elseif after_point_count = str_coefficient.count then
							Result.append ("0.")
							Result.append (str_coefficient)
						else
							Result.append (str_coefficient.substring (1, str_coefficient.count - after_point_count))
							Result.append (".")
							Result.append (str_coefficient.substring (str_coefficient.count - after_point_count + 1, str_coefficient.count))
						end
					else
						Result.append (str_coefficient)			
					end
				end
			end
		end
		
feature -- Comparison

	is_equal (other : like Current) : BOOLEAN is
		local
			comparison_result : like Current
		do
			if is_nan and then other.is_nan then
				if is_quiet_nan then
					Result := other.is_quiet_nan
				elseif is_signaling_nan then
					Result := other.is_signaling_nan
				end
			elseif is_infinity and then other.is_infinity then
				Result := (sign = other.sign)
			else
				comparison_result := compare (other, shared_decimal_context)
				if comparison_result.is_zero then
					Result := True
				end
			end
		end
		

feature -- Conversion

	out : STRING is
			-- printable representation
		do
			!!Result.make (0)
			Result.append ("[")
			--sign
			if is_negative then
				Result.append ("1")
			else
				Result.append ("0")
			end
			-- coefficient
			Result.append (",")
			if is_infinity then
				Result.append ("inf")	
			elseif is_signaling_nan then
				Result.append ("sNaN")
			elseif is_quiet_nan then
				Result.append ("qNaN")
			else
				Result.append (coefficient.out)				
				-- exponent
				Result.append (",")
				Result.append (exponent.out)
			end
			Result.append ("]")
		end
		
feature -- Duplication

	copy (other : like Current) is
		do
			if coefficient = Void then
				coefficient := clone (other.coefficient)
			else
				coefficient.copy (other.coefficient) -- := clone (other.coefficient)
			end
			exponent := other.exponent
			is_negative := other.is_negative
			special := other.special
--			formatting_style := other.formatting_style
		end
		
feature -- Miscellaneous

feature -- Basic operations

	add (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- add `other' with respect to the `ctx' context
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b : like Current
		do
			--| special values are handled in a special way
			if is_special or else other.is_special then
				Result := add_special (other, ctx)
			else
				--| Addition of non-special values
				--| instantiate "registers"
				create operand_a.make (ctx.digits+1); operand_a.copy (Current) --operand_a := clone (Current); operand_a.set_positive
				create operand_b.make (ctx.digits+1); operand_b.copy (other) -- operand_b := clone (other); operand_b.set_positive
				----| round if necessary
				--operand_a.prepare_operand (ctx)
				--operand_b.prepare_operand (ctx)
				if is_negative and then other.is_positive then
					--| -a + b = (b-a)						 
					operand_b.unsigned_subtract (operand_a, ctx)
					Result := operand_b
				elseif is_negative and then other.is_negative then
					--| -a + -b = - (a+b)
					operand_a.unsigned_add (operand_b, ctx)
					Result := operand_a
					Result.set_negative
				elseif is_positive and then other.is_negative then
					--| a + -b = (a-b)
					operand_a.unsigned_subtract (operand_b, ctx)
					Result := operand_a
				else
					--| a + b = (a+b)
					operand_a.unsigned_add (operand_b, ctx)
					Result := operand_a
				end
				if Result.is_zero then
					if (Current.is_negative and then other.is_negative) or else (ctx.rounding_mode = Round_floor and then Current.sign /= other.sign) then
						Result.set_negative
					else
						Result.set_positive
					end
				end
				Result.clean_up (ctx)
			end
		end

	subtract (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- subtract `other' with respect to the `ctx' context
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_b : like Current
		do
			--| special values are handled in a special way
			if is_special or else other.is_special then
				Result := subtract_special (other, ctx)
			else
				--| a + b = a + (-b)
				operand_b := clone (other)
				if operand_b.is_positive then
					operand_b.set_negative
				else
					operand_b.set_positive
				end
				Result := add (operand_b, ctx)
			end
		end

	multiply (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- multiply `other' whith respect to `ctx'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b : like Current
		do
--			Result := clone(zero)
			--|	specials
			if is_special or else other.is_special then
				-- sNan
				create Result.make (ctx.digits)
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation ,"sNan in multiply")
					end
					Result.set_quiet_nan
				elseif is_infinity or else other.is_infinity then
					if is_zero or else other.is_zero then
						ctx.signal (Signal_invalid_operation ,"0 * Inf")
						Result.set_quiet_nan
					else
						Result.set_infinity
						if sign = other.sign then
							Result.set_positive
						else
							Result.set_negative
						end
					end
				end
			else
				if is_zero or else other.is_zero then
					create Result.make (ctx.digits)
					Result.set_exponent (Current.exponent + other.exponent)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
				else
					operand_a := clone (Current)
					operand_b := clone (other)
					--| round if necessary
					--operand_a.prepare_operand (ctx)
					--operand_b.prepare_operand (ctx)
					create Result.make (operand_a.count + operand_b.count + 2)
					Result.coefficient.integer_multiply (operand_a.coefficient, operand_b.coefficient)
					Result.set_exponent (operand_a.exponent + operand_b.exponent)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					Result.clean_up (ctx)
				end
			end
		end
		
	divide (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- divide Current by `other' whith respect to `ctx'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		do
--			a E m / b E n = a/b E m-n
			Result := do_divide (other, ctx, division_standard)
		end

		
	divide_integer (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- divide integer Current by `other' whith respect to `ctx'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		do
			Result := do_divide (other, ctx, division_integer)
		end
	
	remainder (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- remainder of integer division of Current by `other' whith respect to `ctx'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void
		do
			if is_special or else other.is_special then
				-- sNan
				Result := clone (zero)
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation ,"sNan in remainder")
					end
					Result.set_quiet_nan
				elseif is_infinity then
					ctx.signal (Signal_invalid_operation ,"[+-] Inf dividend in remainder")
					Result.set_quiet_nan
				elseif other.is_infinity then
					check
						Result.is_zero
					end
					Result := clone (Current)
					if is_negative then
						Result.set_negative
					end						
				end
			else
				if other.is_zero then
					Result := clone (zero)
					ctx.signal (Signal_invalid_operation ,"Zero divisor in remainder")
					Result.set_quiet_nan
				elseif Current.is_zero then
						Result := clone (zero)
						if exponent < 0 then
							Result.set_exponent (Current.exponent)
						else
							Result.set_exponent (0)
						end
						if is_negative then
							Result.set_negative
						end						
				else	
						Result := internal_divide (other, ctx, division_remainder)
						if is_negative then
							Result.set_negative
						end
						Result.clean_up (ctx)
				end
			end
		end

	rescale (new_exponent : INTEGER; ctx : EDA_MATH_CONTEXT) : like Current is
			-- decimal from Current rescaled to `new_exponent'
		require
			context_not_void: ctx /= Void
		local
			shared_digits, digits_upto_new_exponent, exponent_delta : INTEGER
			saved_exponent_limit, result_count : INTEGER
		do
			--Result := clone (Current)
			if not (new_exponent <= ctx.exponent_limit and then new_exponent >= ctx.e_tiny) then
				ctx.signal (Signal_invalid_operation, "new exponent is not within limits [Etiny..Emax]")
				create Result.make (1)
				Result.set_quiet_nan			
			else
				--Result.do_rescale (new_exponent, ctx)
				-- rescale to new_exponent
				if is_special then
					Result := clone (Current)
					Result.do_rescale_special (ctx)
				elseif exponent < new_exponent then
					-- same as underflowing to e_tiny where e_tiny = new_exponent
					if not is_zero then
						shared_digits := adjusted_exponent - new_exponent + 1
						if shared_digits < 0 then 
							-- impossible to share any digit with new_exponent 
							--grow (ctx.digits + count + 1)
							result_count := ctx.digits+count+1
						elseif shared_digits = 0 then 
							-- msd at new_exponent - 1.  See if rounding shall carry some new_exponent digit
							--local_context := underflowing_context (1, ctx.rounding_mode)
							--grow (ctx.digits + count)
							result_count := ctx.digits+count
						else  -- shared_digits > 0 (and shared_digits <= ctx.digits)
							--grow (ctx.digits + (count - shared_digits))
							result_count := ctx.digits+(count-shared_digits)
						end
						create Result.make (result_count)
						Result.copy (Current)
						Result.coefficient.set_count (result_count)
						Result.round (ctx)
						Result.strip_leading_zeroes
						if Result.is_underflow (ctx) then
							Result.do_underflow (ctx)
						end
						if ctx.is_flagged (Signal_subnormal) and then ctx.is_flagged (Signal_inexact) then
							ctx.signal (Signal_underflow, "Underflow when rescaling")
						end
						if Result.is_overflow (ctx) then
							Result.do_overflow (ctx)
						end
						if exponent > new_exponent then
							Result.shift_left (exponent - new_exponent)
						end
					else
						Result := clone (Current)
					end
					Result.set_exponent (new_exponent)
				elseif exponent > new_exponent then
					if not is_zero then
						digits_upto_new_exponent := adjusted_exponent - new_exponent + 1
						if digits_upto_new_exponent > ctx.digits then
							--| there should be an overflow
							create Result.make (count + 1)
							Result.copy (Current)
							Result.shift_left (1)
							saved_exponent_limit := ctx.exponent_limit
							--| make sure overflow can be called
							ctx.set_exponent_limit (count - 1)
							Result.set_exponent (1) --adjusted_exponent.abs - 1)
							Result.do_overflow (ctx)
							if not Result.is_special then
								Result.set_exponent (new_exponent)
							end
							ctx.set_exponent_limit (saved_exponent_limit)
						else
							exponent_delta := exponent - new_exponent
							create Result.make (count + exponent_delta)
							Result.copy (Current)
							Result.shift_left (exponent_delta)
						end
					else
						--| is_zero
						if new_exponent < 0 and then exponent < 0 and then count > 1 then
							--| "decimal places" have some importance
							digits_upto_new_exponent := -new_exponent + 1							
						else
							digits_upto_new_exponent := 1
						end
						if digits_upto_new_exponent > ctx.digits then
							--| there should be an overflow
							create Result.make (count+1)
							Result.copy (Current)
							Result.shift_left (1)
							saved_exponent_limit := ctx.exponent_limit
							ctx.set_exponent_limit (Result.adjusted_exponent-1)
							Result.do_overflow (ctx)
							ctx.set_exponent_limit (saved_exponent_limit)
						else
							--| no overflow
							if digits_upto_new_exponent > 1 then
								--| by definition exponent < 0 and count > 1
								exponent_delta := exponent - new_exponent
								create Result.make (count + exponent_delta)
								Result.copy (Current)
								Result.shift_left (exponent_delta)
							else
								Result := clone (Current)
							end
							Result.set_exponent (new_exponent)
						end
					end
					Result.clean_up (ctx)
				else
					--| new_exponent = exponent
					--| still detect conditions
					Result := clone (Current)
					Result.clean_up (ctx)
				end
			end	
		end
		
--	do_rescale (new_exponent : INTEGER; ctx : EDA_MATH_CONTEXT) is
--			-- rescale current to new_exponent
--		require
--			context_not_void: ctx /= Void
--			new_exponent_valid: new_exponent <= ctx.exponent_limit and new_exponent >= ctx.e_tiny
--		local
--			shared_digits, digits_upto_new_exponent, exponent_delta : INTEGER
--			saved_exponent_limit : INTEGER
--		do
--			-- rescale to new_exponent
--			if is_special then
--				do_rescale_special (ctx)
--			elseif exponent < new_exponent then
--				-- same as underflowing to e_tiny where e_tiny = new_exponent
--				if not is_zero then
--					shared_digits := adjusted_exponent - new_exponent + 1
--					if shared_digits < 0 then 
--						-- impossible to share any digit with new_exponent 
--						grow (ctx.digits + count + 1)
--					elseif shared_digits = 0 then 
--						-- msd at new_exponent - 1.  See if rounding shall carry some new_exponent digit
--						--local_context := underflowing_context (1, ctx.rounding_mode)
--						grow (ctx.digits + count)
--					else  -- shared_digits > 0 (and shared_digits <= ctx.digits)
--						grow (ctx.digits + (count - shared_digits))
--					end
--					round (ctx)
--					strip_leading_zeroes
--					if is_underflow (ctx) then
--						do_underflow (ctx)
--					end
--					if ctx.is_flagged (Signal_subnormal) and then ctx.is_flagged (Signal_inexact) then
--						ctx.signal (Signal_underflow, "Underflow when rescaling")
--					end
--					if is_overflow (ctx) then
--						do_overflow (ctx)
--					end
--					if exponent > new_exponent then
--						shift_left (exponent - new_exponent)
--					end
--				end
--				exponent := new_exponent
--			elseif exponent > new_exponent then
--				if not is_zero then
--					digits_upto_new_exponent := adjusted_exponent - new_exponent + 1
--					if digits_upto_new_exponent > ctx.digits then
--						--| there should be an overflow
--						shift_left (1)
--						saved_exponent_limit := ctx.exponent_limit
--						--| make sure overflow can be called
--						ctx.set_exponent_limit (count - 1)
--						exponent := 1 --adjusted_exponent.abs - 1)
--						do_overflow (ctx)
--						if not is_special then
--							exponent := new_exponent
--						end
--						ctx.set_exponent_limit (saved_exponent_limit)
--					else
--						exponent_delta := exponent - new_exponent
--						shift_left (exponent_delta)
--					end
--				else
--					--| is_zero
--					if new_exponent < 0 and then exponent < 0 and then count > 1 then
--						--| "decimal places" have some importance
--						digits_upto_new_exponent := -new_exponent + 1							
--					else
--						digits_upto_new_exponent := 1
--					end
--					if digits_upto_new_exponent > ctx.digits then
--						--| there should be an overflow
--						shift_left (1)
--						saved_exponent_limit := ctx.exponent_limit
--						ctx.set_exponent_limit (adjusted_exponent-1)
--						do_overflow (ctx)
--						ctx.set_exponent_limit (saved_exponent_limit)
--					else
--						--| no overflow
--						if digits_upto_new_exponent > 1 then
--							--| by definition exponent < 0 and count > 1
--							exponent_delta := exponent - new_exponent
--							shift_left (exponent_delta)
--						end
--						exponent := new_exponent
--					end
--				end
--				clean_up (ctx)
--			else
--				--| new_exponent = exponent
--				--| still detect conditions
--				clean_up (ctx)
--			end
--		end
	
	do_rescale_special (ctx : EDA_MATH_CONTEXT) is
			-- rescale special numbers
		do
			if is_quiet_nan then
				--| do nothing
			elseif is_signaling_nan then
				ctx.signal (Signal_invalid_operation, "sNaN as operand in rescale")
				set_quiet_nan
			elseif is_infinity then
				--| do nothing
			end
		end
		
	rescale_decimal (new_exponent : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- 
		require
			new_exponent_not_void: new_exponent /= Void
			ctx_not_void: ctx /= Void
		local
			e_max, e_min : EDA_DECIMAL
			new_integer_exponent : INTEGER
			temp_ctx : EDA_MATH_CONTEXT
		do
			if new_exponent.is_special or else is_special then
				Result := clone (zero)
				if new_exponent.is_signaling_nan or else is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN as new exponent in 'rescale_decimal'")
					Result.set_quiet_nan
				elseif new_exponent.is_quiet_nan then
					Result.set_quiet_nan
				elseif new_exponent.is_infinity then
					ctx.signal (Signal_invalid_operation, "Inf as new exponent in 'rescale_decimal'")
					Result.set_quiet_nan
				else
					Result := clone (Current)
					Result.do_rescale_special (ctx)
				end
			else
				
				!! e_max.make_from_integer (ctx.exponent_limit)
				!! e_min.make_from_integer (ctx.e_tiny)
				if new_exponent <= e_max and then new_exponent >= e_min then
					!! temp_ctx.make_double
					--Result := clone (Current)
					if new_exponent.is_integer then
						new_integer_exponent := new_exponent.to_integer_ctx (temp_ctx)
						if new_integer_exponent <= ctx.exponent_limit and then new_integer_exponent >= ctx.e_tiny then
							Result := rescale (new_integer_exponent, ctx)
						else
							ctx.signal (Signal_invalid_operation, "new exponent is not within limits [Etiny..Emax]")
							create Result.make (1)
							Result.set_quiet_nan			
						end	
					else
						ctx.signal (Signal_invalid_operation, "new exponent has fractional part in 'rescale_decimal'")
						create Result.make (1)
						Result.set_quiet_nan
					end
				else
					ctx.signal (Signal_invalid_operation, "new exponent if not within limits [Etiny..Emax]")
					create Result.make (1)
					Result.set_quiet_nan
				end
			end
		end

	round_to_integer (ctx : EDA_MATH_CONTEXT) : like Current is
			-- 
		do
			Result := rescale (0, ctx)
		end

	plus (ctx : EDA_MATH_CONTEXT) : like Current is
			-- prefix `+' with respect to the `ctx' context
		local
			l_zero : like Current
		do
			l_zero := clone (zero)
			l_zero.set_exponent (Current.exponent)
			Result := l_zero.add (Current, ctx)
		end

	normalize : like Current is
		local
			l_count, trailing_zeroes : INTEGER
		do
			Result := plus (shared_decimal_context)
			if Result.is_zero then
				Result.coefficient.keep_head (1)
				Result.set_exponent (0)
			elseif not Result.is_special then
				from
					trailing_zeroes := 0
					l_count := Result.count
				until
					trailing_zeroes >= count or else Result.coefficient.item (trailing_zeroes) /= 0
				loop
					trailing_zeroes := trailing_zeroes + 1
				end
				if trailing_zeroes > 0 then
					Result.shift_right (trailing_zeroes)
					Result.coefficient.keep_head (Result.coefficient.msd_index+1)
				end
			end
			if is_negative then
				Result.set_negative
			else
				Result.set_positive
			end
		end
		
	minus (ctx : EDA_MATH_CONTEXT) : like Current is
			-- prefix `-' with respect to the `ctx' context
		local
			l_zero : like Current
		do
			l_zero := clone (zero)
			l_zero.set_exponent (Current.exponent)
			Result := l_zero.subtract (Current, ctx)
		end

	abs : like Current is
			-- absolute value of Current
		do
			Result := abs_ctx (shared_decimal_context)
		end

	abs_ctx (ctx : EDA_MATH_CONTEXT) : like Current is
			-- absolute value of Current relative to `ctx'
		do
			if is_negative then
				Result := minus (ctx)
			else
				Result := plus (ctx)
			end
		ensure
			definition: Result.sign >= 0
		end

	max_ctx (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- max between Current and `other' relative to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			comparison_result : EDA_DECIMAL
		do
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation ,"sNan in max")
				end
				Result := clone (zero)
				Result.set_quiet_nan
			else
				comparison_result := Current.compare (other, ctx)
				if comparison_result.is_negative then
					Result := other
				else
					Result := Current
				end
				Result.clean_up (ctx) -- Result := Result.plus (ctx)
			end			
		end
		
	min_ctx (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- min between Current and `other' relative to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			comparison_result : EDA_DECIMAL
		do
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation ,"sNan in max")
				end
				Result := clone (zero)
				Result.set_quiet_nan				
			else
				comparison_result := Current.compare (other, ctx)
				if comparison_result.is_negative or comparison_result.is_zero then
					Result := Current
				else
					Result := other
				end
				Result.clean_up (ctx) -- Result := Result.plus (ctx)
			end					
		end

	compare (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- compares value of `Current' and `other'
			-- Result = 0 if Current = other
			-- Result = -1 if Current < other
			-- Result = +1 if Current > other
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b : like Current
			temp_ctx : EDA_MATH_CONTEXT
		do
			if is_special or else other.is_special then
				if is_nan or else other.is_nan then
					Result := clone (zero)
					Result.set_quiet_nan
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation, "sNaN in 'compare'")
					end
				elseif is_infinity then
					if other.is_infinity and then is_negative = other.is_negative then
						--| compare (Inf,Inf) or compare (-Inf,-Inf)
						Result := clone (zero)
					elseif is_negative then
						--| compare (-Inf, x) : -Inf < x
						Result := clone (one)
						Result.set_negative
					else
						Result := clone (one)
					end
				elseif other.is_infinity then
					if is_infinity and then is_negative = other.is_negative then
						--| compare (Inf,Inf) or compare (-Inf,-Inf)
						Result := clone (zero)
					elseif other.is_negative then
						--| compare ( x, -Inf) : x > -Inf
						Result := clone (one)
					else
						--| compare (x, +inf) : x < Inf
						Result := clone (one)
						Result.set_negative
					end				
				end	
			else
				operand_a := clone (Current)
				operand_b := clone (other)
				operand_a.prepare_operand (ctx)
				operand_b.prepare_operand (ctx)
				--| avoid over/underflow during comparison
				if is_negative /= other.is_negative then
					-- signs are different
					if is_zero then
						operand_a := clone (zero)					
					else
						operand_a := clone (one)
						if is_negative then
							operand_a.set_negative
						end
					end
					if other.is_zero then
						operand_b := clone (zero)
					else
						operand_b := clone (one)
						if other.is_negative then
							operand_b.set_negative
						end
					end
				end
				temp_ctx := clone (ctx)
				temp_ctx.reset_flags
				Result := operand_a.subtract (operand_b, temp_ctx)
				if Result.is_zero and then not temp_ctx.is_flagged (Signal_subnormal) then
					--| avoid considering equal, numbers whose difference is an epsilon
					Result := clone (zero)
				else
					if Result.is_negative then
						Result := clone (one)
						Result.set_negative
					else
						Result := clone (one)
					end
				end
			end
		end
		
feature -- Obsolete

feature -- Inapplicable
	
feature {EDA_DECIMAL, EDA_DECIMAL_PARSER} -- Implementation
	
	set_coefficient (m : like coefficient) is
		require
			m_exists: m /= Void
		do
			coefficient := m
		ensure
			m_set: coefficient = m
		end
		
	set_exponent (e : like exponent) is
		require
		do
			exponent := e
		ensure
			exponent_set: exponent = e
		end

	set_negative is do is_negative := True ensure negative: is_negative end
	
	set_positive is do is_negative := False ensure positive: is_positive end
	

feature {EDA_DECIMAL} -- Implementation
	
	special : INTEGER
	
	set_infinity is
		do 
			special := Special_infinity 
		ensure 
			infinity: is_infinity 
		end
	
	set_signaling_nan is 
		do 
			special := Special_signaling_nan 
		ensure 
			sNaN: is_signaling_nan 
		end
	
	set_quiet_nan is 
		do 
			special := Special_quiet_nan 
		ensure 
			qNaN: is_quiet_nan 
		end
		
	plain_unlimited_context : EDA_MATH_CONTEXT is
				-- context for plain unlimited math
			once
				!!Result.make_default
				Result.set_digits (0)
			ensure
				digits_zero: Result.digits = 0
			end

	default_context : EDA_MATH_CONTEXT is
			once
				!!Result.make_default
			end

	exception : expanded EXCEPTIONS

	make_special (parser : EDA_DECIMAL_TEXT_PARSER) is
			-- make special value
		require
			parser_not_void: parser /= Void
			parser_special: parser.is_special
		do
			-- Create a fake coefficient
			!EDA_COEFFICIENT_IMP!coefficient.make (1)
			coefficient.put (0, 0)
			if parser.is_infinity then
				set_infinity
			elseif parser.is_snan then
				 -- parser is sNaN
				set_signaling_nan
			else
				set_quiet_nan
			end			
		end

	make_standard (parser : EDA_DECIMAL_TEXT_PARSER; ctx : EDA_MATH_CONTEXT) is
			-- make standard value
		require
		local
			l_double_exponent : DOUBLE
		do
			-- Evaluate exponent
			if parser.has_explicit_exponent then
--				if parser.exponent.is_integer then
				l_double_exponent := parser.exponent.to_double
				if l_double_exponent > Platform.Maximum_integer then
					exponent := ctx.maximum_exponent + ctx.digits + parser.exponent.count + 2
				else
					exponent := l_double_exponent.truncated_to_integer --parser.exponent.to_integer
				end
--				else
--				if parser.exponent.to_double > (ctx.Maximum_exponent + ctx.digits + 1) then
--					exponent := ctx.Maximum_exponent + ctx.digits + 1
--				else
--					exponent := parser.exponent.to_integer
--				end
				if parser.exponent_sign = '-' then
					exponent := -exponent
				end
			else
				exponent := 0
			end
			-- Adjust exponent if had dot
			if parser.dot > 0 then
				exponent := exponent - parser.coefficient_decimals_count
			end
			-- Create the coefficient array
			!EDA_COEFFICIENT_IMP!coefficient.make (parser.stripped_coefficient_digits_count.max (ctx.digits + 1))
			coefficient.set_from_string (parser.stripped_coefficient)
			-- Handle the case of Zero
			clean_up (ctx)
		end

	add_special (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- add special numbers
		require
			other_not_void: other /= Void
			special: is_special or else other.is_special
			ctx_not_void: ctx /= Void
		do
			--| prepare result
			Result := clone (zero)
			--| set its value
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN operand in add")
				end
				Result.set_quiet_nan
			elseif is_infinity and then other.is_infinity then
				if sign /= other.sign then
					ctx.signal (Signal_invalid_operation, "+Inf and -Inf operands in add")
					Result.set_quiet_nan
				else
					Result.set_infinity
					if is_negative then
						Result.set_negative
					end
				end
			elseif is_infinity or else other.is_infinity then
				Result.set_infinity
				if is_infinity then
					if is_negative then
						Result.set_negative
					end
				else
					--|other is Inf
					if other.is_negative then
						Result.set_negative
					end
				end
			end
		end
		
	subtract_special (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- subtract special numbers
		require
			other_not_void: other /= Void
			special: is_special or else other.is_special
			ctx_not_void: ctx /= Void
		do
			--| prepare result
			Result := clone (zero)
			--| set its value
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN operand in subtract")
				end
				Result.set_quiet_nan
			elseif is_infinity and then other.is_infinity then
				if sign = other.sign then
					ctx.signal (Signal_invalid_operation, "Inf and Inf operands in subtract")
					Result.set_quiet_nan
				else
					Result.set_infinity
					if is_negative then
						Result.set_negative
					end
				end
			elseif is_infinity or else other.is_infinity then
				Result.set_infinity
				if is_infinity then
					if is_negative then
						-- -Inf - x = -Inf
						Result.set_negative
					end
				else
					--|other is Inf
					if other.is_positive then
						--| x - +Inf = -Inf
						Result.set_negative
					else
						--| x - -Inf = +Inf
						Result.set_positive
					end
				end
			end
		end
		
	add_zero (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- add zero numbers
		require
			other_not_void: other /= Void
			both_zero : is_zero and other.is_zero
			ctx_not_void: ctx /= Void
		do
			Result := clone (zero)
			--| set sign
			if is_negative and then other.is_negative then
				Result.set_negative
			elseif ctx.rounding_mode = Round_floor then
				if sign /= other.sign then
					--| they have opposite signs
					Result.set_negative
				end
			end
		end

	subtract_zero (other : like Current; ctx : EDA_MATH_CONTEXT) : like Current is
			-- subtract zero numbers
		require
			other_not_void: other /= Void
			both_zero : is_zero and other.is_zero
			ctx_not_void: ctx /= Void
		do
			Result := clone (zero)
			--| set sign
			if is_negative and then not other.is_negative  then
				Result.set_negative
			elseif ctx.rounding_mode = Round_floor and then sign = other.sign and then ctx.is_extended then
					--| they have opposite signs
				Result.set_negative
			else
				Result.set_positive
			end
		end

	set_canonical_zero is
			-- set Current to canonical zero
		require
			coefficient_zero: coefficient.is_zero
		do
			coefficient.keep_head (1)
			exponent := 0
		ensure
			definition: exponent = 0 and coefficient.count = 1 and coefficient.item (0) = 0
		end
		
	unsigned_add (other : like Current; ctx : EDA_MATH_CONTEXT) is
			-- Subtract other from Current
			-- !!! Destructive on other and on Current
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			align_hint : INTEGER
			msd : INTEGER
		do
			--| avoid costly operations
			--| align
			align_hint := align_and_hint (other, ctx.digits)
			if align_hint = Align_hint_current then
				-- keep current
				shift_left(ctx.digits + 2 - count)
				coefficient.put (other.coefficient.item (other.coefficient.msd_index),0)
				ctx.signal (Signal_inexact, "")
			elseif align_hint = Align_hint_other then
				-- copy other
				msd := coefficient.item (coefficient.msd_index)
				copy (other)
				shift_left(ctx.digits + 2 - count)
				coefficient.put (msd, 0)
				ctx.signal (Signal_inexact, "")
			elseif align_hint = Align_hint_other_zero then
				copy (other)
			elseif align_hint = Align_hint_current_zero then
				--| keep current
			else
				coefficient.integer_add (other.coefficient)
				exponent := exponent.min (other.exponent)
			end
		end

	unsigned_subtract (other : like Current; ctx : EDA_MATH_CONTEXT) is
			-- 
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			test, align_hint : INTEGER
		do
			--| avoid costly operations
			--| align
			align_hint := align_and_hint (other, ctx.digits)
			if align_hint = Align_hint_current then
				-- keep current, but subtract -1E-precision
				shift_left(ctx.digits + 2 - count)
				coefficient.integer_quick_subtract_msd (1, coefficient.count)
			elseif align_hint = Align_hint_other then
				-- copy other
				copy (other)
				shift_left(ctx.digits + 2 - count)
				coefficient.integer_quick_subtract_msd (1, coefficient.count)
				set_negative
			elseif align_hint = Align_hint_current_zero then
				--| keep curent
			elseif align_hint = Align_hint_other_zero then
				--| copy other
				copy (other)
				set_negative
			else
				test := coefficient.three_way_comparison (other.coefficient)
				if test = 0 then
					coefficient.keep_head (1)
					coefficient.put (0, 0)
				elseif test > 0 then
					coefficient.integer_subtract (other.coefficient)
				else
					--| other > Current
					other.coefficient.integer_subtract (Current.coefficient)
					coefficient.copy (other.coefficient)
					set_negative
				end
				exponent := exponent.min (other.exponent)
			end
		end

	round (ctx : EDA_MATH_CONTEXT) is
			-- round Current according to ctx.rounding_mode
		require
			not_special: not is_special
			roundable: ctx.digits > 0 and then count > ctx.digits
		local
		do
			if is_special then
				if is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN in 'round'")
				end
--			elseif ctx.digits < 1 then
--				round_for_greater_exponent (ctx)
			elseif count > ctx.digits then
				ctx.signal (Signal_rounded, "Argument rounded")
				if lost_digits (ctx) then
					ctx.signal (Signal_inexact,"Inexact when rouding")
				end
				inspect ctx.rounding_mode 
				when Round_up 		then do_round_up (ctx) 
				when Round_down 	then do_round_down (ctx)  
				when Round_ceiling 	then do_round_ceiling (ctx) 
				when Round_floor 	then do_round_floor (ctx) 
				when Round_half_up 	then do_round_half_up (ctx) 
				when Round_half_down then do_round_half_down (ctx) 
				when Round_half_even then do_round_half_even (ctx)
				else
					do_nothing
				end
			end
		ensure
			rounded: count <= ctx.digits
		end
		
	align_and_hint (other : like Current; precision : INTEGER) : INTEGER is
			-- align Current and other with respect to `precision'
			-- and give hint for further operations
		local
			new_count, new_exponent : INTEGER
			limited_precision : BOOLEAN
			shift_count : INTEGER
		do
			limited_precision := (precision > 0)
			if exponent = other.exponent then
				--| adjust each other's count?
				new_count := count.max (other.count)
				if new_count > count then
					grow (new_count) -- - count)
				end
				if new_count > other.count then
					other.grow (new_count) -- shift_left (new_count - other.count)
				end
				Result := Align_hint_both
			elseif exponent > other.exponent then
				--| need to pad Current so that exponent = other.exponent
				--| examine if other would NOT affect Current
				-- --| i.e. if Current would be longer than other by digits + 1 or more
				-- --| we only need to pad up to a length of precision + 1
				--|
				--| except when Current is Zero.  In this case other is returned, unchanged.
				new_exponent := exponent.min (adjusted_exponent - (precision+1)) --new_count := count + exponent - other.exponent
				if new_exponent > other.adjusted_exponent then --new_count >= other.count + precision + 1 then
					--| other shall not affect Current
					if is_zero then
						Result := Align_hint_other_zero
					else
						if limited_precision then
							if other.is_zero then
								--| avoid unnecessary rounding
								Result := Align_hint_current_zero
							else
								Result := Align_hint_current
							end
							shift_count := precision + 1 - count
							if shift_count > 0 then
								shift_left (shift_count)
							end
						end
					end
				else
					if limited_precision then
						align_overlapped (other, precision)
					else
						align_unlimited (other)
					end
					Result := Align_hint_both
				end
			else
				-- exponent < other.exponent
				--| need to pad other so that other.exponent = exponent
				new_exponent := other.exponent.min (other.adjusted_exponent - (precision+1)) --new_count := count + exponent - other.exponent
				if new_exponent > adjusted_exponent then --new_count >= other.count + precision + 1 then
					--| Current shall not affect other
					--| except when other is Zero.  In this case Current is returned, unchanged.
					if other.is_zero then
						Result := Align_hint_current_zero				
					else
						if limited_precision then
							if is_zero then
								Result := Align_hint_other_zero
							else
								Result := Align_hint_other
							end
							shift_count := precision + 1 - other.count 
							if shift_count > 0 then
								other.shift_left (shift_count)
							end
						end
					end
				else
					if limited_precision then
						other.align_overlapped (Current, precision)
					else
						other.align_unlimited (Current)
					end
					Result := Align_hint_both
				end
			end
		ensure
			same_count: Result = Align_hint_both implies count = other.count
			same_exponent: Result = Align_hint_both implies exponent = other.exponent
			--limited_precision: (precision > 0 and Result = Align_hint_both) implies count = precision + 1
		end

	align_overlapped (other : like Current; precision : INTEGER) is
			-- align overlapping numbers
		require
			other_not_void: other /= Void
			exponent_greater: exponent > other.exponent
		local
			truncation_length, new_count, exponent_delta, new_digits : INTEGER
		do
			new_count := count + exponent - other.exponent
			new_digits := new_count
			truncation_length := new_count - (new_digits)
			-- adjust exponents
			exponent_delta := exponent - other.exponent
			if exponent_delta > 0 then
				shift_left (exponent_delta)
			end
			new_digits := count.max (other.count)
			--| adjust count to be 'precision'
			if new_digits > other.count then -- + 1
				other.grow (new_digits) -- + 1) -- - other.count)
			end
			if new_digits > count then --  + 1
 				grow (new_digits) --- - count) --  + 1
			end
		ensure
			count: count = other.count
			exponent: exponent = other.exponent
		end

	align_unlimited (other : like Current) is
		require
			other_not_void: other /= Void
			exponent_greater: exponent > other.exponent
		local
			count_alignment : INTEGER
		do
			--| adjust Current
			shift_left (exponent - other.exponent)
			count_alignment := count - other.count
			if count_alignment > 0 then
				--| must grow other
				other.grow (count)
			elseif count_alignment < 0 then
				grow (other.count)
			else
				do_nothing
			end									
		ensure
			same_count: count = other.count
			same_exponent: exponent = other.exponent
		end
		
	is_aligned (other : like Current) : BOOLEAN is
			-- is other aligned to Current ?
		do
			Result := (count = other.count) and then exponent = other.exponent
		ensure
			definition_count: Result implies (count = other.count and exponent = other.exponent)
		end

	shift_left (a_count : INTEGER) is
			-- shift the coefficient left `a_count' position and adjust exponent
			-- value still must be the same as with the original exponent
		do
			coefficient.shift_left (a_count)
			exponent := exponent - a_count
		ensure
			count_adapted: count = old count + a_count
			exponent_adapted: exponent = old exponent - a_count
		end

	shift_right (a_count : INTEGER) is
			-- shift the coefficient right `a_count' position and adjust exponent
			-- digits are lost
		do
			coefficient.shift_right (a_count)
			exponent := exponent + a_count
		ensure
			exponent_adapted: exponent = old exponent + a_count
		end

	grow (a_count : INTEGER) is
			-- grow coefficient so that it can accomodate a_count digits
		require
			a_count_greater_zero: a_count > 0
			a_count_less_10_000: a_count < 10_000
		do
			coefficient.grow (a_count)
		ensure
			count_set: count = a_count
		end

  	do_round_up (ctx : EDA_MATH_CONTEXT) is 
			-- Round away from zero.
		local
			old_count, exponent_increment : INTEGER
		do
			if lost_digits (ctx) then
				old_count := count
				coefficient.integer_quick_add_msd (1, ctx.digits)
				exponent_increment := old_count - ctx.digits
				exponent := exponent + exponent_increment
			end
			if count > ctx.digits then
				shift_right (count - ctx.digits)
				coefficient.keep_head (ctx.digits)
			end
		end
		
	do_round_down (ctx : EDA_MATH_CONTEXT) is 
			-- Round towards zero.
		require
			positive_precision: ctx.digits >= 1
		local
			exponent_increment : INTEGER
			l_count : INTEGER
		do
			l_count := count - ctx.digits
			coefficient.shift_right (l_count)
			exponent_increment := l_count
			exponent := exponent + exponent_increment
			coefficient.keep_head (ctx.digits)
		end

	do_round_ceiling (ctx : EDA_MATH_CONTEXT) is
			-- Round to a more positive number
		do
			if is_negative or else not lost_digits (ctx) then
				do_round_down (ctx)
			else
				do_round_up (ctx)
			end
		end
		
	do_round_floor (ctx : EDA_MATH_CONTEXT) is
			-- Round to a more negative number.
 		do
			if is_positive or else not lost_digits (ctx) then
				do_round_down (ctx)
			else
				do_round_up (ctx)
			end
		end

 	do_round_half_up (ctx : EDA_MATH_CONTEXT) is
  			-- Round to nearest neighbor, where an equidistant value is rounded up.
			-- If the discarded digits represent greater than or equal to half (0.5 times) the value
			-- of a one in the next position then the result should be rounded up (away from zero).
			-- Otherwise the discarded digits are ignored.
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when 1, 0 then
				--| greater, equal
				do_round_up (ctx)
			else
				--| less
				do_round_down (ctx)
			end
		end
		

 	do_round_half_down (ctx : EDA_MATH_CONTEXT) is
	 		-- Round to nearest neighbor, where an equidistant value is rounded down.
			-- If the discarded digits represent greater than half (0.5 times)
  			-- the value of a one in the next position then the result should be
 			-- rounded up (away from zero).  Otherwise the discarded digits are ignored.
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when -1 then
				--| lower
				do_round_down (ctx)
			when 1 then
				--| greater
				do_round_up (ctx)
			else
				--| equal
				do_round_down (ctx)
			end
		end

 	three_way_compare_discarded_to_half (ctx : EDA_MATH_CONTEXT) : INTEGER is
 			-- compare discarded digits greater than 0.5
		local
			digit, index : INTEGER
		do
			digit := coefficient.item (count - ctx.digits - 1)
			if  digit > 5 then
				Result := 1
			elseif digit < 5  then
				Result := -1
			else
				index := count -ctx.digits - 2
				--| search for non zero digit to the right
				from
				until
					index < 0 or else coefficient.item (index) /= 0
				loop
					index := index - 1
				end
				if index >= 0 then
					--|more than half 
					Result := 1
				else
					--|exactly half
					Result := 0
				end
			end
 		ensure
 			definition: Result >= -1 and then Result <= 1
 		end
 		
 	do_round_half_even (ctx : EDA_MATH_CONTEXT) is
 			-- Round to nearest neighbor, where an equidistant value is rounded to the nearest even neighbor.
			-- If the discarded digits represent greater than half (0.5 times) the value of a one in the next position then the result should be
 			-- rounded up (away from zero).  
 			-- If they represent less than half, then the result should be rounded down.
			-- Otherwise (they represent exactly half) the result is rounded down if its rightmost digit is even, or rounded up if its
 			-- rightmost digit is odd (to make an even digit).
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when -1 then
				--| lower
				do_round_down (ctx)
			when 1 then
				--| greater
				do_round_up (ctx)
			else
				--| equal
				if (coefficient.item (count - ctx.digits) \\ 2 = 0) then
					do_round_down (ctx)
				else
					do_round_up (ctx)
				end
			end
		end

	shall_overflow_with_exponent_increment (increment : INTEGER; ctx : EDA_MATH_CONTEXT) : BOOLEAN is
			-- 
		local
			new_adjusted_exponent : INTEGER
		do
			new_adjusted_exponent := exponent + count + increment - 1
			Result := new_adjusted_exponent < - ctx.exponent_limit or else new_adjusted_exponent > ctx.exponent_limit
		end
	
	lost_digits (ctx : EDA_MATH_CONTEXT) : BOOLEAN is
			-- are there non-zero digits after ctx.digits digits ?
		local
			index : INTEGER
		do
			from
				index := count - ctx.digits - 1
			until
				index < 0 or else coefficient.item (index) /= 0
			loop
				index := index - 1
			end
			--| true if found non-zero digits in [0..count-ctx.digits-1]
			Result := index >= 0
		end

	is_overflow (ctx : EDA_MATH_CONTEXT) : BOOLEAN is
			-- is there an overflow condition ?
		require
			ctx_not_void: ctx /= Void
		do
			Result := adjusted_exponent > ctx.exponent_limit
		ensure
			definition:	Result = (adjusted_exponent > ctx.exponent_limit) 
		end
		
	is_underflow (ctx : EDA_MATH_CONTEXT) : BOOLEAN is
			-- is there an overflow condition ?
		require
			ctx_not_void: ctx /= Void
		do
			Result := adjusted_exponent < - ctx.exponent_limit
		ensure
			definition:	Result = (adjusted_exponent < - ctx.exponent_limit) 
		end

	round_for_greater_exponent (ctx : EDA_MATH_CONTEXT) is
			-- 
		local
			index : INTEGER
			fake_context : EDA_MATH_CONTEXT
		do
			if (exponent < ctx.digits) then
				--| are we loosing information
				from
					index := 0
				until
					index >= (ctx.digits - exponent) or else index >= count or else coefficient.item (index) /= 0
				loop
					index := index + 1
				end
				if not (index >= (ctx.digits - exponent) or else index >= count) then
					ctx.signal (Signal_lost_digits, "Lost digits while rounding")
				end
				fake_context := new_temporary_context (ctx)
				fake_context.set_digits (count + exponent - ctx.digits)
				if fake_context.digits < 1 then
					fake_context.set_digits (1)
					coefficient.grow (count + 1)
					coefficient.put (0, coefficient.count - 1)
					round (fake_context)
				else
					round (fake_context)
				end
				if is_zero then
					set_canonical_zero
				end
			end
		end

	prepare_operand (ctx : EDA_MATH_CONTEXT) is
			-- prepare operand, rounding it if necessary
		do
			-- do nothing...
		end
			
	clean_up (ctx : EDA_MATH_CONTEXT) is
			-- clean up result, rounding it if necessary
		local
			lost_digits_trap, lost_digits_flag : BOOLEAN
		do
			if not is_special then
				lost_digits_trap := ctx.is_trapped (Signal_lost_digits)
				lost_digits_flag := ctx.is_flagged (Signal_lost_digits)
				--| round as if no lost_digits trap existed
				ctx.disable_trap (Signal_lost_digits)
				ctx.reset_flag (Signal_lost_digits)
				--| avoid loosing significant digits in msd
				strip_leading_zeroes
				if is_underflow (ctx) then
					do_underflow (ctx)
				else
					if ctx.digits > 0 and then count > ctx.digits then
						round (ctx)
					end
					if is_overflow (ctx) then
						do_overflow (ctx)
					end
				end
				--| restore flags and traps
				if lost_digits_trap then
					ctx.enable_trap (Signal_lost_digits)
				end
				if lost_digits_flag or else ctx.is_flagged (Signal_lost_digits) then
					ctx.set_flag (Signal_lost_digits)
				else
					ctx.reset_flag (Signal_lost_digits)
				end
			end
		end

	convert_to_plain_integer (ctx : EDA_MATH_CONTEXT) is
			-- make it a plain integer
		require
			ctx_not_void: ctx /= Void
			can_contert_to_integer: exponent > 0 and then count + exponent <= ctx.digits
			not_special: not is_special
		local
			index, old_count : INTEGER
		do
			old_count := count
			coefficient.grow (ctx.digits)
			from
				index := old_count - 1
			until
				index < 0
			loop
				coefficient.put (coefficient.item (index), index + exponent)
				index := index - 1
			end
			from 
				index := 0
			until
				index >= exponent
			loop
				coefficient.put (0, index)
				index := index + 1
			end
			strip_leading_zeroes
			exponent := 0
		ensure
			exponent_zero: exponent = 0
		end
		
	strip_leading_zeroes is
		require
			not is_special
		do
			coefficient.strip_leading_zeroes
		end
		
	strip_trailing_zeroes is
		local
			index : INTEGER
		do
			from
				index := 0
			until
				index >= coefficient.count or else coefficient.item (index) > 0
			loop
				index := index + 1
			end
			if index >= 1 and then index < count then
				-- index is displacement
				shift_right (index)
			end
			coefficient.keep_head (count - index)
		end
		

	set_largest (ctx : EDA_MATH_CONTEXT) is
			-- set to largest finite number that can be represented with ctx.precision
		require
			ctx_not_void: ctx /= Void
		local
			index : INTEGER
		do
			if count < ctx.digits then
				grow (ctx.digits)
			end
			from
				index := 0
			until
				index >= count
			loop
				coefficient.put (9, index)
				index := index + 1
			end
			coefficient.keep_head (ctx.digits)
			if exponent < 0 then
				exponent := -ctx.exponent_limit + (count - 1)
			else
				exponent := ctx.exponent_limit - (count - 1)
			end
		end

	promote_to_infinity (a_sign : INTEGER) is
		do
			copy (zero)
			set_infinity
			if a_sign < 0 then
				set_negative
			else
				set_positive	
			end	
		ensure
			infinity: is_infinity 
			sign: sign = a_sign
		end

	do_overflow (ctx : EDA_MATH_CONTEXT) is
			-- do overflow
		require
			overflow: is_overflow (ctx)
		do
			internal_do_overflow (ctx)
		end
	
	internal_do_overflow (ctx : EDA_MATH_CONTEXT) is	
		do
			if not is_zero then
				ctx.signal (Signal_overflow,"")
				inspect ctx.rounding_mode
				when Round_half_up, Round_half_even, Round_half_down, Round_up then
					promote_to_infinity (sign)
				when Round_down then
					set_largest (ctx)
				when Round_ceiling then
					if is_negative then
						set_largest (ctx)
					else
						promote_to_infinity (sign)
					end
				when Round_floor then
					if is_positive then
						set_largest (ctx)
					else
						promote_to_infinity (sign)
					end					
				end							
				ctx.signal (Signal_inexact,"do_overflow")
				ctx.signal (Signal_rounded,"do_overflow")			
			else
				set_exponent (ctx.exponent_limit)
			end
		end

	do_underflow (ctx : EDA_MATH_CONTEXT) is
			-- do underflow
		require
			underflow: is_underflow (ctx)
		local
			e_tiny, shared_digits, subnormal_count, count_upto_elimit, saved_digits : INTEGER
			l_is_zero, l_was_rounded : BOOLEAN
			value : INTEGER
		do
			l_is_zero := is_zero
			if not l_is_zero then
				ctx.signal (Signal_subnormal,"")
			else
				l_was_rounded := ctx.is_flagged (Signal_rounded)
			end
			-- rescale to e_tiny
			e_tiny := ctx.e_tiny
			if exponent < e_tiny then
				saved_digits := ctx.digits
				shared_digits := adjusted_exponent - e_tiny + 1
				if shared_digits < 0 then 
					-- impossible to share any digit with e_tiny 
					saved_digits := ctx.digits
					ctx.set_digits (coefficient.count - 1)
					value := 0
					inspect ctx.rounding_mode 
					when Round_up then
						value := 1
					when Round_ceiling then
						if is_positive and then lost_digits (ctx) then
						--not (is_negative or else not lost_digits (ctx)) then
							value := 1
						end
					when Round_floor then
						if is_positive or else not lost_digits (ctx) then
							value := 0
						else
							value := 1
						end
--					when Round_half_up then
--						if three_way_compare_discarded_to_half (ctx) >= 0 then
--							value := 1
--						end
--					when Round_half_down then
--						if three_way_compare_discarded_to_half (ctx) = 1 then
--							value := 1
--						end
					else
						value := 0
					end
					ctx.set_digits (saved_digits)
					coefficient.put (value, 0)
					coefficient.keep_head (1)					
					exponent := e_tiny
					ctx.signal (Signal_inexact, "Rescaling to e_tiny")
					ctx.signal (Signal_rounded, "Rescaling to e_tiny")
					ctx.signal (Signal_underflow, "Rescaling to e_tiny")
				else
					if shared_digits = 0 then 
						-- msd at e_tiny - 1.  See if rounding shall carry some e_tiny digit
						--local_context := underflowing_context (1, ctx.rounding_mode)
						ctx.set_digits (1)
						grow (count+1)
					else  -- shared_digits > 0 (and shared_digits <= ctx.digits)
						count_upto_elimit := -ctx.exponent_limit - exponent + 1
						if count < count_upto_elimit then
							grow (count_upto_elimit)
						end
						subnormal_count := -ctx.exponent_limit - e_tiny + 1
						ctx.set_digits (subnormal_count)
					end
					round (ctx)
--					if ctx.rounding_mode = ctx.Round_up and then is_zero and then not l_is_zero then
--						coefficient.put (1, 0)
--					end
					ctx.set_digits (saved_digits)
					strip_leading_zeroes
					if ctx.is_flagged (Signal_subnormal) and then ctx.is_flagged (Signal_inexact) then
						ctx.signal (Signal_underflow, "Underflow when rescaling")
					end
					if is_overflow (ctx) then
						do_overflow (ctx)
					end
				end
				exponent := e_tiny
				if l_is_zero then
					if l_was_rounded then
						ctx.signal (Signal_rounded, ctx.reason)
					else
						ctx.reset_flag (Signal_rounded)
					end
				end
			end
		end		

		Align_hint_current : INTEGER is 1
		Align_hint_other : INTEGER is 2
		Align_hint_both : INTEGER is 3
		Align_hint_current_zero : INTEGER is 4
		Align_hint_other_zero : INTEGER is 5

	new_temporary_context, assertion_context (ctx : EDA_MATH_CONTEXT) : EDA_MATH_CONTEXT is
			do
				Result := Temporary_context
				Result.set_digits (ctx.digits)
				Result.set_rounding_mode (ctx.rounding_mode)
			ensure
				digits: ctx.digits = Result.digits
				rounding_mode: ctx.rounding_mode = Result.rounding_mode
			end

	temporary_context : EDA_MATH_CONTEXT is
		once
			!!Result.make (1, Round_half_up)
		end

	division_standard, division_integer, division_remainder : INTEGER is unique

	do_divide (other : like Current; ctx : EDA_MATH_CONTEXT; division_type : INTEGER) : like Current is
			-- do a `division_type' of Current by `other'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void	
		local
			integer_division : BOOLEAN
		do
			integer_division := (division_type = division_integer) or else (division_type = division_remainder)
			if is_special or else other.is_special then
				Result := clone (zero)
				-- sNan
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation ,"sNan in divide")
					end
					Result.set_quiet_nan
				elseif is_infinity and then other.is_infinity then
					ctx.signal (Signal_invalid_operation, "[+-] Inf / [+-] Inf")
					Result.set_quiet_nan
				elseif is_infinity then
					Result.set_infinity
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					if other.is_zero then
						ctx.signal (Signal_division_by_zero, "[+-] Inf / [+-] 0")
					end
				elseif other.is_infinity then
					check
						Result.is_zero
					end
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
				end
			else
				if other.is_zero then
					Result := clone (zero)
					if Current.is_zero then
						ctx.signal (Signal_invalid_operation, "Division Undefined : O/O")
						Result.set_quiet_nan	
					else
						ctx.signal (Signal_division_by_zero, "Division by zero")
						Result.set_infinity
						if sign = other.sign then
							Result.set_positive
						else
							Result.set_negative
						end						
					end
				elseif Current.is_zero then
						Result := clone (zero)
						if integer_division then
							Result.set_exponent (0)
						else
							Result.set_exponent (Current.exponent - other.adjusted_exponent)
						end
						if sign = other.sign then
							Result.set_positive
						else
							Result.set_negative
						end
						Result.clean_up (ctx)
				else	
					Result := internal_divide (other, ctx, division_type)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					Result.clean_up (ctx)
				end
			end			
		end
		
	internal_divide (other : like Current; ctx : EDA_MATH_CONTEXT; division_type : INTEGER) : like Current is
			-- divide Current by `other' whith respect to `ctx'
		require
			other_not_void : other /= Void
			ctx_not_void: ctx /= Void	
		local
			dividend, divisor, local_remainder : like Current
			adjust, divisor_adjust, dividend_adjust, current_digit_exponent, new_exponent : INTEGER
			original_dividend_exponent, original_divisor_exponent, bias : INTEGER
			done, integer_division, impossible, is_negative_exponent, dividend_is_zero : BOOLEAN
		do
			integer_division := (division_type /= division_standard)
			dividend := clone (Current)
			divisor := clone (other)
			--| round if necessary
			--dividend.prepare_operand (ctx)
			--divisor.prepare_operand (ctx)
			original_divisor_exponent := divisor.exponent
			original_dividend_exponent := dividend.exponent
			if dividend.is_zero then
				dividend_is_zero := True
			end
			--| prepare result
			--Result := clone (zero)
			create Result.make (ctx.digits + 1)
			adjust := 0; divisor_adjust := 0; dividend_adjust := 0
			--| adjust coefficients so that 
			--| 1. divisor.coefficient <= dividend.coefficient
			--| 2. dividend.coefficient < 10 * divisor.coefficient
			from			
				--| while coefficient of dividend is less than coefficient of divisor
				--| multiply coefficient of divident by 10
			until
				dividend.coefficient >= divisor.coefficient
			loop
				dividend.shift_left (1)
				adjust := adjust + 1
				dividend_adjust := dividend_adjust + 1
			end
			check
				dividend.coefficient >= divisor.coefficient
			end
			from
				--| while coefficient of divisor >= 10 * coefficient of dividend
				--| until dividend.coefficient / 10 < divisor.coefficient
				--| multiply divisor by 10
				
				--| init: compute 10 * coefficient of dividend
				divisor.shift_left (1)
				--| adjust coefficient sizes
			until
				dividend.coefficient < divisor.coefficient
			loop
				adjust := adjust - 1
				divisor.shift_left (1)
				divisor_adjust := divisor_adjust + 1
			end
			--| divide by 10
			check
				dividend.coefficient < divisor.coefficient
			end
			--| get back to divisor : undo 'init'
			divisor.shift_right (1)
			divisor.coefficient.keep_head (divisor.coefficient.count - 1)
			--| do divide
			from
				if integer_division then
					--| determine if division is possible
					current_digit_exponent := (original_dividend_exponent - (original_divisor_exponent + adjust))
					impossible := (current_digit_exponent >= ctx.digits)
					is_negative_exponent := (current_digit_exponent) < 0
					done := is_negative_exponent or else impossible
				else
					impossible := False
					done := False
				end
				if not done then
					--| Prepare Result so that it can accomodate ctx.digits + 1 digits
					Result.coefficient.grow (ctx.digits + 1)
					Result.coefficient.keep_head (1)					
				end
			until
				done
			loop
				--| compute digit of rank 'current_digit_exponent' by repeatedly subtracting divisor from dividend
				from							
				until
					divisor.coefficient > dividend.coefficient
				loop
					dividend.coefficient.integer_subtract (divisor.coefficient)
					Result.coefficient.integer_quick_add_msd (1, Result.count)
				end
				--| determine if division is done
				inspect division_type
				when division_standard then
					if (dividend.is_zero and then adjust >= 0) or else (Result.count = ctx.digits) then
						done := True
					end
				else
					if current_digit_exponent = 0 then 
						done := True
					end
				end
				--| prepare processing of next digit
				if not done then
					Result.coefficient.shift_left (1)
					dividend.coefficient.shift_left (1)
					adjust := adjust + 1
					current_digit_exponent := current_digit_exponent - 1
				end
			end
			if impossible then
				Result.set_quiet_nan
				ctx.signal (Signal_invalid_operation, "Division impossible")
			else
				local_remainder := dividend
				inspect division_type
				when division_standard then
					--| give some indications for rounding
					if local_remainder.is_zero then
						if adjust < 0 then
							--| Result has been artificially rounded
							ctx.signal (Signal_rounded, "Artificial rounding in division where remainder is zero")
						end
					else
						Result.coefficient.shift_left (1)
						adjust := adjust + 1
						divisor.coefficient.integer_subtract (local_remainder.coefficient)
						inspect divisor.coefficient.three_way_comparison (local_remainder.coefficient)
						when 0 then
							--| half way: divisor - remainder = remainder <=> 2 * remainder = divisor
							Result.coefficient.put (5, 0)
						when + 1 then
							--| half way down: divisor - remainder > remainder <=> 2 * remainder < divisor
							Result.coefficient.put (4, 0)
						else
							--| half way up: divisor - remainder < remainder <=> 2 remainder > divisor
							Result.coefficient.put (6, 0)
						end
					end
					--| compute exponent
					if dividend.is_zero then
						Result.set_exponent (original_dividend_exponent - (original_divisor_exponent + adjust))
					else
						Result.set_exponent (Current.exponent - (original_divisor_exponent + adjust))--(adjusted_exponent - other.adjusted_exponent) - Result.count) --Current.exponent - (other.exponent + adjust))
					end					
				when division_integer then
					Result.set_exponent (0)
				else
					Result := local_remainder
					--| correct value if necessary
					if is_negative_exponent then
						--| correct left_shift bias introduced in steps preparing division
						--| division has not occurred
						Result := clone (Current)
					else
						new_exponent := original_dividend_exponent.min (original_divisor_exponent)
						bias := new_exponent - (dividend.exponent.min (divisor.exponent))
						if Result.is_zero then 
							if dividend_is_zero then
								new_exponent := original_dividend_exponent
							elseif new_exponent >= 0 then
								new_exponent := 0
							else
								new_exponent := exponent- (original_divisor_exponent+adjust)
							end
						else --if divisor.adjusted_exponent >= 0 then
							-- Real division
							if bias /= 0 then
								Result.coefficient.shift_right (bias.abs)
							end							
						end
						Result.set_exponent (new_exponent)
					end
				end
			end
		end

	negate is
			-- negate sign
		do

			if is_negative then
				set_positive
			else
				set_negative
			end			
		ensure
			negated: sign = - old sign
		end
		
invariant
	special_values: special >= Special_none and then special <= Special_quiet_nan
end -- class EDA_DECIMAL

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--