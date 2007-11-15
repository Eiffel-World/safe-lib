indexing
	description:

		"Simple implementation of coefficients using a native array of characters"

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2007/11/15 10:01:57 $"

class MA_DECIMAL_COEFFICIENT_IMP

inherit

	MA_DECIMAL_COEFFICIENT
		redefine
			out, three_way_comparison
		end

	KL_IMPORTED_NATIVE_ARRAY_TYPE [INTEGER_8]
	export {NONE}
			all
		undefine
			out,copy,is_equal
		end

	KL_INTEGER_ROUTINES
		export {NONE} all
		undefine
			out, copy, is_equal
		end

create

	make, make_copy

feature {NONE} -- Initialization

	make (a_capacity: INTEGER) is
		do
			digits :=  NATIVE_DIGITS_ARRAY_.make (a_capacity)
			capacity := a_capacity
			set_count (0)
		end

	make_copy (other : like Current) is
			-- Make a copy of `other'.
		do
			make (other.capacity)
			copy (other)
		end
		
feature -- Access

	item (index: INTEGER): INTEGER is
		do
		Result := digits.item (index)
		end

feature -- Measurement

	count: INTEGER

	lower: INTEGER is
		do
			Result := 0 --digits.lower
		end

	upper: INTEGER is
		do
			Result := capacity - 1
		end

	capacity : INTEGER

	msd_index : INTEGER is
		local
			l_digits : like digits
		do
			Result := count
			from
				l_digits := digits
			until
				Result = 0 or else l_digits.item (Result - 1) /= 0
			loop
				Result := Result - 1
			end
			if Result > 0 then
				Result := Result - 1
			end
		end


feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_from_substring (s: STRING; coefficient_begin, coefficient_end : INTEGER) is
		local
			i, k : INTEGER
			c : CHARACTER
			l_digits : like digits
		do
			grow (s.count)
			l_digits := digits
			from
				i := coefficient_end
				k := 0
			variant
				i
			until
				i < coefficient_begin
			loop
				c := s.item (i)
				if c /= '.'  then
					put ((c.code - ('0').code).to_integer_8, k)
					k := k+1
				end
				i := i - 1
			end
			set_count (k)
		end

	grow (a_capacity: INTEGER) is
		local
			index, new_upper : INTEGER
			l_digits : like digits
		do
			new_upper := a_capacity - 1
			if a_capacity > capacity then
				digits := NATIVE_DIGITS_ARRAY_.resize (digits, capacity, new_upper + 1) --; old_size: INTEGER; new_size: INTEGER) digits.resize (0, new_upper)
				capacity := new_upper+1
			end
			--| zero msd
			from
				index := count
				l_digits := digits
			until
				index > new_upper
			loop
				put (0, index)
				index := index + 1
			end
			set_count (a_capacity)
		end

	put (v, index: INTEGER) is
		do
			digits.put (v.to_integer_8, index)
			if index > count - 1 then
				set_count (index + 1)
			end
		end

feature -- Removal

feature -- Resizing

feature -- Comparison

	three_way_comparison (other: like Current) : INTEGER is
		local
			index, count_a, count_b, local_difference : INTEGER
			l_digits, l_other_digits : like digits
		do
			--| skip leading zeroes
			count_a := msd_index + 1
			count_b := other.msd_index + 1

			if count_a > count_b then
				Result := 1
			elseif count_a < count_b then
				Result := -1
			else
				from
					index := count_a - 1
					l_digits := digits
					l_other_digits := other.digits
				until
					index < 0 or else local_difference /= 0
				loop
					local_difference := l_digits.item (index) - l_other_digits.item (index)
					index := index - 1
				end
				Result := local_difference.sign
			end
		end

feature -- Transformation

feature -- Conversion

	out : STRING is
			-- Terse printable representation
		local
			index : INTEGER
		do
			!!Result.make (count)
			from
				index := count - 1
			until
				index < 0
			loop
				Result.append (item (index).out)
				index := index - 1
			end
		end

feature -- Duplication

	copy (other : like Current) is
			-- Copy `other' into Current without aliasing.
		local
			index, l_upper : INTEGER
			l_digits, l_other_digits : like digits
		do
			if Current /= other then
				l_upper := other.count -1
				if digits = Void then
					make (l_upper + 1)
				elseif capacity < other.capacity then
					grow (other.capacity)
				end
				from
					index := 0
					l_digits := digits
					l_other_digits := other.digits
				until
					index > l_upper
				loop
					l_digits.put (l_other_digits.item (index), index) --put (other.item (index), index)
					index := index + 1
				end
				set_count (index)
			end
		end

	to_twin : like Current is
		do
			create Result.make_copy (Current)
		end

