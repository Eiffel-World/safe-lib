indexing
	description: "User selectable parameters and rules which govern the results of decimal arithmetic operations."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:06:14 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	EDA_MATH_CONTEXT

inherit
	ANY
		redefine
			out, copy
		end
	
	EDA_CONSTANTS
		undefine
			out, copy
		end

	KL_EXCEPTIONS
		export 
			{NONE} all
		undefine
			out, copy
		end
	
	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			out, copy
		end
	
creation
	make_default, make_double, make_extended, make_double_extended, make
	
feature {NONE} -- Initialization

	make_default is
			-- default context for general purpose arithmetic (IEEE 854), single precision.
		local
			index : INTEGER
		do
			make (Default_digits, Default_rounding_mode)
			from
				index := Default_traps.lower
			until
				index > Default_traps.upper
			loop
				enable_trap (Default_traps.item (index))
				index := index + 1
			end
		ensure
			default_digits: 		digits = Default_digits
			default_rounding_mode: 	rounding_mode = Default_rounding_mode
			trap_division_by_zero:	is_trapped (Signal_division_by_zero)	  		
			trap_invalid_operation:	is_trapped (Signal_invalid_operation)	  		
			trap_overflow:  		is_trapped (Signal_overflow)
			trap_underflow:  		is_trapped (Signal_underflow) 				
		end

	make_double is
			-- make double precision context
		do
			make_default
			digits := 2 * Default_digits + 1
		ensure
			default_digits: 		digits = 2 * Default_digits + 1
			default_rounding_mode: 	rounding_mode = Default_rounding_mode
			trap_division_by_zero:	is_trapped (Signal_division_by_zero)	  		
			trap_invalid_operation:	is_trapped (Signal_invalid_operation)	  		
			trap_overflow:  		is_trapped (Signal_overflow)
			trap_underflow:  		is_trapped (Signal_underflow) 				
		end
		
	make_extended is
			-- make extended default context (IEEE 854), single precision
		do
			make (Default_digits, Round_half_even)
			is_extended := True
		ensure
			default_digits: 		digits = Default_digits
			default_rounding_mode: 	rounding_mode = Round_half_even
		end

	make_double_extended is
			-- make extented default context, double precision
		do
			make_extended
			digits := 2 * Default_digits + 1
		ensure
			default_digits: 		digits = 2 * Default_digits + 1
			default_rounding_mode: 	rounding_mode = Round_half_even
		end
		
	make (a_digits, a_rounding_mode : INTEGER) is
			-- creation of a math context
		require
			good_digits : a_digits >= Minimum_digits and a_digits <= Maximum_digits
			good_rounding_mode: INTEGER_ARRAY_.has (Rounds, a_rounding_mode)
		do
			digits := a_digits
			rounding_mode := a_rounding_mode
			!!traps.make (1,Signal_subnormal)
			!!flags.make (1,Signal_subnormal)
			exponent_limit := Maximum_exponent
		ensure
			digits_set: digits = a_digits
			rounding_mode_set:     rounding_mode     = a_rounding_mode
			exponent_limit: exponent_limit = Maximum_exponent
		end 
 	
 feature -- Constants
 
 	Rounds : ARRAY[INTEGER] is
 		once
 			Result := <<ROUND_HALF_UP,ROUND_UNNECESSARY,ROUND_CEILING,ROUND_DOWN,ROUND_FLOOR,ROUND_HALF_DOWN,ROUND_HALF_EVEN,ROUND_UP>>
 		end

 feature -- Access
 
	 digits : INTEGER
	  		-- The number of digits (precision) to be used for an operation.
	  		-- A value of 0 indicates that unlimited precision (as many digits
	  		-- as are required) will be used.
	   		-- The DECIMAL operators use this value to determine the precision of results.
	   		-- Note that leading zeros (in the integer part of a number) are never significant.

	precision : INTEGER is
			-- synonym for 'digits'
		do
			Result := digits
		ensure
			synonym_of_digits: Result = digits
		end
		
	rounding_mode : INTEGER
			-- Rounding algorithm to be used for an operation when non-zero digits have to
	  		-- be discarded in order to reduce the precision of a result.
 
 	reason : STRING
	 		-- Reason of latest raised signal
 
 	exponent_limit : INTEGER
 			-- exponent limit.  Exponents can range from -exponent_limit through +exponent_limit
 			
 	e_tiny : INTEGER is 
 			-- minimum value of the exponent for subnormal numbers
 		do
 			Result := (-exponent_limit) - (digits - 1)
 		end
 		
 feature -- Access 
 
 	default_context : EDA_MATH_CONTEXT is
 			-- default context for general purpose arithmetic
 		once
 			!!Result.make_default
 		end

feature -- Status report

	is_flagged (a_signal : INTEGER) : BOOLEAN is
			-- is `a_signal' flagged ?
		require
			valid_signal: valid_signal (a_signal)
		do
			Result := flags.item (a_signal)
		end
		
	is_trapped (a_signal : INTEGER) : BOOLEAN is
			-- is `a_signal' trapped ?
		require
			valid_signal: valid_signal (a_signal)
		do
			Result := traps.item (a_signal)
		end

	valid_signal (a_signal : INTEGER) : BOOLEAN is
			-- is `a_signal' a valid one ?
		do
			Result := INTEGER_ARRAY_.has (signals,a_signal)
		end

	is_extended : BOOLEAN
	
	exception_on_trap : BOOLEAN
	
feature -- Status setting

	set_digits (some_digits : INTEGER) is
			-- set `digits' to `some_digits'
			-- digits = 0 <=> calculations in plain, unlimited precision (risky!)
		require
			some_digits_valid: some_digits >= Minimum_digits and some_digits <= Maximum_digits
		do
			digits := some_digits
		ensure
			digits_set: digits = some_digits
		end
		
	set_exponent_limit (a_limit : INTEGER) is
			-- set `exponent_limit' to `a_limit'
		require
			limit_positive: a_limit >= 0
