indexing
	description: "General Decimal Arithmetic test cases parsing and execution."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:05:39 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

deferred class
	TEST_DECIMAL_GENERAL

inherit
	EDA_CONSTANTS
		export {NONE} all
		end
	
	DECIMAL_TESTER
	
	
feature {NONE} -- Initialization

	make_file (file_name : STRING) is
			-- make tests for reading `file_name' 
		do
			create file.make (file_name)
			file.open_read
			make
		end

	make is
			-- make; test shall be invoked by delegation, no file reading
		do
			!!ctx.make_default
			!!flags.make (1,Signal_subnormal)
		end
		
feature {TEST_DECIMAL_GENERAL} -- Access

	tag : STRING
	
	operation : STRING
	
	operand_a : STRING
	
	operand_b : STRING
	
	arrow : STRING
	
	expected_result : STRING
	
	flags : ARRAY[BOOLEAN]  --	LINKED_LIST[INTEGER]
	
	start_tag : STRING
	
	extended : INTEGER
	
	precision : INTEGER
	rounding : STRING
	max_exponent : INTEGER

	ctx : EDA_MATH_CONTEXT
	
feature -- Access

	file : KL_TEXT_INPUT_FILE
	
	count : INTEGER

	errors : INTEGER
		
	last_string_result : STRING

	last_result : EDA_DECIMAL

feature -- Measurement

feature {TEST_DECIMAL_GENERAL} -- Status report

	is_comment : BOOLEAN is
			-- is last_line a comment ?
		local
			index : INTEGER
		do
			if last_line.count > 0 then
				index := skipped_blanks (last_line, 1)
				if index <= last_line.count - 1 then
					if last_line.item (index) = '-' and then last_line.item (index + 1) = '-' then
						Result := True
					end
				end
			else
				Result := False
			end
		end

	is_quoted_a : BOOLEAN
	is_quoted_b : BOOLEAN
	
	is_directive : BOOLEAN is
			-- is last_line a directive ?
		do
			Result := last_line.index_of (':',1) /= 0
		end

	is_test : BOOLEAN is
			-- is last_line a test ?
		do
			Result := not (last_line.count = 0 or else is_comment or else is_directive)
		end

	is_ok : BOOLEAN
	
	waiting : BOOLEAN is
			-- is current waiting for a tag ?
		do
			Result := start_tag /= Void and then not start_tag_met
		end	
	
	start_tag_met : BOOLEAN
	
feature -- Status report

	off : BOOLEAN
			-- is there no current valid test to execute ?

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_start_tag (a_tag : STRING) is
			-- wait until `a_tag' is met
		require
			a_tag_not_void: a_tag /= Void
		do
			start_tag := a_tag
		ensure
			start_tag_set: start_tag = a_tag
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	start is
			-- try reading the first test case
		do
			if file = Void or else file.end_of_file then
				off := True
			else
				forth
			end
		end
		
	
	forth is
			-- try reading a next test case
		do
			read_case
			if file.end_of_file then
				off := True
			end
		end

feature {TEST_DECIMAL_GENERAL} -- Basic operations

	create_operand (s : STRING; a_ctx : EDA_MATH_CONTEXT) : EDA_DECIMAL is
			-- create operand from 's'
		require
			s_not_void: s /= Void
		local
			conversion_ctx : EDA_MATH_CONTEXT
		do
			conversion_ctx := clone (a_ctx)
			conversion_ctx.set_digits (s.count + 1)
			conversion_ctx.set_rounding_mode (a_ctx.Round_half_up) 
				--| create operands
			create Result.make_from_string_ctx (s, conversion_ctx)
			a_ctx.flags.copy (conversion_ctx.flags)
		end
		

	check_flags (a_ctx : EDA_MATH_CONTEXT) is
			-- check `a_ctx' flags against `the_flags'
		local
			local_flags : ARRAY[BOOLEAN]
			index : INTEGER
			tag_printed, flag : BOOLEAN
		do
			local_flags := clone (a_ctx.flags)
			from 
				index := flags.lower
				tag_printed := False
			until 
				index > flags.upper
			loop 
				if local_flags.item (index) /= flags.item (index) then
					flag := local_flags.item (index)
					if not tag_printed then
						print ("%T")
						print (tag)
						tag_printed := True
					end
					print ("%T"+ctx.signal_words.item(index) + "?" + local_flags.item (index).out)
				end
				index := index + 1
			end
			if tag_printed then
				print ("%N")
			end
		end
		
	do_operation (a_string, b_string : STRING; a_ctx : EDA_MATH_CONTEXT) is
			-- do operation
		local
			a, b : EDA_DECIMAL
		do
			a:= create_operand (a_string, a_ctx)
			if b_string /= Void then
				b := create_operand  (b_string, a_ctx)	
			else
				b := Void
			end
			a_ctx.reset_flags
			a.set_shared_decimal_context (a_ctx)
			is_ok := True
			execute_operation (a, b, a_ctx)
		end

	execute_operation (a, b : EDA_DECIMAL; a_ctx : EDA_MATH_CONTEXT) is
			deferred
			end

