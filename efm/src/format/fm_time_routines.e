indexing
	description: "Common routines for time/duration formats"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/12 20:21:34 $";
	revision: "$Revision: 1.1 $";
	author: "Fafchamps Eric"

class
	FM_TIME_ROUTINES

feature {NONE} -- Initialization

feature -- Access

	decimals: INTEGER
			-- Number of digits in fractional part.

	decimal_character: CHARACTER
			-- Character for begin of fractional part in decimal format.

	time_separator: CHARACTER
			-- Time separator

feature -- Measurement

feature -- Comparison

feature -- Status report

	is_leading_zero_shown: BOOLEAN
			-- Is the leading zero shown in each time part?
			-- e.g: when true : 01:09:03
			
	is_leading_zero_hidden: BOOLEAN is
			-- Is the leading zero hidden in each time part?
			-- e.g: when true : 1:9:3
		do
			Result := not is_leading_zero_shown
		end

	is_decimal_format: BOOLEAN
			-- Are time parts other than the hour part formatted as a fraction of an hour?
			-- e.g: when true : 01:30:00 is formatted as 1.5
	
	is_seconds_part_shown: BOOLEAN
			-- Is the seconds part shown?
			
	is_seconds_part_hidden: BOOLEAN is
			-- Is the seconds part_hidden?
		do
			Result := not is_seconds_part_shown
		end

	is_milliseconds_part_shown: BOOLEAN
			-- Is the milliseconds part shown?

	is_milliseconds_part_hidden: BOOLEAN is
			-- Is the milliseconds part hidden?
		do
			Result := not is_milliseconds_part_shown
		end

	is_time_separator_shown: BOOLEAN
			-- Is the time separator shown? 

	is_time_separator_hidden : BOOLEAN is
			-- Is the time separator hidden?
		do
			Result := not is_time_separator_shown
		end

feature -- Status setting

	enable_decimal_format is
			-- Enable the decimal format.
		do
			is_decimal_format := True
		ensure
			is_decimal_format : is_decimal_format
		end

	show_time_separator is
			-- Show time separator.
		do
			is_time_separator_shown := True
		ensure
			is_time_separator_shown: is_time_separator_shown
		end

	show_seconds_part is
			-- Show seconds part.
		do
			is_seconds_part_shown := True
		ensure
			is_seconds_part_shown: is_seconds_part_shown
		end

	show_milliseconds_part is
			-- Show milliseconds part.
		require
			is_seconds_part_shown: is_seconds_part_shown
		do
			is_milliseconds_part_shown := True
		ensure
			is_milliseconds_part_shown: is_milliseconds_part_shown
		end

	hide_time_separator is
			-- Hide time separator.
		do
			is_time_separator_shown := False
		ensure
			is_time_separator_hidden: is_time_separator_hidden
		end

	hide_seconds_part is
			-- Hide seconds part.
		do
			is_seconds_part_shown := False
		ensure
			is_seconds_part_hidden: is_seconds_part_hidden
		end	

	hide_milliseconds_part is
			-- Hide milliseconds part.
		require
			is_seconds_part_hidden: is_seconds_part_hidden
		do
			is_milliseconds_part_shown := False
		ensure
			is_milliseconds_part_hidden: is_milliseconds_part_hidden
		end

	show_leading_zero is
			-- Show leading zero in each time part.
		do
			is_leading_zero_shown := True
		ensure
			is_leading_zero_shown: is_leading_zero_shown
		end

	hide_leading_zero is
			-- Hide leading zero in each time part.
		do
			is_leading_zero_shown := False
		ensure
			is_leading_zero_hidden: is_leading_zero_hidden
		end

	disable_decimal_format is
			-- Disable the decimal format.
		do
			is_decimal_format := False
		ensure
			not_is_decimal_format : not is_decimal_format
		end

feature -- Cursor movement

