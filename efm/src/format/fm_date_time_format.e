indexing
	description: "Objects that formats DATE_TIME objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:18 $";
	revision: "$Revision: 1.5 $";
	author: "Fafchamps eric"

class
	FM_DATE_TIME_FORMAT

inherit
	FM_SINGLE_LINE_FORMAT [DT_DATE_TIME]
		redefine
			is_equal,
			copy
		end

create
	make, make_default
	
feature {NONE} -- Initialization.

	make (a_width: INTEGER) is
				-- Initialize with `a_width'.
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
			set_date_time_separator (shared_default_format.date_time_separator)
			set_padding_character (shared_default_format.padding_character)
			set_prefix_string (shared_default_format.prefix_string)
			set_suffix_string (shared_default_format.suffix_string)
			justification := shared_default_format.justification

			create date_format.make (a_width)
			date_format.set_prefix_string (Void)
			date_format.set_suffix_string (Void)
			date_format.no_justify
			set_date_separator (shared_default_format.date_separator)
			if shared_default_format.is_ymd_ordered then
				select_ymd_order
			elseif default.is_dmy_ordered then
				select_dmy_order
			elseif default.is_mdy_ordered then
				select_mdy_order
			end
			if shared_default_format.is_four_digits_year then
				enable_four_digits_year
			else
				disable_four_digits_year
			end
			if shared_default_format.is_leading_zero_shown_in_date then
				show_leading_zero_in_date
			else
				hide_leading_zero_in_date
			end
			if shared_default_format.is_date_separator_shown then
				show_date_separator
			else
				hide_date_separator
			end

			create time_format.make (a_width)
			time_format.set_prefix_string (Void)
			time_format.set_suffix_string (Void)
			time_format.no_justify
			set_time_separator (shared_default_format.time_separator)
			if shared_default_format.is_time_separator_shown then
				show_time_separator
			else
				hide_time_separator
			end
			if shared_default_format.is_seconds_part_shown then
				show_seconds_part
			else
				hide_seconds_part
			end
			if shared_default_format.is_milliseconds_part_shown then
				show_milliseconds_part
			else
				hide_milliseconds_part
			end
			if shared_default_format.is_leading_zero_shown_in_time then
				show_leading_zero_in_time
			else
				hide_leading_zero_in_time
			end
			insufficient_width_handler := shared_default_format.insufficient_width_handler			
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			justification_default: justification = shared_default_format.justification
			date_separator_default: date_separator = shared_default_format.date_separator
			date_separator_visibility: is_date_separator_shown = shared_default_format.is_date_separator_shown
			order_default: shared_default_format.is_ymd_ordered = is_ymd_ordered and shared_default_format.is_dmy_ordered = is_dmy_ordered and shared_default_format.is_mdy_ordered = is_mdy_ordered
			four_digits_year_default: is_four_digits_year = shared_default_format.is_four_digits_year
			leading_zero_shown_in_date_default: is_leading_zero_shown_in_date = shared_default_format.is_leading_zero_shown_in_date		
			time_separator_default: time_separator = shared_default_format.time_separator
			time_separator_visibility: is_time_separator_shown = shared_default_format.is_time_separator_shown
			seconds_part_visibility: is_seconds_part_shown = shared_default_format.is_seconds_part_shown
			milliseconds_part_visibility: is_milliseconds_part_shown = shared_default_format.is_milliseconds_part_shown
			leading_zero_shown__in_time_default: is_leading_zero_shown_in_time = shared_default_format.is_leading_zero_shown_in_time		
			insufficient_width_handler_default: insufficient_width_handler = shared_default_format.insufficient_width_handler
		end


	make_default is
			-- Make with default values.
			-- (used for the initialization of the shared_default_format)
		do
			width := 1
			create date_format.make_default
			create time_format.make_default
			set_date_time_separator (" ")
			set_padding_character (' ')
			set_prefix_string (Void)
			set_suffix_string (Void)
			center_justify
			set_date_separator ('-')
			show_date_separator
			select_ymd_order
			enable_four_digits_year
			show_leading_zero_in_date
			set_time_separator (':')
			show_time_separator
			hide_seconds_part
			hide_milliseconds_part
			show_leading_zero_in_time
			create insufficient_width_handler
		ensure
			width_is_1 : width = 1
			date_time_separator_is_blank: date_time_separator.is_equal (" ")
			padding_character_is_blank: padding_character.is_equal (' ')
			prefix_string_is_void: prefix_string = Void
			suffix_string_is_void: suffix_string = Void
			is_center_justified: is_center_justified
			date_separator_is_minus: date_separator.is_equal ('-')
			is_date_separator_shown: is_date_separator_shown
			is_ymd_ordered: is_ymd_ordered
			is_four_digits_year: is_four_digits_year
			is_leading_zero_shown_in_date: is_leading_zero_shown_in_date
			time_separator_is_colon: time_separator.is_equal (':')
			is_time_separator_shown: is_time_separator_shown
			is_seconds_part_hidden: is_seconds_part_hidden
			is_milliseconds_part_hidden: is_milliseconds_part_hidden
			is_leading_zero_shown_in_time: is_leading_zero_shown_in_time
		end

feature {NONE} -- Initialization

feature -- Access

	shared_default_format: FM_DATE_TIME_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		end

	date_time_separator: STRING
			-- Separator between date and time part.

	date_separator: CHARACTER is
			-- Date separator
		do
			Result := date_format.date_separator
		end

	time_separator: CHARACTER is
			-- Time separator
		do
			Result := time_format.time_separator
		end

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := 
				precursor (other) and
				equal (date_format, other.date_format) and
				equal (time_format, other.time_format) and
				equal (date_time_separator, other.date_time_separator)
		ensure then 
			definition: Result implies 
				equal (date_format, other.date_format) and
				equal (time_format, other.time_format) and
				equal (date_time_separator, other.date_time_separator)
		end

feature -- Status report

	can_format (a_date_time: DT_DATE_TIME): BOOLEAN is
			-- Can `a_date_time' be formatted by `Current'?
		do
			Result := a_date_time /= Void
		ensure then
			true_if_not_void: Result = (a_date_time /= Void)
		end

	is_ymd_ordered: BOOLEAN is
			-- Is the order year,month,day?
		do
			Result := date_format.is_ymd_ordered
		end

	is_dmy_ordered: BOOLEAN is
			-- Is the order day,month,year?
		do
			Result := date_format.is_dmy_ordered
		end

	is_mdy_ordered:BOOLEAN is
			-- Is the order month,day,year?
		do
			Result := date_format.is_mdy_ordered
		end
	
	is_four_digits_year: BOOLEAN is
			-- Is the year formatted in 4 digits?
		do
			Result := date_format.is_four_digits_year
		end

	is_leading_zero_shown_in_date: BOOLEAN is
			-- Is the leading zero shown for the day and month parts?
			-- e.g: when true : 01/09/00
		do
			Result := date_format.is_leading_zero_shown
		end

	is_leading_zero_hidden_in_date: BOOLEAN is
			-- Is the leading zero hidden for the day and month parts?
			-- e.g: when true : 1/9/0
		do
			Result := date_format.is_leading_zero_hidden
		end

	is_date_separator_shown: BOOLEAN is
			-- Is the date separator shown?
		do
			Result := date_format.is_date_separator_shown
		end

	is_date_separator_hidden: BOOLEAN is
			-- Is the date separator hidden?
		do
			Result := date_format.is_date_separator_hidden
		end

	is_leading_zero_shown_in_time: BOOLEAN is
			-- Is the leading zero shown in each time part?
			-- e.g: when true : 01:09:03
		do
			Result := time_format.is_leading_zero_shown
		end

	is_leading_zero_hidden_in_time: BOOLEAN is
			-- Is the leading zero hidden in each time part?
			-- e.g: when true : 1:9:3
		do
			Result := time_format.is_leading_zero_hidden
		end

	is_seconds_part_shown: BOOLEAN is
			-- Is the seconds part shown?
		do
			Result := time_format.is_seconds_part_shown
		end

	is_seconds_part_hidden: BOOLEAN is
			-- Is the seconds part hidden?
		do
			Result := time_format.is_seconds_part_hidden
		end

	is_milliseconds_part_shown: BOOLEAN is
			-- Is the milliseconds part shown?
		do
			Result := time_format.is_milliseconds_part_shown
		end

	is_milliseconds_part_hidden: BOOLEAN is
			-- Is the milliseconds part hidden?
		do
			Result := time_format.is_milliseconds_part_hidden
		end

	is_time_separator_shown: BOOLEAN is
			-- Is the time separator shown? 
		do
			Result := time_format.is_time_separator_shown
		end

	is_time_separator_hidden: BOOLEAN is
			-- Is the time separator hidden? 
		do
			Result := time_format.is_time_separator_hidden
		end