feature -- Basic operations

	execute is
			-- execute current test case
		require
			not_off: not off
		local
			expected : EDA_DECIMAL
			result_string : STRING
		do
			if waiting then
				if tag.is_equal (start_tag) then
					start_tag_met := True
				end
			end
			if not (tag.substring_index ("--", 1) > 0 or else operand_a.is_equal ("#") or else (operand_b /= Void and then operand_b.is_equal ("#"))) and then not waiting then
				expected := create_operand (expected_result, ctx)
				do_operation (operand_a, operand_b, ctx)
				if is_ok then
					count := count + 1
					--result_string := r.to_scientific_string
					result_string := last_string_result
					if result_string.is_equal (expected_result) then
					else
						errors := errors + 1
						print ("%T"+tag+" FAILED : "+ operand_a + " "+ operation  )
						if operand_b /= Void then
							print (" " + operand_b )
						end
						print (" /= " + expected_result + " GOT : "+ result_string + " - " + last_result.out + "%N")				
					end
					check_flags (ctx)
				end	
			end
		end
		
feature -- Obsolete

feature {TEST_DECIMAL_GENERAL} -- Inapplicable

	read_case is
			-- 
		do
			tag := Void
			--| skip comments and execute directives
			from
				if not file.end_of_file then
					file.read_line
				end
			until
				file.end_of_file or else is_test
			loop
				if is_directive then
					split
					execute_directive
				end
				file.read_line
			end
			if not file.end_of_file then
				split
				words.start
				tag := words.item_for_iteration; words.forth
				if tag.substring_index ("--", 1) = 0 then
					operation := words.item_for_iteration; words.forth
					operand_a := words.item_for_iteration; words.forth; 
					is_quoted_a := False
					is_quoted_b := False
					operand_a := bare_operand (operand_a)
--					if (operand_a.item (1) = '%'' and operand_a.item (operand_a.count) = '%'') or else
--						(operand_a.item (1) = '%"' and operand_a.item (operand_a.count) = '%"')					
--					then
--						operand_a := operand_a.substring (2, operand_a.count-1)
--						is_quoted_a := True
--					end
					operand_b := words.item_for_iteration; words.forth
					if not operand_b.is_equal ("->") then
						operand_b := bare_operand (operand_b)
--						if operand_b.item (1) = '%'' and operand_b.item (operand_b.count) = '%'' then
--							operand_b := operand_b.substring (2, operand_b.count-1)
--							is_quoted_b := True
--						end
						words.forth -- '->'
					else
						operand_b := Void
					end
					expected_result := words.item_for_iteration
					expected_result := bare_operand (expected_result)
					
--					if expected_result.item (1) = '%'' and expected_result.item (expected_result.count) = '%'' then
--						expected_result := expected_result.substring (2, expected_result.count-1)
--					end
					--Initialize flags
					initialize_flags (words)
				end
			end
		end

	bare_operand (s : STRING) : STRING is
			-- 
		do
			if (s.item (1) = '%'' and s.item (s.count) = '%'') or else
				(s.item (1) = '%"' and s.item (s.count) = '%"')					
			then
				Result := s.substring (2, s.count-1)
				is_quoted_a := True
			else
				Result := s
			end
		end
		
	initialize_flags (l_words : DS_LIST[STRING]) is
		local
			index : INTEGER
			flag : STRING
		do
			from index := flags.lower
			until index > flags.upper
			loop
				flags.put (False, index)
				index := index + 1
			end
			from
				l_words.forth
			until
				l_words.off
			loop
				flag := l_words.item_for_iteration
				if flag.is_equal ("Inexact") then
					flags.put (True, Signal_inexact)
				elseif flag.is_equal ("Lost_digits") then
					flags.put (True, Signal_lost_digits)
				elseif flag.is_equal ("Rounded") then
					flags.put (True, Signal_rounded)
				elseif flag.is_equal ("Overflow") then
					flags.put (True, Signal_overflow)
				elseif flag.is_equal ("Subnormal") then
					flags.put (True, Signal_subnormal)
				elseif flag.is_equal ("Underflow") then
					flags.put (True, Signal_underflow)
				elseif flag.is_equal ("Invalid_operation") then
					flags.put (True, Signal_invalid_operation)
				elseif flag.is_equal ("Division_undefined") then
					flags.put (True, Signal_invalid_operation)
				elseif flag.is_equal ("Division_impossible") then
					flags.put (True, Signal_invalid_operation)
				elseif flag.is_equal ("Division_by_zero") then
					flags.put (True, Signal_division_by_zero)
				end
				l_words.forth
			end
			
		end
		
		
