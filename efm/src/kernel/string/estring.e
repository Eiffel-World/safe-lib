indexing

	description: 	"Elks string extented with some features. %
	 	 	% The new features are implemented by using only elks features, so this %
			% should be portable on most compilers but could be a bit slower than the equivalent natif %
			% features found on some compilers "

class ESTRING

inherit
	ELKS_STRING

creation
	make, make_from_string, make_from_string_linear	


feature {NONE} -- Initialization

	make_from_string_linear  (a_string_linear: DS_LINEAR[STRING]; a_separator: STRING) is
			-- Make a string where each string of `a_string_linear will be separated with `a_separator string.
		require
			linear_defined: a_string_linear /= Void
			separator_not_empty: not a_separator.empty
		local
			cursor: DS_LINEAR_CURSOR [STRING]
			estring: ESTRING
			estring_separator: ESTRING
		do
			!!estring_separator.make_from_string (a_separator)
			from
				make ((a_separator.count + 1) * a_string_linear.count)
				cursor := a_string_linear.new_cursor
				cursor.start				
			until
				cursor.off
			loop
				!!estring.make_from_string (cursor.item)	
				append_string (estring)
				if not cursor.after then
					append_string (estring_separator)
				end
				cursor.forth
			end
		ensure
			-- Result.is_equal (firstitem<separator>seconditem<separator> ... lastitem)) 
		end

