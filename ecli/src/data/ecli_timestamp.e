indexing
	description: "ISO CLI TIMESTAMP values"
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 09:23:30 $"
	revision: "$Revision: 1.12 $"
	licensing: "See notice at end of class"

class
	ECLI_TIMESTAMP

inherit
	ECLI_DATE
		rename
			make as make_date, set as set_date
		export
		undefine
		redefine
			make_default, item, set_item, 
			set_date,
			c_type_code, column_precision, sql_type_code, 
			decimal_digits, display_size, out, is_equal,
			to_timestamp, trace, to_string, convertible_to_string, transfer_octet_length
		select
		end

creation
	make, make_first, make_default

feature {NONE} -- Initialization

	make (a_year, a_month, a_day, a_hour, a_minute, a_second, a_nanosecond : INTEGER) is
		require
			month: a_month >= 1 and a_month <= 12
			day: a_day >= 1 and a_day <= days_in_month (a_month, a_year)
			hour: a_hour >= 0 and a_hour <= 23
			minute: a_minute >= 0 and a_minute <= 59
			second: a_second >= 0 and a_second <= 61 -- to maintain synchronization of sidereal time (?)
			nanosecond: a_nanosecond >= 0 and a_nanosecond <= 999_999_999
		do
			allocate_buffer
			set (a_year, a_month, a_day, a_hour, a_minute, a_second, a_nanosecond)
			create impl_item.make_precise (a_year, a_month, a_day, a_hour, a_minute, a_second, a_nanosecond // 1_000_000)
		ensure
			not_null: not is_null
			year_set: year = a_year
			month_set: month = a_month
			day_set: day = a_day
			hour_set: hour = a_hour
			minute_set: minute = a_minute
			second_set: second = a_second
			nanosecond_set: nanosecond = a_nanosecond
		end
	
	make_default is
			-- make default time_stamp value
		do
			--allocate_buffer
			--set_date (1,1,1)
			make (1, 1, 1, 0,0,0,0)
		ensure then
			hour_set: hour = 0
			minute_set: minute = 0
			second_set: second = 0
			nanosecond_set: nanosecond = 0
		end

feature -- Access

	item : DT_DATE_TIME is
		do
			impl_item.set_year_month_day (year,month,day)
			impl_item.set_precise_hour_minute_second (hour, minute, second,nanosecond // 1_000_000)
			Result := impl_item
		end 

	hour : INTEGER is
		do
			if not is_null then
				Result := ecli_c_timestamp_get_hour (to_external)
			end
		end

	minute : INTEGER is
		do
			if not is_null then
				Result := ecli_c_timestamp_get_minute (to_external)
			end
		end

	second : INTEGER is
		do
			if not is_null then
				Result := ecli_c_timestamp_get_second (to_external)
			end
		end

	nanosecond : INTEGER is
		do
			if not is_null then
				Result := ecli_c_timestamp_get_fraction (to_external)
			end
		end

feature -- Measurement

	set_date (a_year, a_month, a_day : INTEGER ) is
		do
			Precursor (a_year, a_month, a_day)
			set_time (0, 0, 0, 0)
		ensure then
			time_set: hour = 0 and minute = 0 and second = 0 and nanosecond = 0
		end

	set_time (a_hour, a_minute, a_second, a_nanosecond : INTEGER ) is
		require
			hour: a_hour >= 0 and a_hour <= 23
			minute: a_minute >= 0 and a_minute <= 59
			second: a_second >= 0 and a_second <= 61 -- to maintain synchronization of sidereal time (?)
			nanosecond: a_nanosecond >= 0 and a_nanosecond <= 999_999_999

		do
			ecli_c_timestamp_set_hour (to_external, a_hour)
			ecli_c_timestamp_set_minute (to_external, a_minute)
			ecli_c_timestamp_set_second (to_external, a_second)
			ecli_c_timestamp_set_fraction (to_external, a_nanosecond)
		ensure
			hour_set: hour = a_hour
			minute_set: minute = a_minute
			second_set: second = a_second
			nanosecond_set: nanosecond = a_nanosecond
		end

	set (a_year, a_month, a_day, a_hour, a_minute, a_second, a_nanosecond : INTEGER) is
		require
			month: a_month > 0 and a_month <= 12
			day: a_day > 0 and a_day <= days_in_month (a_month, a_year)
			hour: a_hour >= 0 and a_hour <= 23
			minute: a_minute >= 0 and a_minute <= 59
			second: a_second >= 0 and a_second <= 61 -- to maintain synchronization of sidereal time (?)
			nanosecond: a_nanosecond >= 0 and a_nanosecond <= 999_999_999
		do
			set_date (a_year, a_month, a_day)
			set_time (a_hour, a_minute, a_second, a_nanosecond)
		ensure
			year_set: year = a_year
			month_set: month = a_month
			day_set: day = a_day
			hour_set: hour = a_hour
			minute_set: minute = a_minute
			second_set: second = a_second
			nanosecond_set: nanosecond = a_nanosecond
		end

	set_item (other : like item) is
		do
			set_date (other.year, other.month,other.day)
			set_time (other.hour, other.minute, other.second, other.millisecond * 1_000_000)
		end

feature -- Status report

	c_type_code: INTEGER is
		once
			Result := sql_c_type_timestamp
		end

	column_precision: INTEGER is
		local
			l_decimal_digits : INTEGER
		do
			l_decimal_digits := decimal_digits
			if l_decimal_digits > 0 then
				Result := 20 + l_decimal_digits
			else
				Result := 19
			end
		end

	sql_type_code: INTEGER is
		once
			Result := sql_type_timestamp
		end
	
	decimal_digits: INTEGER is
			-- log_10 (nanoseconds)
		local
			l_nanoseconds : INTEGER
		do 
			l_nanoseconds := nanosecond
			from
				Result := 0
			until
				l_nanoseconds = 0
			loop
				Result := Result + 1
				l_nanoseconds := l_nanoseconds // 10
			end
		end

	display_size: INTEGER is
		do
			Result := column_precision
		end

	convertible_to_string : BOOLEAN is
			-- 
		do
			Result := True
		end
		
feature -- Conversion

	to_string : STRING is
			--
		do
			Result := out
		end
		
	out : STRING is
		do
			Result := Precursor
			if not is_null then
				Result.append_character (' ')
				Result.append (pad_integer_2 (hour))
				Result.append_character (':')
				Result.append (pad_integer_2 (minute))
				Result.append_character (':')
				Result.append (pad_integer_2 (second))
				if nanosecond > 0 then
					Result.append_character ('.')
					Result.append (nanosecond.out)
				end
			end
		end
			
	to_timestamp : DT_DATE_TIME is
		do
			Result := clone (item)
		end
		
feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_timestamp (Current)
		end

	is_equal (other : like Current) : BOOLEAN is
		do
			Result := Precursor (other) and
				hour = other.hour and
				minute = other.minute and
				second = other.second and
				nanosecond = other.nanosecond
		end
			
feature -- Inapplicable

	transfer_octet_length : INTEGER is
		do
			Result := ecli_c_sizeof_timestamp_struct
		end
		
feature {NONE} -- Implementation

--	octet_size : INTEGER is
	
	ecli_c_sizeof_timestamp_struct : INTEGER is
		external "C"
		end
			
end -- class ECLI_TIMESTAMP
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
