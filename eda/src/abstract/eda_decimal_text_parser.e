indexing

	description: "Decimal number parsers, whose BNF syntax follows :  %
		% sign ::= '+' | '-' %
		% digit ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' %
		% indicator ::= 'e' | 'E' %
		% digits ::= digit [digit]... %
		% decimal-part ::= digits '.' [digits] | ['.'] digits %
		% exponent-part ::= indicator [sign] digits %
		% infinity ::= 'Infinity' | 'Inf' %
		% nan ::= 'NaN' | 'sNaN' %
		% numeric-value ::= decimal-part [exponent-part] | infinity %
		% numeric-string ::= [sign] numeric-value | nan	 "

	library: "EDA"
	author: "Paul G. Crismer"

	date: "$Date: 2003/11/11 20:00:32 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

	note: "This is a 'quick-and-dirty' implementation"

class
	EDA_DECIMAL_TEXT_PARSER

inherit
	EDA_DECIMAL_PARSER

	KL_IMPORTED_CHARACTER_ROUTINES
	
feature {EDA_DECIMAL} -- Access

--	coefficient_sign : CHARACTER
--	coefficient : STRING
--
--	stripped_coefficient : STRING
--
--	dot : INTEGER
--	exponent_sign : CHARACTER
--	exponent : STRING
--
--
--	stripped_coefficient_digits_count : INTEGER is
--			require
--				no_error: not error
--			do
--				Result := stripped_coefficient.count
--				if stripped_coefficient.has  ('.') then
--					Result := Result - 1
--				end
--			end
--
--
--	coefficient_decimals_count : INTEGER is
--			require
--				no_error : not error
--			do
--				if dot > 0 then
--					Result := coefficient.count - dot
--				end
--			end
--
--
--feature -- Status report
--
--	error : BOOLEAN
--
--feature {EDA_DECIMAL} -- Status report
--
--	is_infinity : BOOLEAN
--	is_nan : BOOLEAN
--	is_snan : BOOLEAN
--
--	is_special : BOOLEAN is do Result := is_infinity or else is_nan or else is_snan end
--
--	error_message : STRING
--
--	has_explicit_exponent : BOOLEAN is do Result := exponent /= Void end
--
--feature -- Basic operations
--
--	parse (string : STRING) is
--			-- parse `string' and create `last_result' if no error
--		local
--			rescued : BOOLEAN
--		do
--			if not rescued then
--				create last_decimal.make_from_string (string)
--			else
--				last_decimal := Void
--			end
--		rescue
--			rescued := True
--			retry
--		end
--
--feature {EDA_DECIMAL} -- Basic operations
--
--	decimal_parse (string : STRING) is
--		local
--			after_sign : INTEGER
--			after_e : INTEGER
--			parse_end : INTEGER
--			limit : INTEGER
--		do
--			-- Initialize
--			is_infinity := False
--			is_nan := False
--			is_snan := False
--			coefficient := Void
--			exponent := Void
--			error := False
--			error_message := Void
--			parsed_string := string
--			limit := parsed_string.count
--			coefficient_start := -1; coefficient_end := -1
--			exponent_start := -1; exponent_end := -1
--			-- Parse
--			after_sign := after_parsed_optional_character (1,"+-")
--			coefficient_sign := optional_character
--			parse_coefficient (after_sign)
--			if not error and then coefficient_end + 1 < limit then
--				after_e := after_parsed_optional_character (coefficient_end + 1,"Ee")
--				if optional_character /= '%U' then
--					if after_e <= limit then
--						parse_exponent (after_e)
--						parse_end := exponent_end
--					else
--						put_error ("EXPONENT -- 'e' whithout exponent part")
--					end
--				else
--					exponent_start := -1
--					parse_end := coefficient_end
--				end
--			else
--				parse_end := coefficient_end
--			end
--			if parse_end < parsed_string.count then
--				put_error ("SYNTAX ERROR - Character left after parse")
--			end
--			if not error and then not is_special then
--				coefficient := string.substring (coefficient_start, coefficient_end)
--				if has_exponent then
--					exponent := string.substring (exponent_start, exponent_end)
--				else
--					exponent := Void
--				end
--				create_stripped_coefficient
--			end
--		end
--
--feature {NONE} -- Implementation
--
--	has_exponent : BOOLEAN is do Result := exponent_start /= -1 end
--
--	coefficient_start, coefficient_end : INTEGER
--	exponent_start, exponent_end : INTEGER
--
--	parsed_string : STRING
--
--	optional_character : CHARACTER
--
--	parse_coefficient (start : INTEGER) is
--		local
--			after_dot : INTEGER
----			after_coefficient : INTEGER
--			after_integer_part : INTEGER
--			after_decimal_part : INTEGER
--			limit : INTEGER
--			temp_string : STRING
--			c : CHARACTER
--			integer_part_exists, decimal_part_exists : BOOLEAN
--		do
--			coefficient_start := start
--			limit := parsed_string.count
--			if coefficient_start <= parsed_string.count then
--				c := parsed_string.item (coefficient_start)
--				inspect c
--				when '0'..'9', '.' then
--					after_integer_part := after_parsed_number (coefficient_start)
--					if after_integer_part <= limit then
--						after_dot := after_parsed_optional_character (after_integer_part, ".")
--						-- no dot ?
--						if after_dot = after_integer_part then
--							-- no dot !
--							-- check if special value
--							dot := -1 -- no dot
--							coefficient_end := after_integer_part - 1
--						else
--							-- there is a dot
--							dot := after_dot - coefficient_start
--							-- parse decimal part
--							if after_dot <= limit then
--								after_decimal_part := after_parsed_number (after_dot)
--								coefficient_end := after_decimal_part - 1
--							else
--								coefficient_end := after_dot - 1
--							end
--						end
--					else
--						coefficient_end := after_integer_part - 1
--					end
--					integer_part_exists := after_integer_part > start
--					decimal_part_exists := (dot >= 0 and then after_decimal_part > after_dot)
--					if coefficient_end < coefficient_start then
--						put_error ("coefficient - coefficient must have at least one digit")
--					elseif not (integer_part_exists or else decimal_part_exists) then
--						put_error ("no integer, nor decimal part")
--					end
--				when 'i','I','s','S','q','Q','n','N' then
--					temp_string := parsed_string.substring(start, parsed_string.count)
--					temp_string.to_lower
--					if temp_string.is_equal ("inf") or else temp_string.is_equal ("infinity") then
--						is_infinity := True
--					elseif temp_string.is_equal ("nan") or else temp_string.is_equal ("qnan") then
--						is_nan := True
--					elseif temp_string.is_equal ("snan") then
--						is_snan := True
--					else
--						put_error ("Invalid string")
--					end
--					coefficient_end := parsed_string.count
--				else
--					put_error ("Invalid string")
--				end
--			else
--				coefficient_end := parsed_string.count
--				put_error ("Coefficient is empty")
--			end
--		end
--
--	parse_exponent (start : INTEGER) is
--		local
--			after_sign, after_exponent : INTEGER
--		do
--			after_sign := after_parsed_optional_character (start,"+-")
--			after_exponent := after_parsed_number (after_sign)
--			exponent_sign := optional_character
--			exponent_start := after_sign
--			exponent_end := after_exponent - 1
--			if exponent_end < exponent_start then
--				put_error ("EXPONENT - Exponent must have at leas one digit")
--			end
--		end
--
--	after_parsed_number (start_index : INTEGER) : INTEGER is
--		local
--			i, limit : INTEGER
--		do
--			from
--				i := start_index
--				limit := parsed_string.count
--			until
--				i > limit or else not is_digit (parsed_string.item (i))
--			loop
--				i := i + 1
--			end
--			Result := i
--		ensure
--			parsed_number: True -- Result > start_index
--			no_parsed_number: True -- Result = start_index
--		end
--
--	after_parsed_optional_character (start_index : INTEGER; possible_characters : STRING) : INTEGER is
--		local
--			c : CHARACTER
--		do
--			if start_index <= parsed_string.count then
--				c := parsed_string.item (start_index)
--				if possible_characters.has(c) then
--					Result := start_index + 1
--					optional_character := c
--				else
--					Result := start_index
--					optional_character := '%U'
--				end
--			else
--				c := '%U'
--				Result := start_index
--			end
--		end
--
--	put_error (s : STRING) is
--		do
--			error := True
--			if error_message = Void then
--				!!error_message.make (30)
--			end
--			if error_message.count > 0 then
--				error_message.append ("; ")
--			end
--			error_message.append (s)
--		end
--
--	create_stripped_coefficient is
--			-- coefficient without leading zeroes
--		local
--			i, coefficient_begin, coefficient_digits, dot_offset : INTEGER
--			done : BOOLEAN
--			c : CHARACTER
--		do
--			-- Strip leading zeros/dot; leave final if all 0's
--			from
--				i := 1
--				coefficient_begin := 1
--				coefficient_digits := coefficient_digits_count
--				dot_offset := dot
--				done := False
--			until
--				i >= coefficient.count or else done
--			loop
--				c := coefficient.item (i)
--				if c = '0' then
--					coefficient_begin := coefficient_begin + 1
--					dot_offset := dot_offset - 1
--					coefficient_digits := coefficient_digits - 1
--				elseif c = '.' then
--					coefficient_begin := coefficient_begin + 1
--					dot_offset := dot_offset - 1
--				elseif c <= '9' then
--					done := True
--				else -- (?????)
--					coefficient_begin := coefficient_begin + 1
--					dot_offset := dot_offset - 1
--					coefficient_digits := coefficient_digits - 1
--				end
--				i := i + 1
--			end
--			stripped_coefficient := coefficient.substring (coefficient_begin, coefficient.count)
--			if stripped_coefficient.is_equal (".") then
--				stripped_coefficient := "0"
--			end
--		end
--
--	coefficient_digits_count : INTEGER is
--			require
--				no_error: not error
--			do
--				Result := coefficient.count
--				if Result > 1 and then dot > 0 then
--					Result := Result - 1
--				end
--			end
--
--	is_digit (c : CHARACTER) : BOOLEAN is
--				-- is `c' a digit ?
--			do
--				Result := (c >= '0' and then c <= '9')
--			end

feature {NONE} -- Implementation

	state_decimal_part, state_signed_exponent, state_decimal_point, state_integer_part, state_start, state_error, state_stop, state_numeric_value, state_exponent : INTEGER is unique

feature -- Access

	sign : INTEGER
	exponent_sign : INTEGER
	state : INTEGER
	error_code : INTEGER

	coefficient : STRING
	decimal_part_count : INTEGER
	exponent : STRING
	
	
feature -- Status report

	error : BOOLEAN
	
	is_comma_allowed : BOOLEAN

	is_infinity, is_nan, is_snan, is_numeric_value : BOOLEAN
	has_point, has_exponent, has_exponent_sign : BOOLEAN
	decimal_point_is_comma : BOOLEAN
	
	
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
			is_comma_allowed := True
			create last_decimal.make_from_string (s)
			-- is_nan
			-- is_snan
			-- is_infinity
			-- sign, coefficient, exponent_sign, exponent			
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
		end
		
feature {EDA_DECIMAL} -- Basic operations

	decimal_parse (s : STRING) is
			-- effective parsing
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		local
			c : CHARACTER
			index : INTEGER
		do
			if coefficient = Void then
				create coefficient.make (30)
			end
			if exponent = Void then
				create exponent.make (10)
			end
			from
				-- initializations
				state := state_start
				sign := 1
				exponent_sign := 1
				has_point := False
				has_exponent := False
				exponent.keep_head (0)
				coefficient.wipe_out --keep_head (0)
				decimal_part_count := 0 --keep_head (0)
				index := 1
			until
				state = state_error or else state = state_stop or else index > s.count
			loop
				c := s.item (index)
				inspect state
				when state_start then
					inspect c
					-- sign
					when '+' then sign := 1 ; state := state_numeric_value; is_numeric_value := True; state := State_numeric_value
					when '-' then sign := -1; state := state_numeric_value; is_numeric_value := True; state := State_numeric_value
					-- infinity
					when 'I', 'i' then
						inspect s.count
						when 3 then if substring_equal (s, index+1,index+2, "nf") then
								is_infinity := True; state := state_stop
							else
								state := state_error; error_code := error_invalid_value
							end
						when 8 then if substring_equal (s, index+1, index+7, "nfinity") then
								is_infinity := True; state := state_stop
							else
								state := state_error; error_code := error_invalid_value
							end
						else
							state := state_error; error_code := error_invalid_value
						end
					when 'N', 'n' then if substring_equal (s, 2, 3, "aN") then
								is_nan := True; state := state_stop
							else
								state := state_error; error_code := error_invalid_value
							end
					when 's', 'S' then if substring_equal (s, 2, 4, "NaN") then
							is_snan := True; state := state_stop
							else
								state := state_error
								error_code := error_invalid_value
							end
					when '0'..'9' then
							is_numeric_value := True
							state := state_integer_part
							coefficient.append_character (c)
					when '.',',' then
							is_numeric_value := True
							has_point := True
							state := state_decimal_point
							decimal_point_is_comma := (c = ',')
					else
						state := state_error
						error_code := error_invalid_character
					end
				when State_numeric_value then
					inspect c
					when 'I', 'i' then
						inspect s.count
						when 3,4 then if substring_equal (s, index+1,index+2, "nf") then
								is_infinity := True; state := state_stop
							else
								state := state_error; error_code := error_invalid_value
							end
						when 8,9 then if substring_equal (s, index+1, index+7, "nfinity") then
								is_infinity := True; state := state_stop
							else
								state := state_error; error_code := error_invalid_value
							end
						else
							state := state_error; error_code := error_invalid_value
						end
					when '0'..'9' then
							is_numeric_value := True
							state := state_integer_part
							coefficient.append_character (c)
					when '.',',' then
							is_numeric_value := True
							has_point := True
							state := state_decimal_point
							decimal_point_is_comma := (c = ',')
					else
						state := state_error
						error_code := error_invalid_character
					end					
				when state_integer_part then
					inspect c
					when '0'..'9' then
						coefficient.append_character (c)
					when '.',',' then
						state := state_decimal_part
						has_point := True
						decimal_point_is_comma := (c = ',')
					when 'e','E' then
						has_exponent := True
						state := state_signed_exponent
					else
						state := state_error
						error_code := error_invalid_character_in_integer_part
					end
				when state_decimal_point then
					inspect c
					when '0'..'9' then
						decimal_part_count := decimal_part_count + 1
						coefficient.append_character (c)
						state := State_decimal_part
					else
						state := state_error; error_code := Error_invalid_character_in_decimal_part
					end
				when state_decimal_part then
					inspect c
					when '0'..'9' then
						decimal_part_count := decimal_part_count + 1
						coefficient.append_character (c)
					when 'e','E' then
						has_exponent := True
						state := state_signed_exponent
					else
						state := state_error; error_code := error_invalid_character_in_decimal_part
					end
				when state_signed_exponent then
					inspect c
					when '-' then 
						if not has_exponent_sign then
							exponent_sign := -1; has_exponent_sign := True; state := state_exponent
						else
							state := state_error; error_code := Error_invalid_character_in_exponent
						end
					when '+' then 
						if not has_exponent_sign then
							exponent_sign := +1; has_exponent_sign := True; state := state_exponent
						else
							state := state_error; error_code := Error_invalid_character_in_exponent
						end
					when '0'..'9' then
						exponent.append_character (c); state := state_exponent
					else
						state := state_error; error_code := error_invalid_character_in_exponent
					end
				when state_exponent then
					inspect c
					when '0'..'9' then
						exponent.append_character (c)
					else
						state := state_error; error_code := error_invalid_character_in_exponent
					end
				else
					state := state_error; error_code := error_invalid_state
				end
				index := index + 1
			end
			inspect state
			when state_error, state_decimal_point, state_start, state_signed_exponent then
				error := True
			when State_exponent then
				if exponent.count = 0 then
					error := True
				end
			else
				error := False
			end
			if decimal_point_is_comma and then not is_comma_allowed then
				error := True
			end
		end

	substring_equal (s : STRING; i_begin, i_end : INTEGER; t : STRING) : BOOLEAN is
			-- is s[i_begin, i_end] equal to t[1,t.count] ?
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
			definition: Result = (s.substring (i_begin, i_end).is_equal (t))
		end
		
	error_invalid_value, error_invalid_character, error_invalid_character_in_integer_part,
	error_invalid_character_in_decimal_part,
	error_invalid_character_in_exponent,
	error_invalid_state : INTEGER is unique
	
invariant
	exponent_integer: exponent = Void or else (not exponent.is_empty implies exponent.is_integer)
end -- class EDA_DECIMAL_TEXT_PARSER

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
