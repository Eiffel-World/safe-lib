indexing
	description: 
	
		"SQL DATE values"

	author: "Paul G. Crismer"
	date: "$Date: 2003/07/25 18:24:23 $"
	revision: "$Revision: 1.19 $"
	licensing: "See notice at end of class"

class
	ECLI_DATE

inherit
	ECLI_GENERIC_VALUE [DT_DATE]
		redefine
			item, set_item, out, is_equal, convertible_as_date, as_date,
			convertible_as_timestamp, as_timestamp, create_impl_item, impl_item
		end
		
	KL_IMPORTED_STRING_ROUTINES
		undefine
			out, is_equal, copy
		end

creation
	make, make_default

feature {NONE} -- Initialization

	make (a_year, a_month, a_day : INTEGER) is
		require
			month: a_month >= 1 and a_month <= 12
			day: a_day >= 1 and a_day <= days_in_month (a_month, a_year)
		do
			allocate_buffer
			set (a_year, a_month, a_day)
			create_impl_item
		ensure
			year_set: year = a_year
			month_set: month = a_month
			day_set: day = a_day
		end
		
	make_default is
			-- make default date as first day of Christian Era : January 1st, 1
		do
--			allocate_buffer
--			set (1,1,1)
			make (1, 1, 1)
		ensure
			not_null: not is_null
			year_set: year = 1
			month_set: month = 1
			day_set: day = 1
		end
		
feature -- Access

	item : DT_DATE is
		do
			impl_item.set_year_month_day (year,month,day)
			Result := impl_item
		end

	year : INTEGER is
		do
			if not is_null then
				Result := ecli_c_date_get_year (to_external)
			end
		end

	month : INTEGER is
		do
			if not is_null then
				Result := ecli_c_date_get_month (to_external)
			end
		end

	day : INTEGER is
		do
			if not is_null then
				Result := ecli_c_date_get_day (to_external)
			end
		end

feature -- Measurement

	days_in_month (a_month, a_year : INTEGER) : INTEGER is
			-- number of days in 'a_month' for 'a_year'
			-- feature is delegated to a DT_GREGORIAN_CALENDAR object
			-- Feature to be deleted when smalleiffel 075 has been fixed
		require
			month_ok: a_month >= 1 and a_month <= 12
		do
			Result := calendar.days_in_month(a_month, a_year)
		end
		
feature -- Status report

	convertible_as_date : BOOLEAN is 
		do
			Result := True
		end
	
	convertible_as_timestamp : BOOLEAN is
			-- is Current convertible to timestamp ?
		do 
			Result := True
		end
		
	c_type_code: INTEGER is
		once
			Result := sql_c_type_date
		end

	size : INTEGER is
		do
			Result := 10
		end

	sql_type_code: INTEGER is
		once
			Result := sql_type_date
		end

	decimal_digits: INTEGER is
		do
			Result := 0
		end

	display_size: INTEGER is
		do
			Result := 10
		end

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_sizeof_date_struct
		end

feature -- Status setting

	set (a_year, a_month, a_day : INTEGER) is
		require
			month: a_month >= 1 and a_month <= 12
			day: a_day >= 1 and a_day <= days_in_month (a_month, a_year)
		do
			ecli_c_date_set_year (to_external, a_year)
			ecli_c_date_set_month (to_external, a_month)
			ecli_c_date_set_day (to_external, a_day)
			ecli_c_value_set_length_indicator (buffer, transfer_octet_length)
		ensure
			year_set: year = a_year
			month_set: month = a_month
			day_set: day = a_day
		end

feature -- Element change

	set_item (other : DT_DATE) is
		do
			set (other.year, other.month, other.day)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
		do
			if is_null then
				Result := "NULL"
			else
				Result:= STRING_.make (10)
				Result.append_string (integer_format.pad_integer_4 (year))
				Result.append_character ('-')
				Result.append_string (integer_format.pad_integer_2 (month))
				Result.append_character ('-')
				Result.append_string (integer_format.pad_integer_2 (day))
			end
		end

	as_date : DT_DATE is
			-- Current converted to date
		do
			Result := clone (item)
		end
		
	as_timestamp : DT_DATE_TIME is
			-- Current converted to timestamp
		do
			!!Result.make(year, month, day, 0, 0, 0)
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
				buffer := ecli_c_alloc_value (transfer_octet_length)
			end
		end
	
	ecli_c_sizeof_date_struct : INTEGER is
		external "C"
		end

	create_impl_item is
		local
			d : DT_DATE
		do
			create d.make (0,1,1)
			impl_item := d
		end
	
	integer_format : 	ECLI_FORMAT_INTEGER is
			-- format integer routines
		once
			create Result
		end

	impl_item : DT_DATE

	calendar :  DT_GREGORIAN_CALENDAR is once create Result end
	
invariant
	month:	(not is_null) implies (month >= 1 and month <= 12)
	day:  	(not is_null) implies (day >= 1 and day <= days_in_month (month, year))

end -- class ECLI_DATE
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
