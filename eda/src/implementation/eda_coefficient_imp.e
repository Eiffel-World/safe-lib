indexing
	description: "Simple implementation of coefficients using a native array of characters"

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:06:14 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"


class
	EDA_COEFFICIENT_IMP

inherit

	EDA_COEFFICIENT
		redefine
			out
		end

	KL_IMPORTED_NATIVE_ARRAY_ROUTINES
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
		
creation 
	make
	
feature {NONE} -- Initialization

	make (a_capacity: INTEGER) is
		do
			digits :=  NATIVE_CHARACTER_ARRAY_.make (a_capacity)--!!digits.make (0, a_capacity - 1)
			capacity := a_capacity
			set_count (0)
		end

feature -- Access

	item (index: INTEGER): INTEGER is
		do
			Result := digits.item (index).code
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
		
feature -- Status report
		
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	grow (a_capacity: INTEGER) is
		local
			index, new_upper : INTEGER
		do
			new_upper := a_capacity - 1
			if a_capacity > capacity then
				digits := NATIVE_CHARACTER_ARRAY_.resize (digits, capacity, new_upper + 1) --; old_size: INTEGER; new_size: INTEGER) digits.resize (0, new_upper)
				capacity := new_upper+1
			end
			--| zero msd
			from
				index := count
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
			digits.put (to_character(v), index)
			if index > count - 1 then
				set_count (index + 1) 
			end
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
			-- terse printable representation
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
			-- copy `other' into Current without aliasing
		local
			index : INTEGER
		do
			make (other.count)
			from
				index := lower
			until
				index > upper
			loop
				put (other.item (index), index)
				index := index + 1
			end
		end

feature -- Miscellaneous

feature -- Basic operations
		
	keep_head (a_count : INTEGER) is
			-- keep head of 'a_count' digits
		local
			index : INTEGER
		do
			--| initialize "tail" [a_count..upper] to zero
			--| must do it before adapting count since 'put' can modify count...
			from
				index := a_count
			until
				index > upper
			loop
				put (0, index)
				index := index + 1
			end
			--| keep values [0..a_count-1]
			set_count (a_count)
		end

	is_equal (other: like Current): BOOLEAN is
		local
			index : INTEGER
		do
			if other.count < count then
				Result := False
			elseif other.count > count then
				Result := False
			else -- other.count = count
				from
					index := count - 1
				variant
					index
				until
					index < lower or else item (index) /= other.item (index)
				loop
					index := index - 1
				end
				Result := (index < lower) -- found no equal item
			end	
		end

	shift_left (a_count : INTEGER) is
		local
			index : INTEGER
		do
			grow (count + a_count)
			--| copy digits `a_count' positions left
			from
				index := count-1
			until
				index < a_count
			loop
				put (item (index - a_count), index)
				index := index - 1
			end
			--| set zeroes as lsb
			from				
			until
				index < 0
			loop
				put (0, index)
				index := index - 1
			end			
		end

	shift_right (shift_count : INTEGER) is
		local
			index : INTEGER
		do
			--| copy digits `shift_count' positions right
			--| i.e copy suffix [shift_count..count] right
			from
				index := shift_count
			until
				index >= count
			loop
				put (item (index), index - shift_count)
				index := index + 1
			end
			--| set zeroes as msb
			from			
				index := count - shift_count
			until
				index >= count
			loop
				put (0, index)
				index := index + 1
			end			
		end

	integer_add (other : like Current) is
			-- integer add of `other' to Current
		local
			carry : INTEGER
			index : INTEGER
			digit : INTEGER
		do
			from
				carry := 0
				index := 0
			until
				index = count
			loop
				carry := carry + item (index) + other.item (index)
				digit := carry \\ 10
				put (digit, index)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				grow (count + 1)
				put (carry, index)
			end
		end

	integer_multiply (a, b : like Current) is
			-- multiply `a', `b' into Current
		local
			i, j, carry, digit : INTEGER
			local_a, local_b : like Current
		do
			-- initialization
			grow (a.count + b.count + 2)			
			from i := 0
			until i >= count
			loop
				put (0, i); i := i + 1
			end
			-- multiplication
			from
				if a.count > b.count then
					local_a := a; local_b := b
				else
					local_a := b; local_b := a
				end
				i := 0
			until
				i >= local_b.count
			loop
				digit := local_b.item (i)
				carry := 0
				from
					j := 0
				until
					j >= local_a.count
				loop
					carry := carry + local_a.item (j) * digit + item (i+j)
					put (carry \\ 10, i + j)
					carry := carry // 10
					j := j + 1
				end
				if carry > 0 then
					put (carry, i + j)
				end
				i := i + 1
			end
			strip_leading_zeroes
		end
		
	integer_quick_add_msd (other, digits_count : INTEGER) is
			-- integer add of `other' (between 0 and 9) to Current, 
			-- restricted to `digits_count' most significant digits
		local
			carry : INTEGER
			index : INTEGER
			digit : INTEGER
			to_add : INTEGER
		do
			from
				carry := 0
				index := count - digits_count
				to_add := other
			until
				index >= count
			loop
				if index > count - digits_count then
					to_add := 0
				end
				carry := carry + item (index) + to_add
				digit := carry \\ 10
				put (digit, index - count + digits_count)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				put (carry, index - count + digits_count)
				set_count (digits_count + 1)
			else
				set_count (digits_count) 
			end
		end

	integer_subtract (other : like Current) is
			-- integer subtract of `other' to Current, provided that result will not be negative.
		local
			borrow : INTEGER		
			index : INTEGER
			l_count : INTEGER
		do
			from
				borrow := 0
				index := 0
				l_count := other.msd_index + 1
			until
				index = l_count
			loop
				borrow := borrow + item (index) - other.item (index)
				if borrow < 0 then
					put (10 + borrow, index)
					borrow := -1
				else
					put (borrow, index)
					borrow := 0
				end
				index := index + 1
			end
			from
			until
				index = count
			loop
				borrow := borrow + item (index)
				if borrow < 0 then
					put (10 + borrow, index)
					borrow := - 1
				else
					put (borrow, index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end

	integer_quick_subtract_msd (other, digits_count : INTEGER) is
			-- integer subtract of `other' (between 0 and 9) to Current
			-- restricted to `digits_count' most significant digits
		local
			borrow : INTEGER		
			index : INTEGER
			to_subtract : INTEGER
		do
			from
				borrow := 0
				index := count - digits_count
				to_subtract := other
			until
				index = count
			loop
				if index > count - digits_count then
					to_subtract := 0
				end
				borrow := borrow + item (index) - to_subtract
				if borrow < 0 then
					put (10 + borrow, index - count + digits_count)
					borrow := -1
				else
					put (borrow, index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	digits : like NATIVE_CHARACTER_ARRAY_TYPE --ARRAY[INTEGER]

	set_count (a_count : INTEGER) is
			-- set `count' to `a_count'
		do
			count := a_count
		end
		
end -- class EDA_COEFFICIENT_IMP

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
