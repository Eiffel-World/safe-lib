indexing
	description: "Decimal coefficients.  Can be seen as arrays of decimal values.%
		% Zero-based index. %
		% - Index '0' is the least significant digit, %
		% - index 'count-'1 is the most significant digit."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/02/06 22:24:10 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

deferred class
	EDA_COEFFICIENT

inherit

	COMPARABLE
		undefine
			is_equal, copy
		redefine
			infix ">" 
		end
		
feature {NONE} -- Initialization

	make (a_capacity : INTEGER) is
			-- make with `a_capacity'
		require
			a_capacity_greater_zero: a_capacity > 0
		deferred
		ensure
			capacity_set: capacity >= a_capacity
			count_zero: count = 0
			lower_set: lower = 0
			upper_set: upper = capacity - 1
		end
		
feature -- Access

	item (index : INTEGER) : INTEGER is
			-- item at `index'
		require
			valid_index: valid_index (index)
		deferred
		end

	msd_index : INTEGER is
			-- index of most significant (non-zero) digit
		deferred
		ensure
			result_within_limits : Result < count and Result >= 0
			index_of_msd_or_zero: Result > 0 implies item (Result) /= 0
		end
		
feature -- Measurement

	count : INTEGER is
			-- number of decimal digits
		deferred
		end

	upper : INTEGER is
			-- upper index
		deferred
		ensure
			definition: Result <= capacity - 1
		end
		
	lower : INTEGER is
			-- lower index
		deferred
		ensure
			definition: Result = 0
		end

	capacity : INTEGER is
			-- current capacity
		deferred
		ensure
			definition: capacity >= count
		end
		
feature -- Status report

	valid_index (index : INTEGER) : BOOLEAN is
			-- is `index' valid ?
		do
			Result := (index >= 0 and then index < count)
		ensure
			Result = (index >= 0 and then index < count)
		end

	is_zero : BOOLEAN is
			-- is this composed of all zeros?
		local
			index : INTEGER
		do
			from
				index := 0
			until
				index = count or else item (index) /= 0
			loop
				index := index + 1
			end
			Result := (index = count)
		end
		
feature {EDA_DECIMAL} -- Status setting

	set_from_string (s : STRING) is
			-- set from `s', skip the decimal point if it is present
		require
			s_not_void: s /= Void
		deferred
		ensure
			definition: True -- all digits in s are in Current at the right position
		end
		
feature -- Cursor movement

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := (three_way_comparison (other) = -1)
		end

	infix ">" (other : like Current) : BOOLEAN is
		do
			Result := (three_way_comparison (other) = 1)
		end
		
--	three_way_comparison (other: like Current) : INTEGER is
--			-- compare other; Result is [-1,0,+1] if [Current<other, Current = other, Current > other] respectively
--		require
--			other_not_void: other /= Void
--		deferred
--		ensure
--			definition: Result >= -1 and Result <= 1
--			lower: True -- Result = -1 implies Current < other
--			equal: True -- Result = 0 implies Current.is_equal (other)
--			greater: True -- Result = -1 implies Current > other
--		end

feature {EDA_DECIMAL} -- Element change

	put (v, index : INTEGER) is
			-- put `v' at `index'-th item
		require
			valid_index_for_put: index >= 0 and index < capacity
			valid_v: v >= 0 and v <= 9
		deferred
		ensure
			item_set: item (index) = v
			adapted_count: (index + 1 > old count) implies count = index + 1
		end

	grow (a_capacity : INTEGER) is
			-- grow coefficient so that it can contain up to `a_capacity' digits
		require
			capacity_greater_zero: a_capacity >= count
		deferred
		ensure
			definition: (old capacity <= a_capacity) implies capacity >= a_capacity
			adapted_count: count = a_capacity
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature {EDA_DECIMAL, EDA_COEFFICIENT} -- Basic operations
		
	integer_add (other : like Current) is
			-- integer add of `other' to Current
		require
			other_not_void: other /= Void
			same_count: count <= other.count
		deferred
		ensure
			count: count >= old count
		end

	integer_multiply (a, b : like Current) is
			-- multiply `a', `b' into Current
		require
			a_not_void: a /= Void
			b_not_void: b /= Void
			capacity_sufficient: capacity > a.count + b.count
		deferred
		ensure
		end
		
	integer_quick_add_msd (other, digits_count : INTEGER) is
			-- integer add of `other' (between 0 and 9) to Current, 
			-- restricted to `digits_count' most significant digits
		require
			other_limits: other >= 0 and other <= 9
			digits_count: digits_count >= 0 and digits_count <= count
		deferred		
		ensure
			count: count <= digits_count + 1
--			stripped_zeroes: count > 1 implies item (count - 1) /= 0
		end

	integer_subtract (other : like Current) is
			-- integer subtract of `other' to Current, provided that result will not be negative.
		require
			other_not_void: other /= Void
			other_smaller: other <= Current
		deferred
		end

	integer_quick_subtract_msd (other, digits_count : INTEGER) is
			-- integer subtract of `other' (between 0 and 9) to Current
			-- restricted to `digits_count' most significant digits
		require
			other_limits: other >= 0 and other <= 9
			digits_count: digits_count >= 0 and digits_count <= count
		deferred
		ensure
			count: count <= digits_count + 1
--			stripped_zeroes: count > 1 implies item (count - 1) /= 0
		end

	keep_head (a_count : INTEGER) is
			-- keep head of 'a_count' digits
		require
			a_count_valid: a_count > 0 and a_count <= count
		deferred		
		ensure
			adapted_count : count = a_count
			unchanged_capacity: capacity = old capacity
		end

--	set_canonical is
--			-- remove any leading zero, except last one
--		local
--			index : INTEGER
--		do
--			index := msd_index
--			if index < count - 1 then
--				keep_head (index + 1)
--			end
--		ensure
--			adapted_count: count <= old count
--			non_zero_item: item (count - 1) /= 0
--		end

	strip_leading_zeroes is
			-- strip leading zeroes
		local
			index : INTEGER
		do
			index := msd_index
			set_count (index + 1)
		ensure
			count: count /= 1 implies item (count - 1) /= 0
		end
		
	shift_left (a_count : INTEGER) is
			-- shift items left
		require
			a_count_greater_zero: a_count > 0
		deferred
		ensure
			adapted_count: count = old count + a_count
			zero_shifted: item (0) = 0 --and then item (1) = old (item (0))
		end

	shift_right (a_count : INTEGER) is
			-- shift items right
		require
			a_count_greater_zero: a_count > 0
			a_count_less_count: a_count <= count
		deferred
		ensure
			adapted_count: count = old count
			zero_shifted: item (count-1) = 0
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {EDA_DECIMAL} -- Implementation

	set_count (a_count : INTEGER) is
			-- set `count' to `a_count'
		require
			a_count_not_greater_capacity: a_count <= capacity
		deferred
		ensure
			count_set: count = a_count
		end
		
invariant
	count_less_or_equal_capacity: count <= capacity

end -- class EDA_COEFFICIENT

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