feature -- Status setting

	select_ymd_order is
			-- Select the year month day order of presentation.
		do
			date_format.select_ymd_order
		ensure
			is_ymd_ordered: is_ymd_ordered
		end

	select_dmy_order is
			-- Select the day month year order of presentation.
		do
			date_format.select_dmy_order
		ensure
			is_dmy_ordered: is_dmy_ordered	
		end

	select_mdy_order is
			-- Select the month day year order of presentation.
		do
			date_format.select_mdy_order
		ensure
			is_mdy_ordered: is_mdy_ordered
		end

	enable_four_digits_year is
			-- Enable the four digits format for the year part.
		do
			date_format.enable_four_digits_year
		ensure
			is_four_digits_year: is_four_digits_year
		end

	disable_four_digits_year is
			-- Disable the four digits format for the year part.
		do
			date_format.disable_four_digits_year
		ensure
			not_is_four_digits_year: not is_four_digits_year
		end
	
	show_leading_zero_in_date is
			-- Show leading zero in day and month part.
		do
			date_format.show_leading_zero
		ensure
			is_leading_zero_shown_in_date: is_leading_zero_shown_in_date
		end

	show_date_separator is	
			-- Show the date separator.
		do
			date_format.show_date_separator
		ensure
			is_date_separator_shown: is_date_separator_shown
		end

	hide_date_separator is
			-- Hide the date separator.
		do
			date_format.hide_date_separator
		ensure
			is_date_separator_hidden: is_date_separator_hidden
		end

	hide_leading_zero_in_date is
			-- Hide leading zero in day and month part.
		do
			date_format.hide_leading_zero
		ensure
			is_leading_zero_hidden_in_date: is_leading_zero_hidden_in_date
		end

	show_time_separator is
			-- Show time separator.
		do
			time_format.show_time_separator
		ensure
			is_time_separator_shown: is_time_separator_shown
		end

	show_seconds_part is
			-- Show seconds part.
		do
			time_format.show_seconds_part
		ensure
			is_seconds_part_shown: is_seconds_part_shown
		end

	show_milliseconds_part is
			-- Show milliseconds part.
		do
			time_format.show_milliseconds_part
		ensure
			is_milliseconds_part_shown: is_milliseconds_part_shown
			is_seconds_part_shown: is_seconds_part_shown			
		end

	hide_time_separator is
			-- Hide time separator.
		do
			time_format.hide_time_separator
		ensure
			is_time_separator_hidden: is_time_separator_hidden
		end

	hide_seconds_part is
			-- Hide seconds part.
		do
			time_format.hide_seconds_part
		ensure
			is_seconds_part_hidden: is_seconds_part_hidden
			is_milliseconds_part_hidden: is_milliseconds_part_hidden
		end	

	hide_milliseconds_part is
			-- Hide milliseconds part.
		do
			time_format.hide_milliseconds_part
		ensure
			is_milliseconds_part_hidden: is_milliseconds_part_hidden
		end

	show_leading_zero_in_time is
			-- Show leading zero in each time part.
		do
			time_format.show_leading_zero
		ensure
			is_leading_zero_shown_in_time : is_leading_zero_shown_in_time
		end

	hide_leading_zero_in_time is
			-- Hide leading zero in each time part.
		do
			time_format.hide_leading_zero
		ensure
			is_leading_zero_hidden_in_time : is_leading_zero_hidden_in_time
		end

