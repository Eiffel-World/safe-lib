indexing
	description: "ISO CLI DATE value"
	author: "Paul G. Crismer"
	date: "$Date: 2002/03/21 20:34:30 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_DATE

inherit
	ECLI_ARRAYED_VALUE
		rename
		export
		undefine
			item, set_item, is_equal, out_item_at
		redefine
		select
		end

	ECLI_FORMAT_INTEGER
		undefine
			out, is_equal
		end

	ECLI_DATE
		rename
			make as make_single, make_default as make_default_single, set as set_date
		export
			{NONE} make_single, make_default_single
		undefine
			release_handle, length_indicator_pointer, to_external, is_null, is_equal, out, set_item, to_string
		redefine
			item, transfer_octet_length, trace, allocate_buffer, year, month, day, set_date
		end
	
creation
	make_default

feature {NONE} -- Initialization
		
	make_default (a_capacity : INTEGER) is
			-- make default date as first day of Christian Era : January 1st, 1
		local
			i : INTEGER
		do
			capacity := a_capacity
			count := capacity
			allocate_buffer
			from start until off loop set_date (1,1,1); forth end; start
		ensure
			year_set: year = 1
			month_set: month = 1
			day_set: day = 1
		end
		
feature -- Access

	item_at (index : INTEGER) : like item is
		local
			save_index : INTEGER
		do
			save_index := cursor_index
			cursor_index := index
			Result := item
			cursor_index := save_index
		end
		
	item : DT_DATE is
		do
			!!Result.make (year, month, day)
		end

	year : INTEGER is
		local
			date_pointer : POINTER
		do
			date_pointer := ecli_c_array_value_get_value_at (buffer, cursor_index)
			if not is_null then
				Result := ecli_c_date_get_year (date_pointer)
			end
		end

	month : INTEGER is
		local
			date_pointer : POINTER
		do
			date_pointer := ecli_c_array_value_get_value_at (buffer, cursor_index)
			if not is_null then
				Result := ecli_c_date_get_month (date_pointer)
			end
		end

	day : INTEGER is
		local
			date_pointer : POINTER
		do
			date_pointer := ecli_c_array_value_get_value_at (buffer, cursor_index)
			if not is_null then
				Result := ecli_c_date_get_day (date_pointer)
			end
		end

feature -- Measurement

		
feature -- Status report

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_array_value_get_length (buffer)
		end

feature -- Status setting

feature -- Element change

	set_item (other : like item) is
		do
			set_item_at (other, cursor_index)
		end

	set_item_at (other : like item; index : INTEGER) is
		local
			date_pointer : POINTER
		do
			date_pointer := ecli_c_array_value_get_value_at (buffer, index)
			ecli_c_date_set_year (date_pointer, other.year)
			ecli_c_date_set_month (date_pointer, other.month)
			ecli_c_date_set_day (date_pointer, other.day)			
		end

	set_date_at (a_year, a_month, a_day : INTEGER; index : INTEGER ) is
		local
			date_pointer : POINTER
		do
			date_pointer := ecli_c_array_value_get_value_at (buffer, index)
			ecli_c_date_set_year (date_pointer, a_year)
			ecli_c_date_set_month (date_pointer, a_month)
			ecli_c_date_set_day (date_pointer, a_day)			
		ensure
			year_set: item_at (index).year = a_year
			month_set: item_at (index).month = a_month
			day_set: item_at (index).day = a_day
		end

	set_date (a_year, a_month, a_day : INTEGER) is
		do
			set_date_at (a_year, a_month, a_day, cursor_index)
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out_item_at (index : INTEGER) : STRING is
		local
			save_index : INTEGER
		do
			!!Result.make (10)
			if is_null_at (index) then
				Result.append ("NULL")
			else
				save_index := cursor_index
				cursor_index := index
				Result.append (pad_integer_4 (year))
				Result.append_character ('-')
				Result.append (pad_integer_2 (month))
				Result.append_character ('-')
				Result.append (pad_integer_2 (day))
				cursor_index := save_index
			end
		end
		
feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_date (Current)
		end

	is_equal (other : like Current) : BOOLEAN is
		do
			Result := year = other.year and
				month = other.month and
				day = other.day
		end

feature {NONE} -- Implementation

	allocate_buffer is
		do
			if buffer = default_pointer then
				buffer := ecli_c_alloc_array_value (octet_size, capacity)
			end
		end

invariant
	month:	(not is_null) implies (month >= 1 and month <= 12)
	day:  	(not is_null) implies (day >= 1 and day <= days_in_month (month, year))

end -- class ECLI_ARRAYED_DATE
--
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