feature -- Miscellaneous

feature -- Basic operations

	keep_head (a_count : INTEGER) is
			-- Keep head of 'a_count' digits.
		local
			index : INTEGER
			l_digits : like digits
		do
			--| initialize "tail" [a_count..upper] to zero
			--| must do it before adapting count since 'put' can modify count...
			from
				index := a_count
				l_digits := digits
			until
				index > upper
			loop
				l_digits.put (0, index)
				index := index + 1
			end
			--| keep values [0..a_count-1]
			set_count (a_count)
		end

	is_equal (other: like Current): BOOLEAN is
		local
			index : INTEGER
			l_digits, l_other_digits : like digits
		do
			if other.count < count then
				Result := False
			elseif other.count > count then
				Result := False
			else -- other.count = count
				from
					index := count - 1
					l_digits := digits
					l_other_digits := other.digits
				variant
					index
				until
					index < lower or else l_digits.item (index) /= l_other_digits.item (index)
				loop
					index := index - 1
				end
				Result := (index < lower) -- found no equal item
			end
		end

	shift_left (a_count : INTEGER) is
		local
			index : INTEGER
			l_digits : like digits
		do
			grow (count + a_count)
			--| copy digits `a_count' positions left
			from
				index := count-1
				l_digits := digits
			until
				index < a_count
			loop
				l_digits.put (l_digits.item (index - a_count), index) --put (item (index - a_count), index)
				index := index - 1
			end
			--| set zeroes as lsb
			from
			until
				index < 0
			loop
				l_digits.put (0, index)
				index := index - 1
			end
		end

	shift_right (shift_count : INTEGER) is
		local
			index : INTEGER
			l_digits : like digits
		do
			--| copy digits `shift_count' positions right
			--| i.e copy suffix [shift_count..count] right
			from
				index := shift_count
				l_digits := digits
			until
				index >= count
			loop
				l_digits.put (l_digits.item (index), index - shift_count) --put (item (index), index - shift_count)
				index := index + 1
			end
			--| set zeroes as msb
			from
				index := count - shift_count
			until
				index >= count
			loop
				l_digits.put (0, index)
				index := index + 1
			end
		end

	integer_add (other : like Current) is
			-- Integer add of `other' to Current.
		local
			carry : INTEGER
			index : INTEGER
			digit : INTEGER
			l_digits, l_other_digits : like digits
		do
			from
				carry := 0
				index := 0
				l_digits := digits
				l_other_digits := other.digits
			until
				index = count
			loop
				carry := carry +  l_digits.item (index) + l_other_digits.item (index)
				digit := carry \\ 10
				l_digits.put (digit.to_integer_8, index)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				grow (count + 1)
				l_digits.put (carry.to_integer_8, index)
			end
		end

	integer_multiply (a, b : like Current) is
			-- Multiply `a', `b' into Current.
		local
			i, j, carry, digit : INTEGER
			local_a, local_b : like Current
			l_digits : like digits
			l_b_count, l_a_count : INTEGER
			l_b_digits, l_a_digits : like digits
		do
			-- initialization
			--grow (a.count + b.count + 2)
			from
				i := 0
				l_digits := digits
			until i >= count
			loop
				l_digits.put (0, i)
				i := i + 1
			end
			-- multiplication
			from
				if a.count > b.count then
					local_a := a; local_b := b
				else
					local_a := b; local_b := a
				end
				l_a_digits := local_a.digits
				l_b_digits := local_b.digits
				l_a_count := local_a.count
				l_b_count := local_b.count
				i := 0
			until
				i >= l_b_count -- local_b.count
			loop
				digit := l_b_digits.item (i)
				carry := 0
				from
					j := 0
				until
					j >= l_a_count -- local_a.count
				loop
					carry := carry + l_a_digits.item (j) * digit + l_digits.item (i+j)
					l_digits.put ((carry \\ 10).to_integer_8, i + j)
					carry := carry // 10
					j := j + 1
				end
				if carry > 0 then
					l_digits.put (carry.to_integer_8, i + j)
				end
				i := i + 1
			end
			set_count (i+j)
			strip_leading_zeroes
		end

	integer_quick_add_msd (other, digits_count : INTEGER) is
			-- Integer add of `other' (between 0 and 9) to Current,.
			-- restricted to `digits_count' most significant digits
		local
			carry : INTEGER
			index : INTEGER
			digit : INTEGER
			to_add : INTEGER
			l_digits : like digits
			l_count : INTEGER
			shifting_delta : INTEGER
		do
			l_digits := digits
			l_count := count
			from
				carry := 0
				index := count - digits_count
				to_add := other
				shifting_delta := count + digits_count
			until
				index >= l_count
			loop
				if index > l_count - digits_count then
					to_add := 0
				end
				carry := carry + l_digits.item (index) + to_add
				digit := carry \\ 10
				l_digits.put (digit.to_integer_8, index - count + digits_count)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				l_digits.put (carry.to_integer_8, index - count + digits_count)
				set_count (digits_count + 1)
			else
				set_count (digits_count)
			end
		end

	integer_subtract (other : like Current) is
			-- Integer subtract of `other' to Current, provided that result will not be negative.
		local
			borrow : INTEGER
			index : INTEGER
			l_count : INTEGER
			l_digits, l_other_digits : like digits
		do
			l_digits := digits
			l_other_digits := other.digits
			from
				borrow := 0
				index := 0
				l_count := other.msd_index + 1
			until
				index = l_count
			loop
				borrow := borrow + l_digits.item (index) - l_other_digits.item (index)
				if borrow < 0 then
					l_digits.put ((10+borrow).to_integer_8, index)
					borrow := -1
				else
					l_digits.put (borrow.to_integer_8, index)
					borrow := 0
				end
				index := index + 1
			end
			from
			until
				index = count
			loop
				borrow := borrow + l_digits.item (index)
				if borrow < 0 then
					l_digits.put ((10 + borrow).to_integer_8, index)
					borrow := - 1
				else
					l_digits.put (borrow.to_integer_8, index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end

	integer_quick_subtract_msd (other, digits_count : INTEGER) is
			-- Integer subtract of `other' (between 0 and 9) to Current.
			-- restricted to `digits_count' most significant digits
		local
			borrow : INTEGER
			index, l_count, l_displacement : INTEGER
			to_subtract : INTEGER
			l_digits : like digits
		do
			from
				borrow := 0
				index := count - digits_count
				to_subtract := other
				l_count := count
				l_digits := digits
				l_displacement := count - digits_count
			until
				index = l_count
			loop
				if index > l_displacement then -- count - digits_count then
					to_subtract := 0
				end
				borrow := borrow + l_digits.item (index) - to_subtract
				if borrow < 0 then
					l_digits.put ((10 + borrow).to_integer_8, index - l_displacement) -- count + digits_count)
					borrow := -1
				else
					l_digits.put (borrow.to_integer_8, index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end

feature -- Obsolete

feature -- Inapplicable

feature {MA_DECIMAL_COEFFICIENT_IMP} -- Implementation

	digits : like NATIVE_ARRAY_TYPE

	NATIVE_DIGITS_ARRAY_: KL_NATIVE_ARRAY_ROUTINES [INTEGER_8] is
			-- Routines that ought to be in class NATIVE_ARRAY
		once
			create Result
		ensure
			native_digits_array_routines_not_void: Result /= Void
		end

feature {MA_DECIMAL} -- Implementation

	set_count (a_count : INTEGER) is
			-- Set `count' to `a_count'.
		do
			count := a_count
		end

end