feature -- Element change

	set_decimals (n_decimals: INTEGER) is
			-- Set number of digits in fractional part with `n_decimals'.
		require
			n_decimals_positive: n_decimals >= 0
		do
			decimals := n_decimals
		ensure
			decimals_copied: decimals = n_decimals
		end

	set_decimal_character (a_character: CHARACTER) is
			-- Set decimal character with `a_character'.
		do
			decimal_character := a_character
		ensure
			decimal_character_copied: decimal_character = a_character
		end

	set_time_separator (a_separator: CHARACTER) is
			-- Set time_separator with `a_separator'.
		do
			time_separator := a_separator
		ensure
			time_separator_set: time_separator = a_separator
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	hours_part (an_hour_part: INTEGER) : STRING is
			-- Hours part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			!!integer_format.make (2)
			integer_format.no_justify
			integer_format.hide_positive_sign
			integer_format.show_zero
			integer_format.set_suffix_string (Void)
			integer_format.set_prefix_string (Void)
			integer_format.hide_thousand_separator
			if is_leading_zero_shown then 
				integer_format.enable_zero_prefix
			else
				integer_format.disable_zero_prefix
			end
			Result := integer_format.formatted (an_hour_part)
		ensure
			result_defined : Result /= Void
		end

	minutes_part (a_minute_part : INTEGER) : STRING is
			-- Minute part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			!!integer_format.make (2)
			integer_format.no_justify
			integer_format.hide_positive_sign
			integer_format.show_zero
			integer_format.set_suffix_string (Void)
			integer_format.set_prefix_string (Void)
			integer_format.hide_thousand_separator
			if is_leading_zero_shown then 
				integer_format.enable_zero_prefix
			else
				integer_format.disable_zero_prefix
			end
			Result := integer_format.formatted (a_minute_part)
		ensure
			result_defined : Result /= Void
		end

	seconds_part (a_second_part: INTEGER) : STRING is
			-- Second part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			!!integer_format.make (2)
			integer_format.no_justify
			integer_format.hide_positive_sign
			integer_format.show_zero
			integer_format.set_suffix_string (Void)
			integer_format.set_prefix_string (Void)
			integer_format.hide_thousand_separator
			if is_leading_zero_shown then 
				integer_format.enable_zero_prefix
			else
				integer_format.disable_zero_prefix
			end
			Result := integer_format.formatted (a_second_part)
		end

	milliseconds_part (a_millisecond_part: INTEGER) : STRING is
			-- Millisecond part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			!!integer_format.make (3)
			integer_format.no_justify
			integer_format.hide_positive_sign
			integer_format.show_zero
			integer_format.set_suffix_string (Void)
			integer_format.set_prefix_string (Void)
			integer_format.hide_thousand_separator
			if is_leading_zero_shown then 
				integer_format.enable_zero_prefix
			else
				integer_format.disable_zero_prefix
			end
			Result := integer_format.formatted (a_millisecond_part)
		ensure
			Result_defined : Result /= Void
		end

	decimal_format (a_width, an_hour_part,a_minute_part,a_second_part, a_millisecond_part: INTEGER): STRING is
			-- Hours Minutes,seconds and milliseconds as a fraction of an hour.
		local
			l_double_format : FM_DOUBLE_FORMAT
			l_double : DOUBLE
		do
			Create l_double_format.make (a_width, decimals)
			l_double_format.no_justify
			l_double_format.hide_positive_sign
			l_double_format.show_zero
			l_double_format.set_decimal_character (decimal_character)
			l_double_format.set_suffix_string (Void)
			l_double_format.set_prefix_string (Void)
			l_double_format.hide_thousand_separator
			if is_leading_zero_shown then 
				l_double_format.enable_zero_prefix
			else
				l_double_format.disable_zero_prefix
			end
			l_double := an_hour_part + (a_minute_part / 60) + (a_second_part / 3600) + (a_millisecond_part / 3600000)
			Result := l_double_format.formatted (l_double)
		end

end -- class FM_TIME_ROUTINES

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

