indexing

	description: "Decimal number parsers, whose BNF syntax follows :  %
		% sign ::= '+' | '-' %
		% digit ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' %
		% indicator ::= 'e' | 'E' %
		% digits ::= digit [digit]... %
		% point ::= '.' | ',' %
		% decimal-part ::= digits point [digits] | [point] digits %
		% exponent-part ::= indicator [sign] digits %
		% infinity ::= 'Infinity' | 'Inf' %
		% nan ::= 'NaN' | 'sNaN' %
		% numeric-value ::= decimal-part [exponent-part] | infinity %
		% numeric-string ::= [sign] numeric-value | nan	 "

	note: "Those parsers use a finite state automaton described <a href=%"doc/decimal_parser_fsm.png%">here</a>"
	
	library: "EDA"
	author: "Paul G. Crismer"

	date: "$Date: 2003/11/20 20:33:15 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	EDA_DECIMAL_TEXT_PARSER

inherit
	EDA_DECIMAL_PARSER

	KL_IMPORTED_CHARACTER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	sign : INTEGER
		-- sign of last parsed decimal
		
	exponent_sign : INTEGER
		-- sign of exponent of last parsed decimal
		
	state : INTEGER
		-- last state of parsing finite state automaton
		
	error_code : INTEGER
		-- description of last error
		
	coefficient_begin : INTEGER
		-- index of last parsed coefficient begin

	coefficient_end : INTEGER
		-- index of last parsed coefficient end

	coefficient_count : INTEGER is do Result := coefficient_end - coefficient_begin + 1 end		

	fractional_part_count : INTEGER is 
			-- number of characters in the fractional part
		do
			if decimal_point_index > 0 then
				Result := coefficient_end - decimal_point_index
			end	
		end
	
	exponent_as_double : DOUBLE
			-- exponent expressed as double
		
	exponent_begin : INTEGER
			-- index of last parsed first exponent character
		
	exponent_end : INTEGER
			-- index of  last parsed last exponent character
			
	exponent_significant_digits : INTEGER
			-- count of significant digits in exponent
			
	exponent_count : INTEGER is 
			-- count of significant digits in exponent; synonym of `exponent_significant_digits'
		do 
			Result := exponent_significant_digits 
		end	
	
	decimal_point_index : INTEGER
		-- index of decimal point if any
		
feature -- Status report

	error : BOOLEAN is 
			-- has there been an error in last parse operation ?
		do 
			Result := state = State_error 
		end
	
	is_comma_allowed : BOOLEAN
			-- is ',' allowed as fractional part separator ?

	is_infinity : BOOLEAN is 
			-- is last parsed number an 'Infinity' ?
		do 
			Result := not error and then state = State_infinity 
		end
		
	is_nan : BOOLEAN is 
			-- is last parsed number a 'Not a Number'?
		do 
			Result := not error and then state = State_nan 
		end
	
	is_snan : BOOLEAN is 
			-- is last parsed number a 'Signaling NaN' ?
		do 
			Result := not error and then state = State_snan 
		end
	
	has_point : BOOLEAN is 
			-- has last parsed number a fractional part ?
		do 
			Result := decimal_point_index /= 0 
		end
		
	has_exponent : BOOLEAN is 
			-- has last parsed number an exponent ?
		do 
			Result := exponent_begin > 0 
		end
		
	decimal_point_is_comma : BOOLEAN
			-- has last parsed number a comma as decimal point ?	
	
feature -- Basic operations

	parse (s : STRING) is
			-- parse `s'
		require else
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		local
			old_allowed : BOOLEAN
		do
			old_allowed := is_comma_allowed
			is_comma_allowed := False
			create last_decimal.make_from_string (s)
			is_comma_allowed := old_allowed
		end

	parse_with_decimal_point_comma (s : STRING) is
			-- parse `s' with comma as decimal point
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		local
			old_allowed : BOOLEAN
		do
			old_allowed := is_comma_allowed
			is_comma_allowed := True
			create last_decimal.make_from_string (s)
			is_comma_allowed := old_allowed
		ensure
			no_mode_change: is_comma_allowed = old is_comma_allowed
		end
		
feature {EDA_DECIMAL} -- Basic operations

	decimal_parse (s : STRING) is
			-- effective parse of `s'
		require
			s_not_void: s /= Void
		local
			c : CHARACTER
			index : INTEGER
		do
			from
				-- initializations
				state := state_start
				sign := 1
				exponent_sign := 1
				exponent_as_double := 0
				index := 1
				coefficient_begin := 0
				coefficient_end := 0
				exponent_begin := 0
				exponent_end := 0
				exponent_significant_digits := 0
				decimal_point_index := 0
				decimal_point_is_comma := False
			until
				state = state_error or else index > s.count
			loop
				c := s.item (index)
				inspect state
				when state_start then
					process_start (c, index, s)
				when state_sign then
					process_sign (c, index, s)
				when state_integer_part then
					process_integer_part (c, index)
				when state_starting_point then
					process_starting_point (c, index)
				when state_point then
					process_point (c, index)
				when state_comma then
					process_comma (c, index)
				when state_fractional_part then
					process_fractional_part (c, index)
				when state_start_exponent then
					process_start_exponent (c, index)
				when state_exponent_sign then
					process_exponent_sign (c, index)
				when state_exponent then
					process_exponent (c, index)
				when State_infinity, State_snan, State_nan then
					index := s.count
				else
					state := State_error
				end
				index := index + 1
			end
			inspect state
			when state_start, state_sign, state_comma, 
				 		state_start_exponent, state_exponent_sign, state_starting_point then
				state := State_error
			else
				do_nothing
			end
			if decimal_point_is_comma and then not is_comma_allowed then
				state := State_error
			end
		end

	process_start (c : CHARACTER; index : INTEGER; s : STRING) is 
		do
			inspect c
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_integer_part
			when '+','-' then
				if c='-' then
					sign := -1
				else
					sign := +1
				end
				state := State_sign
			when 'n','N' then
				if case_insensitive_substring_equal (s, index + 1, s.count, "an") then
					state := State_nan
				else
					state := state_error
					error_code := Error_invalid_value
				end
			when 's', 'S' then
				if case_insensitive_substring_equal (s, index + 1, s.count, "nan") then
					state := State_snan
				else
					state := state_error
					error_code := Error_invalid_value
				end
			when 'i','I' then
				handle_i (s, index)
			when '.' then
				coefficient_begin := index
				coefficient_end := index
				decimal_point_index := index
				state := State_starting_point
			else
				state := state_error
				error_code := Error_invalid_character
			end
		ensure
			next_state: error or else state /= State_start
		end
		
	handle_i (s : STRING; index : INTEGER) is
			-- handle the case of 'i' or 'I' recognized in `s' at `index'
		require
			s_exists: s /= Void
			index_in_s: index > 0 and then index <= s.count
		do
			if case_insensitive_substring_equal (s, index + 1, index + 2, "nf") then
				if (s.count - index + 1)= 3 or else case_insensitive_substring_equal (s, index + 3, s.count, "inity") then
					state := State_infinity
				else
					state := state_error
					error_code := Error_invalid_value
				end
			end			
		ensure
			definition: not error implies is_infinity and then state = State_infinity
		end
		
	process_sign (c : CHARACTER; index : INTEGER; s : STRING) is 
			-- process `c' at `index' in `s'
		require
			state_sign: state = state_sign
			s_exists: s /= Void
			index_in_s: index > 0 and then index <= s.count
		do
			inspect c
			when 'i', 'I' then
				handle_i (s, index)
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_integer_part
			when '.' then
				coefficient_begin := index
				coefficient_end := index
				decimal_point_index := index
				state := State_starting_point
			else
				state := state_error
				error_code := Error_invalid_character
			end
		end
		
	process_integer_part (c : CHARACTER; index : INTEGER) is
			-- process `c' at `index' when in state_integer_part
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
			when 'e', 'E' then
				state := State_start_exponent
			when '.' then
				coefficient_end := coefficient_end + 1
				decimal_point_index := index
				state := State_point
			when ',' then
				coefficient_end := coefficient_end + 1
				decimal_point_index := index
				decimal_point_is_comma := True
				state := State_comma
			else
				state := state_error
				error_code := Error_invalid_character_in_integer_part
			end
		end
		
	process_starting_point(c : CHARACTER; index : INTEGER) is
			-- process `c' at `index' when at state_starting_point
		require
			state_starting_point: state = state_starting_point
		do
			inspect c
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_fractional_part
			else
				state := state_error
				error_code := Error_invalid_character
			end
		end
		
	process_point (c : CHARACTER; index : INTEGER) is
			-- process `c' at `index' when in state_point
		require
			state_point: state = state_point
		do  
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
				state := State_fractional_part
			when 'e','E' then
				state := State_start_exponent
			else
				state := state_error
				error_code := Error_invalid_character
			end
		end
		
	process_comma (c : CHARACTER; index : INTEGER) is 
			-- process `c' at `index' when in state_comma
		require
			state_comma: state = state_comma
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
				state := State_fractional_part
			else
				state := state_error
				error_code := Error_invalid_character
			end
		end
		
	process_fractional_part (c : CHARACTER; index : INTEGER) is 
			-- process `c' at `inddex' when in state_fractional_part
		require
			State_fractional_part: state = State_fractional_part
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
			when 'e','E' then
				state := State_start_exponent
			else
				state := state_error
				error_code := Error_invalid_character_in_decimal_part
			end
		end
		
	process_start_exponent (c : CHARACTER; index : INTEGER) is 
			-- process `c' at `index' when in State_start_exponent
		require
			State_start_exponent: state = State_start_exponent
		do
			inspect c
			when '0'..'9' then
				exponent_as_double := c.code - ('0').code
				exponent_begin := index
				exponent_end := index
				if exponent_as_double > 0 then
					exponent_significant_digits := 1
				end
				state := State_exponent
			when '+','-' then
				if c = '-' then
					exponent_sign := -1
				else
					exponent_sign := + 1
				end
				state := State_exponent_sign
			else
				state := state_error
				error_code := Error_invalid_character_in_exponent
			end
		end
		
	process_exponent_sign (c : CHARACTER; index : INTEGER) is 
			-- process `c' at `index' when in State_exponent_sign
		require
			State_exponent_sign: state = State_exponent_sign
		do  
			inspect c
			when '0'..'9'  then
				exponent_as_double := c.code - ('0').code
				exponent_begin := index
				exponent_end := index
				if exponent_as_double > 0 then
					exponent_significant_digits := 1
				end
				state := State_exponent
			else
				state := state_error
				error_code := Error_invalid_character_in_exponent
			end
		end
		
	process_exponent (c : CHARACTER; index : INTEGER) is 
			-- process `c' at `index' when in State_exponent
		require
			State_exponent: state = State_exponent
		do  
			inspect c
			when '0'..'9'  then
				exponent_as_double := exponent_as_double * 10 + (c.code - ('0').code)
				exponent_end := exponent_end + 1
				if exponent_as_double > 0 then
					exponent_significant_digits := exponent_significant_digits + 1
				end
				state := State_exponent
			else
				state := state_error
				error_code := Error_invalid_character_in_exponent
			end
		end
	
	case_insensitive_substring_equal (s : STRING; i_begin, i_end : INTEGER; t : STRING) : BOOLEAN is
			-- is s[i_begin, i_end] equal to t[1,t.count] - case insensitive ?
		require
			s_not_void: s /= Void
			t_not_void: t /= Void
		local
			i, j : INTEGER
		do
			from
				i := i_begin
				j := 1
			until
				i > s.count or else j > t.count or else i > i_end or else Character_.as_lower (s.item (i)) /= Character_.as_lower (t.item (j))
			loop
				i := i + 1; j := j + 1
			end
			Result := (i > i_end and then j > t.count)
		ensure
			definition: Result = (STRING_.as_lower(s.substring (i_begin, i_end)).is_equal (STRING_.as_lower(t)))
		end
		
feature -- Constants

	state_start,
	state_NaN,
	state_sNaN,
	state_starting_point,
	state_infinity,
	state_integer_part,
	state_point,
	state_fractional_part,
	state_exponent,
	state_sign,
	state_comma,
	state_start_exponent,
	state_exponent_sign, state_error : INTEGER is unique

feature {NONE} -- Implementation

	error_invalid_value, error_invalid_character, error_invalid_character_in_integer_part,
	error_invalid_character_in_decimal_part,
	error_invalid_character_in_exponent,
	error_invalid_state : INTEGER is unique
	
invariant
	decimal_point_is_comma_implies_has_fractional_part: decimal_point_is_comma implies has_point
	
end -- class EDA_DECIMAL_TEXT_PARSER

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