feature -- Access

	rightmost_index_of_character (a_character: CHARACTER): INTEGER is
			-- Rightmost index of `a_character.
		local
			i: INTEGER
		do
			from	
				i := count
			until
				i = 0 or else (item (i) = a_character)
			loop
				i := i - 1
			end
			Result := i
		ensure 
			Result > 0 implies (item(Result) = a_character) and (Result = count or else (index_of (a_character, Result + 1) = 0) )
			Result = 0 implies not has (a_character)	
		end

	word_wrapped (a_width: INTEGER): ARRAY [ESTRING] is
			-- Result of splitting Current in lines of `a_width', word wrapping is performed if necessary.
		local
			begin_index, end_index, line: INTEGER
			s: ESTRING
		do
			!!Result.make (1, count // a_width)

			from
				begin_index := 1
				line := 1
			until
				begin_index > count
			loop
				-- Search next end
				if count - begin_index + 1 <= a_width then
					end_index := count
				else
					s := substring (begin_index, begin_index + a_width - 1)
					if s.has (' ') then
						end_index := begin_index + s.rightmost_index_of_character (' ') - 1
					else
						end_index := begin_index + a_width - 1						
					end
				end

				Result.force (substring (begin_index, end_index), line)
				Result.item (line).extend_to_count (' ', a_width)
				begin_index := end_index + 1																		
				line := line + 1						
			end
		end

feature -- Element change


	prune_all (c: CHARACTER) is
			-- Remove all occurrences of `c'.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				if item (i) = c then
					remove (i)
				else
					i := i + 1	 
				end
			end
		end

	prune_all_leading (c: CHARACTER) is
			-- Remove all leading occurrences of `c'.
		do
			from
			until
				is_empty or else item (1) /= c
			loop
				remove (1)
			end
		end;

	prune_all_trailing (c: CHARACTER) is
			-- Remove all trailing occurrences of `c'.
		do
			from
			until
				is_empty or else item (count) /= c
			loop
				remove (count)
			end
		end;


	prune_all_trailing_after_index (c: CHARACTER; i: INTEGER) is
			-- Remove all trailing occurrences of `c' after `i' (excluding item (i)).
		require
			index_small_enough: i <= count ; 
			index_large_enough: i > 0			
		do
			from
			until
				is_empty or else item (count) /= c or else count = i
			loop
				remove (count)
			end
		end;


	extend_to_count(c: CHARACTER; needed_count: INTEGER) is
			-- Extend Current with `c' until `needed_count' is reached.
			-- Do nothing if `count' is already greater or equal 
			-- to `needed_count'.
	      require
			needed_count >= 0
		do
		 	from
			until
				count >= needed_count
			loop
				append_character (c)	
			end
		ensure
         		count >= needed_count
	      end

	prepend_string (s: like Current) is
			-- Prepend with `s'.
		require
			s_not_void: s /= Void
		local
			i: INTEGER
		do
			from
				i := s.count
			until
				i < 1
			loop
				insert_character (s.item (i), 1)
				i := i - 1
			end
		ensure
			new_count: count = s.count + old count
		end  

	prepend_to_count(c: CHARACTER; needed_count: INTEGER) is
			-- Prepend Current with `c' until `needed_count' is reached.
			-- Do nothing if `count' is already greater or equal 
			-- to `needed_count'.
	      require
			needed_count >= 0
		do
		 	from
				if count = 0 then
					append_character (c)
				end
			until
				count >= needed_count
			loop
				insert_character (c, 1)	
			end
		ensure
         		count >= needed_count
	      end

	center_to_count(c: CHARACTER; needed_count: INTEGER) is
			-- Center Current with `c' until `needed_count' is reached.
			-- Do nothing if `count' is already greater or equal 
			-- to `needed_count'.
	      require
			needed_count >= 0
		do
			if count < needed_count then
				prepend_to_count (c, count + (needed_count - count) // 2)
			end
			if count < needed_count then
				extend_to_count (c, needed_count)
			end	
		ensure
         		count >= needed_count
	      end


	replace_substring_all (a_string, a_replacement_string: like Current) is
			-- Replace every occurence of `a_string with `a_replacement_string.
		require
			a_string_defined: a_string /= Void
			a_remplacement_string_defined: a_replacement_string /= Void
		local
			start: INTEGER
			i : INTEGER
		do
			from
				start := substring_index (a_string, 1)			
			until
				start = 0
			loop
				--| remove a_string from Curent
				from
					i := 1
				until
					i > a_string.count
				loop
					remove (start)
					i := i + 1
				end
				--| add a_replacement_string
				insert (a_replacement_string, start)
				start := start + a_replacement_string.count
				start := substring_index (a_string, start)					
			end		
		end


	replace_character_all (a_character, a_replacement_character: CHARACTER) is
			-- Replace every occurence of `a_character' with `a_replacement_character'.
		require
			not_same_character: a_character /= a_replacement_character
		local
			i : INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				if item (i) = a_character then
					put (a_replacement_character, i)
				end
				i := i + 1
			end
		ensure
			replaced: occurrences (a_character) = 0
		end


	fill_blank is
			-- Fill with `capacity' blank characters.
		do
			fill_character (' ')
		ensure
			filled: full;
			same_size: (count = capacity) and (capacity = old capacity)
		end

	fill_character (c: CHARACTER) is
			-- Fill with `capacity' characters all equal to `c'.
		local
			i: INTEGER
		do
			from 
				i := 1
			until
				i > count
			loop
				put (c, i)
				i := i + 1
			end
			from	
			until
				i > capacity
			loop
				append_character (c)
				i := i + 1
			end
		ensure
			filled: full;
			same_size: (count = capacity) and (capacity = old capacity)
		end

feature -- Removal

	remove_substring (start_pos, end_pos: INTEGER) is
			-- Remove the characters of Current from positions
			-- start_pos .. end_pos.
		require
			index_small_enough: end_pos <= count
			order_respected: start_pos <= end_pos
			index_large_enough: start_pos > 0
		local
			i: INTEGER
		do
			from
				i := start_pos
			until
				i > end_pos
			loop
				remove (start_pos)
				i := i + 1
			end
		ensure
			new_count: count = old count  - (end_pos - start_pos + 1)
		end

feature -- Status report

	is_integer: BOOLEAN is
			-- Is the string representing an integer?
		do
			Result := string.is_integer
		end;

	is_real: BOOLEAN is
			-- Is the string representing a real?
		do
			Result := string.is_real
		end;

	is_double: BOOLEAN is
			-- Is the string representing a double?
		do
			Result := string.is_double
		end;

feature -- Conversion 
 
	to_c: ANY is
			-- A reference to a C representation of a STRING. 
			-- Used only to pass a eiffel string to an external routine. 
		local 
			elks_string_portability: ELKS_STRING_PORTABILITY 
		do 
			!!elks_string_portability 
			Result := elks_string_portability.to_c (string) 
		end


feature -- Measurement


	capacity: INTEGER is
			-- Allocated space
		do
			Result :=  string.capacity
		end

	substring_occurrences (a_substring: ESTRING): INTEGER is
			-- Number of times `a_substring appears in the string.
		require
			substring_not_is_empty: not a_substring.is_empty
		local
			index: INTEGER
			n : INTEGER
		do
			from
				n := 0
				index := substring_index (a_substring, 1)			
			until
				index = 0
			loop
				n := n + 1
				if count - index <= a_substring.count then
					index := 0
				else
					index := substring_index (a_substring, index + a_substring.count)
				end
			end
			Result := n		
		ensure
			non_negative_occurrences: Result >= 0
		end
		
feature -- Status report 

	full: BOOLEAN is
			-- Is structure full?
		do
			Result := (count = capacity)
		end


end -- ESTRING


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--