--			IEEE854_3_1_constraint: a_limit >= 10 * digits
		do
			exponent_limit := a_limit
		ensure
			limit_set: exponent_limit = a_limit
		end
	
	enable_exception_on_trap is
			-- enable exception when trap occurs
		do
			exception_on_trap := True
		end
		
	disable_exception_on_trap is
			-- disable exception when trap occurs
		do
			exception_on_trap := False
		end
		
--	set_format (a_format : INTEGER) is
--			-- set `format' to `a_format'
--		require
--			a_format_valid: a_format = Format_plain or a_format = Format_scientific or a_format = Format_engineering
--		do
--			format := a_format
--		ensure
--			format_set: format = a_format
--		end

	enable_trap (a_signal : INTEGER) is
			-- enable trapping of `a_signal'
		require
			valid_signal: valid_signal (a_signal)
		do
			traps.put (True, a_signal)
		ensure
			trapped_signal: is_trapped (a_signal)
		end
		
	disable_trap (a_signal : INTEGER) is
			-- enable trapping of `a_signal'
		require
			valid_signal: valid_signal (a_signal)
		do
			traps.put (False, a_signal)
		ensure
			not_trapped_signal: not is_trapped (a_signal)
		end

	set_flag (a_signal : INTEGER) is
			-- flag `a_signal'
		require
			valid_signal: valid_signal (a_signal)
		do
			flags.put (True, a_signal)
		ensure
			flagged_signal: is_flagged (a_signal)
		end
		
	reset_flag (a_signal : INTEGER) is
			-- reset `a_signal'
		require
			valid_signal: valid_signal (a_signal)
		do
			flags.put (False, a_signal)
		ensure
			unflagged_signal: not is_flagged (a_signal)
		end

	reset_flags is
			-- reset all signals to zero !
		local
			index : INTEGER
		do
			from index := flags.lower
			until index > flags.upper
			loop flags.put (False, index); index := index + 1
			end	
		end
		
	set_rounding_mode (a_mode : INTEGER) is
			-- set `rounding_mode' to `a_mode'
		require
			valid_mode: INTEGER_ARRAY_.has (Rounds, a_mode)
		do
			rounding_mode := a_mode
		ensure
			rounding_mode_set: rounding_mode = a_mode
		end

	set_extended is do is_extended := True ensure extended: is_extended end
	set_normal is do is_extended := False ensure normal: not is_extended end
	
feature -- Conversion

	out : STRING is
		do
			!!Result.make (30)
			Result.append ("digits=")
			Result.append (digits.out)
			Result.append (" format=")
--			Result.append (Form_words.item(Form_words.lower+format))
			Result.append (" rounding_mode=")
			Result.append (Round_words.item (Round_words.lower+rounding_mode))
		end

feature -- Basic operations

	signal (a_signal : INTEGER; a_message : STRING) is
			-- raise flag `a_signal' for `a_message' reason
		require
			valid_signal: valid_signal (a_signal)
			a_message_not_void: a_message /= Void
		local
			exception_message : STRING
		do
			set_flag (a_signal)
			reason := a_message
			if is_trapped (a_signal) and then exception_on_trap then
				exception_message := clone (signal_words.item (a_signal))
				exception_message.append (" : ")
				exception_message.append (a_message)
				raise (exception_message)	
			end
		ensure
			flagged_signal: is_flagged (a_signal)
			reason_set: reason = a_message
		end
		
	copy (other : like Current) is
			-- copy `other'
		do
			standard_copy (other)
			!!flags.make (other.flags.lower, other.flags.upper)
			flags.copy (other.flags)
			!!traps.make (other.traps.lower, other.traps.upper)
			traps.copy (other.flags)
		end
		
feature {NONE} -- Implementation

 	Round_words : ARRAY[STRING] is
 		once
 			Result := <<"Round_up", "Round_down", "Round_ceiling", "Round_floor", "Round_half_up", 
  						"Round_half_down", "Round_half_even", "Round_unnecessary">>
  		end

	signals : ARRAY[INTEGER] is
		once
			Result := << Signal_division_by_zero, Signal_inexact, Signal_invalid_operation,
						Signal_lost_digits, Signal_overflow, Signal_rounded, Signal_underflow, Signal_subnormal>>
		end
	
feature {DECIMAL_TESTER, EDA_MATH_CONTEXT}

  	Signal_words : ARRAY[STRING] is
  		once
  			Result := << "division_by_zero", "inexact", "invalid_operation",
						"lost_digits", "overflow", "rounded", "underflow", "subnormal">>
  		end

	flags : ARRAY[BOOLEAN]

	traps : ARRAY[BOOLEAN]
		
invariant
	non_negative_digits: not (digits < 0)
--	format_valid: format = Format_plain or format = Format_scientific or format = Format_engineering
	rounding_mode_valid: rounding_mode = Round_ceiling or rounding_mode = Round_down 
			or rounding_mode = Round_floor or rounding_mode = Round_half_down 
			or rounding_mode = Round_half_even or rounding_mode = Round_half_up
			or rounding_mode = Round_unnecessary or Rounding_mode = Round_up
			
end -- class EDA_MATH_CONTEXT

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