--	skip_comments is
--		do
--			--skip comments
--			from
--				file.read_line
--			until
--				file.end_of_file or else not is_comment
--			loop
--				file.read_line
--			end
--			if file.end_of_file then
--				off := True
--			end
--		end
		
	execute_directive is
			-- 
		do
			words.start
			words.item_for_iteration.to_lower
			if words.item_for_iteration.is_equal ("version:") then
--				words.forth
--				ctx.set_ (words.item_for_iteration.to_integer)
			elseif words.item_for_iteration.is_equal ("extended:") then
				words.forth
				if words.item_for_iteration.to_integer = 1 then
					ctx.set_extended
				else
					ctx.set_normal
				end
			elseif words.item_for_iteration.is_equal ("precision:") then
				words.forth
				ctx.set_digits (words.item_for_iteration.to_integer)
			elseif words.item_for_iteration.is_equal ("rounding:") then
				words.forth
				words.item_for_iteration.to_lower
				if words.item_for_iteration.is_equal ("down") then
					ctx.set_rounding_mode (Round_down)
				elseif words.item_for_iteration.is_equal ("up")  then
					ctx.set_rounding_mode (Round_up)
				elseif words.item_for_iteration.is_equal ("half_up")  then
					ctx.set_rounding_mode (Round_half_up)
				elseif words.item_for_iteration.is_equal ("half_down")  then
					ctx.set_rounding_mode (Round_half_down)
				elseif words.item_for_iteration.is_equal ("half_even")  then
					ctx.set_rounding_mode (Round_half_even)
				elseif words.item_for_iteration.is_equal ("floor")  then
					ctx.set_rounding_mode (Round_floor)
				elseif words.item_for_iteration.is_equal ("ceiling")  then
					ctx.set_rounding_mode (Round_ceiling)
				end
			elseif words.item_for_iteration.is_equal ("maxexponent:") then
				words.forth
				ctx.set_exponent_limit (words.item_for_iteration.to_integer)
			end
		end
		
feature {NONE} -- Implementation

	last_line : STRING is do Result := file.last_string end
	
	last_word : STRING

	words : DS_LINKED_LIST[STRING]
	
	skipped_blanks (s : STRING; start_index : INTEGER) : INTEGER is
		require
			s_not_void: s /= Void
			start_within_limits: start_index > 0 and then start_index <= s.count
		local
			index : INTEGER
			eob : BOOLEAN
		do
			--| skip blanks
			from
				eob := False
				index := start_index
			until
				index >s.count or else eob
			loop
				inspect s.item (index)
				when ' ','%T' then
					index := index + 1
				else
					eob := True
				end
			end
			Result := index
		ensure
			found_if_within_limits: (Result > 0 and Result <= s.count) implies (s.item (Result) /= ' ' or else s.item (Result) /= '%T')
		end

	after_word (s: STRING; start_index : INTEGER) : INTEGER is
			-- first index after word
		require
			s_not_void: s /= Void
			valid_start_index: start_index > 0 and then start_index <= s.count
			beginning_of_word: s.item (start_index) /= ' ' or else s.item (start_index) /= '%T'
		local
			eow, quoted : BOOLEAN
			index, l_count, quotes : INTEGER
			c : CHARACTER
		do
			from
				eow := False
				c := s.item (start_index)
				l_count := s.count
				quoted := c = '%'' or else c = '%"'
				index := start_index + 1
			until
				index > l_count or else eow
			loop
				c := last_line.item (index)
				inspect c
				when ' ', '%T' then
					if not quoted then
						eow := True
					else
						index := index + 1
					end
				when '%'', '%"' then
					if quotes \\ 2 = 0 then
						quoted := False
					else
						quotes := quotes + 1
					end
					index := index + 1
--					if index + 1 <= l_count then
--						lookahead := s.item (index + 1)
--						if c = lookahead then
--							index := index + 2
--						else							
--							index := index + 1
--						end
--					elseif index = l_count then
--						index := index + 1
--						eow := True
--					end
				else	
					index := index + 1
				end
			end	
			Result := index
		end
		
	split is
			-- 
		local
			index, begin : INTEGER
		do
			from
				index := 1
				!!words.make
			until
				index > last_line.count
			loop
				begin := skipped_blanks (last_line, index)
				index := after_word (last_line, begin)
				words.put_last (last_line.substring (begin, index - 1))
			end
		end

end -- class TEST_DECIMAL_GENERAL

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
