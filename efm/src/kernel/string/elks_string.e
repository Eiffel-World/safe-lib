indexing

description: "Sequences of characters, accessible through %
%integer indices in a contiguous range."

class ELKS_STRING

inherit

	HASHABLE
		redefine
			copy, is_equal, out
		end;

	COMPARABLE
		redefine
			copy, is_equal, out
		end;

creation 
	make, make_from_string

feature -- Initialization

	frozen make (n: INTEGER ) is
			-- Allocate space for at least n characters.
		require
			non_negative_size: n >= 0
		do
			!!string.make (n)
		ensure
			empty_string:  count = 0
		end
	
	make_from_string (s: STRING ) is
			-- Initialize from the characters of s.
			-- (Useful in proper descendants of class ,
			-- to initialize a string-like object from a manifest string.)
		require
			string_exists: s /= Void
		do
			string := s
		ensure
			shared_implementation: string = s
		end

	from_c (c_string: POINTER ) is
			-- Reset contents of string from contents of c_string, 
			-- a string created by some external C function.
		require
			C_string_exists: c_string /= Void
		local
			elks_string_portability: ELKS_STRING_PORTABILITY
		do
			!!elks_string_portability
			elks_string_portability.from_c (string, c_string)
		end

	frozen remake (n: INTEGER ) is
			-- Allocate space for at least n characters.
		require
			non_negative_size: n >= 0
		do
			string.remake (n)
		
		ensure
			empty_string:  count = 0
		end