feature -- Cursor movement

feature -- Element change

	set_date_separator (a_separator: CHARACTER) is
			-- Set date_separator with `a_separator'.
		do
			date_format.set_date_separator (a_separator)
		ensure
			date_separator_set: date_separator = a_separator
		end

	set_time_separator (a_separator: CHARACTER) is
			-- Set time_separator with `a_separator'.
		do
			time_format.set_time_separator (a_separator)
		ensure
			time_separator_set: time_separator = a_separator
		end

	set_date_time_separator (a_separator : STRING) is
			-- Set separator between date and time with `a_separator'.
		do
			date_time_separator := clone (a_separator)
		ensure
			date_time_separator_copied : equal (date_time_separator, a_separator)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

	copy (other: like Current) is
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
		do
			precursor (other)
			date_format := clone (other.date_format)
			time_format := clone (other.time_format)
			set_date_time_separator (other.date_time_separator)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_date_time: DT_DATE_TIME): STRING is
			-- Result of formatting `a_date_time'.
		do
			create last_formatted.make (width)
			last_formatted.append_string (date_format.formatted (a_date_time.date))
			if date_time_separator /= Void then
				last_formatted.append_string (date_time_separator)
			end
			last_formatted.append_string (time_format.formatted (a_date_time.time))
			format_prefix 
			format_suffix
			if last_formatted.count > width then
				last_formatted := insufficient_width_handler.string_with_valid_width (a_date_time, Current)
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			date_separator: is_date_separator_shown implies Result.has (date_separator)			
			time_separator: is_time_separator_shown implies Result.has (time_separator)
			date_time_separator: date_time_separator /= Void implies Result.has_substring (date_time_separator)
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {FM_DATE_TIME_FORMAT} -- Implementation

	date_format : FM_DATE_FORMAT
			-- Date format.

	time_format : FM_TIME_FORMAT
			-- Time format.

invariant
	date_format_defined: date_format /= Void
	time_format_defined: time_format /= Void

end -- class FM_DATE_FORMAT


--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