feature -- Access

	string: STRING
			-- String representation

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := string.hash_code
		end
	
	has (c: CHARACTER): BOOLEAN is
			-- Does the string contain character `c?
		do
			Result := string.has (c)			
		end

	index_of (c: CHARACTER ; start: INTEGER ): INTEGER is
			-- Position of first occurrence of c at or after start; 
			-- 0 if none.
		require
			start_large_enough: start >= 1;
			start_small_enough: start <= count;
		local
			i : INTEGER
			found: BOOLEAN
		do
			--| Implementation issues :
			--| Elks95 doesn't include the at_or_after_start ensure clause
			--| SmallEiffel 0.77 has only one argument for this feature.			
			from
				found := False
				i := start
			until
				found or (i > count)
			loop
				if item (i) = c then
					found := True;
				else
					i := i + 1
				end
			end
			if found then
				Result := i
			else
				Result := 0
			end
		ensure
			non_negative_result: Result >= 0;
			at_this_position: Result > 0 implies item (Result) = c;
			at_or_after_start: Result > 0 implies Result >= start
			none_before: Result > 0 implies start = 1 or else not substring (1,start - 1).has (c)
			zero_iff_absent: Result = 0 implies not substring (start, count).has (c) 
		end

	item (i: INTEGER ): CHARACTER is
			-- Character at position i
		require
			good_key: valid_index (i)
		do
			Result := string.item (i)
		end

	substring_index (other: ELKS_STRING; start: INTEGER) : INTEGER is
			-- Position of first occurrence of other at or after start; 
			-- 0 if none.
		do
			Result := string.substring_index (other.string, start)
		end 

	infix "@" (i: INTEGER): CHARACTER is
			-- Character at position i
		require
			good_key:  valid_index(i)
		do
			Result := string @ i
		end

feature -- Measurement

	count: INTEGER is
			-- Actual number of characters making up the string
		do
			Result := string.count			
		end

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times c appears in the string
		do
			Result := string.occurrences (c)
		ensure
			non_negative_occurrences: Result >= 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is string made of same character sequence as other?
		do
			Result := string.is_equal(other.string)
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is string lexicographically lower than other?
			-- (False if other is void)
		do
			Result := string < other.string
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is string empty?
		do
			Result := (count = 0)
		end

	valid_index (i: INTEGER ): BOOLEAN is
			-- Is i within the bounds of the string?
		do
			Result := string.valid_index (i)
		end

feature -- Element change

	append_boolean (b: BOOLEAN ) is
			-- Append the string representation of b at end.
		do
			string.append_boolean (b)
		end
		
	append_character (c: CHARACTER) is
			-- Append c at end.
		do
			string.append_character (c)
		ensure
			item_inserted:  item(count) = c
			one_more_occurrence:  occurrences (c) = old (occurrences (c)) + 1
			item_inserted: has (c)
		end

	append_double (d: DOUBLE) is
			-- Append the string representation of d at end.
		do
			string.append_double (d)
		end

	append_integer (i: INTEGER) is
			-- Append the string representation of i at end.
		do
			string.append_integer (i)
		end

	append_real (r: REAL) is
			-- Append the string representation of r at end.
		do
			string.append_real (r)
		end

	append_string (s: ELKS_STRING) is
			-- Append a copy of s, if not void, at end.
		do
			string.append_string (s.string)
		ensure
			new_count:  count = old count + s.count
			-- appended: For every i in 1.. s.count,
			--     item (old count + i) = s.item (i)
		end

	fill (c: CHARACTER) is
			-- Replace every character with c.
		local
			i : INTEGER
		do
			--| Implementation issues:
			--| ISE 4.5 has another signature for string.fill(CONTAINER[CHARACTER]) so the native implementation can't be used
			from
				i := 1	
			until
				i > count
			loop
				put(c,i)
				i := i + 1
			end
		ensure
			-- all_c: For every i in 1..count, item (i) = c
		end

	head (n: INTEGER) is
			-- Remove all characters except for the first n; 
			-- do nothing if n >= count
		require
			non_negative_argument: n >= 0
		do
			string.head (n)
		ensure
			new_count: count = n.min (old count)
			-- first_kept: For every i in 1..n,  item(i) = old  item(i)
		end

	insert (s: like Current; i: INTEGER) is
			-- Add s to the left of position i.
		require
			string_exists: s /= Void; 
			index_small_enough: i <= count ; 
			index_large_enough: i > 0
		local
			j	 : INTEGER
		do
			--| Implementation issue
			--| SmallEiffel -0.78 does not implement this feature
			from
				j := 1
			until
				j > s.count
			loop
				insert_character (s @ j, i + j - 1)
				j := J + 1
			end	
		ensure
			new_count: count = old count + s.count
		end

	insert_character (c: CHARACTER; i: INTEGER) is
			-- Add c to the left of position i.
		require
			index_small_enough: i <= count ; 
			index_large_enough: i > 0		 
		local
			j : INTEGER
		do
			--| Implementation issues:
			--| In Elks the require clause was forgotten it has been added here
			--| ISE 4.5 does not have this feature name so the native implementation can't be used
			from
				string.append_character ('#') --| accomodate for one more character
				j := string.count				
			until
				j = i 
			loop
				string.put (string @ (j - 1), j) --| shift to right
				j := j - 1
			end											
			string.put (c, i)
		ensure
			new_count: count = old count + 1
		end

	left_adjust is
			-- Remove leading white space.
		do
			string.left_adjust	
		ensure
			new_count: (count /= 0) implies (item (1) /= ' ')
		end

	put (c: CHARACTER; i: INTEGER) is
			-- Replace character at position i by c.
		require
			good_key: valid_index (i)
		do
			string.put (c, i)
		ensure
			insertion_done: item (i) = c
		end

	put_substring (s: like Current; start_pos, end_pos: INTEGER) is
			-- Copy the characters of s to positions
			-- start_pos .. end_pos.
		require
			string_exists: s /= Void; 
			index_small_enough: end_pos <= count; 
			order_respected: start_pos <= end_pos; 
			index_large_enough: start_pos > 0
		local
			i: INTEGER
			j: INTEGER
		do
			--| Implementation issues:
			--| The elks contract is ambiguous: why must we give an end_pos when the ensure clause says that count >= old count?
			--| The specification is interpreted as follows : start replacing all characters from s from start_pos, extend the 
			--| string if needed.
			--| ISE 4.5 does not have this feature name so the native implementation can't be used
			from
				i := 1 
                j := start_pos
			until
				i > s.count
			loop
				if j > string.count then
					string.append_character (s @ i)
				else
					string.put (s @ i, j) 
				end
				i := i + 1
				j := j + 1
			end			
		ensure
			new_count: count = old count + s.count - end_pos + start_pos - 1
		end

	right_adjust is
			-- Remove trailing white space.
		do
			string.right_adjust
		ensure
			new_count: (count /= 0) implies ( item(count) /= ' ')
		end

	tail (n: INTEGER) is
			-- Remove all characters except for the last n; 
			-- do nothing if n >= .
		require
			non_negative_argument: n >= 0
		do
			string.tail (n)
		ensure
			new_count:  count = n.min (old count)
		end

feature -- Removal

	remove (i: INTEGER) is
			-- Remove i-th character.
		require
			index_small_enough: i <= count; 
			index_large_enough: i > 0
		do
			string.remove (i)
		ensure
			new_count: count = old count - 1
		end

	wipe_out is
			-- Remove all characters.
		do
			string.wipe_out
		ensure
			is_empty: is_empty
		end

feature -- Resizing

	resize (newsize: INTEGER) is
			-- Rearrange string so that it can accommodate
			-- at least newsize characters.
			-- Do not lose any previously entered character.
		require
			new_size_non_negative: newsize >= 0
		do
			string.resize (newsize)
		end

feature -- Conversion

	to_boolean: BOOLEAN is 
			-- Boolean value; 
			-- "true" yields true, "false" yields false
			-- (case-insensitive)
		do
			Result := string.to_boolean
		end

	to_double: DOUBLE is
			-- "Double" value; for example, when applied to "123.0",
			-- will yield 123.0 (double)
		do
			Result := string.to_double
		end

	to_integer: INTEGER is
			-- Integer value; 
			-- for example, when applied to "123", will yield 123
		do
			Result := string.to_integer
		end

	to_lower is
			-- Convert to lower case.
		do
			string.to_lower
		end

	to_real: REAL is
			-- Real value; 
			-- for example, when applied to "123.0", will yield 123.0
		do
			Result := string.to_real
		end


	to_upper is
			-- Convert to upper case.
		do
			string.to_upper	
		end

feature -- Duplication

	copy (other: like Current) is
			-- Reinitialize by copying the characters of other.
			-- (This is also used by clone)
		do
			if other /= Current then
				if string = Void or else string.count < other.count then
					string := clone (other.string)
				else	
					string.copy (other.string)
				end
			end
		ensure then
			new_result_count: count = other.count
			-- same_characters: For every i in 1..count,
			--     item (i) = other.item (i)
		end

	substring (n1, n2: INTEGER): like Current is
			-- Copy of substring containing all characters at indices
			-- between n1 and n2
		require
			meaningful_origin: 1 <= n1; 
			meaningful_interval: n1 <= n2; 
			meaningful_end: n2 <= count
		do
			!!Result.make_from_string (string.substring (n1,n2))
		ensure
			new_result_count: Result.count = n2 - n1 + 1
			-- original_characters: For every i in 1..n2-n1,
			--     Result.item (i) = item (n1 + i -1)
		end

feature -- Output

	out: STRING is
			-- Printable representation
		do
			Result := string.out
		end


invariant

	irreflexive_comparison: not (Current < Current);
	empty_definition: is_empty = (count = 0); 
	non_negative_count: count >= 0
	string_not_void: string /= Void

end -- ELKS_STRING


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--