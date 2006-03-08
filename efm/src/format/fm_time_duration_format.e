indexing
	description: "Objects that formats TIME_DURATION objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:18 $";
	revision: "$Revision: 1.6 $";
	author: "Fafchamps Eric"

class
	FM_TIME_DURATION_FORMAT

inherit
	FM_SINGLE_LINE_FORMAT [DT_TIME_DURATION]
		redefine
			is_equal
		end
		
	FM_TIME_ROUTINES
		undefine
			is_equal,
			copy
		end
	
creation
	make, make_default

feature {NONE} -- Initialization.

		make (a_width: INTEGER) is
				-- Initialize with `a_width'.
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
			set_padding_character (shared_default_format.padding_character)
			set_prefix_string (shared_default_format.prefix_string)
			set_suffix_string (shared_default_format.suffix_string)
			justification := shared_default_format.justification
			set_time_separator (shared_default_format.time_separator)
			is_time_separator_shown := shared_default_format.is_time_separator_shown
			is_seconds_part_shown := shared_default_format.is_seconds_part_shown
			is_milliseconds_part_shown := shared_default_format.is_milliseconds_part_shown
			is_leading_zero_shown := shared_default_format.is_leading_zero_shown
			decimals := shared_default_format.decimals
			decimal_character := shared_default_format.decimal_character
			is_decimal_format := shared_default_format.is_decimal_format
			insufficient_width_handler := shared_default_format.insufficient_width_handler			
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			justification_default: justification = shared_default_format.justification
			time_separator_default: time_separator = shared_default_format.time_separator
			time_separator_visibility: is_time_separator_shown = shared_default_format.is_time_separator_shown
			seconds_part_visibility: is_seconds_part_shown = shared_default_format.is_seconds_part_shown
			milliseconds_part_visibility: is_milliseconds_part_shown = shared_default_format.is_milliseconds_part_shown
			leading_zero_shown_default: is_leading_zero_shown = shared_default_format.is_leading_zero_shown		
			decimals_default : decimals = shared_default_format.decimals
			decimal_character_default: decimal_character = shared_default_format.decimal_character
			is_decimal_format_default: is_decimal_format = shared_default_format.is_decimal_format
			insufficient_width_handler_default: insufficient_width_handler = shared_default_format.insufficient_width_handler
		end

		make_default is
				-- Make with default values.
				-- (used for the initialization of the shared_default_format)
			do
				width := 1
				set_padding_character (' ')
				set_prefix_string (Void)
				set_suffix_string (Void)
				center_justify
				set_time_separator (':')
				show_time_separator
				hide_seconds_part
				hide_milliseconds_part
				hide_leading_zero		
				set_decimal_character ('.')
				set_decimals (1)
				disable_decimal_format
				create insufficient_width_handler
			ensure
				width_is_1 : width = 1
				padding_character_is_blank : padding_character.is_equal (' ')
				prefix_string_is_void : prefix_string = Void
				suffix_string_is_void : suffix_string = Void
				is_center_justified : is_center_justified
				time_separator_is_colon: time_separator.is_equal (':')
				is_time_separator_shown: is_time_separator_shown
				is_seconds_part_hidden: is_seconds_part_hidden
				is_milliseconds_part_hidden: is_milliseconds_part_hidden
				is_leading_zero_hidden: is_leading_zero_hidden
				decimal_character_is_dot: decimal_character.is_equal ('.')
				decimals_is_1: decimals = 1
				not_is_decimal_format: not is_decimal_format
			end

feature -- Access

	shared_default_format: FM_TIME_DURATION_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		end

	decimals: INTEGER
			-- Number of digits in fractional part.

	decimal_character: CHARACTER
			-- Character for begin of fractional part in decimal format.

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := 
			precursor {FM_SINGLE_LINE_FORMAT} (other) and
			equal (decimal_character, other.decimal_character) and			
			equal (decimals, other.decimals) and
			equal (is_decimal_format, other.is_decimal_format) and
			equal (is_leading_zero_shown, other.is_leading_zero_shown) and
			equal (is_milliseconds_part_shown, other.is_milliseconds_part_shown) and			
			equal (is_seconds_part_shown, other.is_seconds_part_shown) and
			equal (is_time_separator_shown, other.is_time_separator_shown) and
			equal (time_separator, other.time_separator)
		ensure then
			definition: Result implies
							equal (decimal_character, other.decimal_character) and			
							equal (decimals, other.decimals) and
							equal (is_decimal_format, other.is_decimal_format) and
							equal (is_leading_zero_shown, other.is_leading_zero_shown) and
							equal (is_milliseconds_part_shown, other.is_milliseconds_part_shown) and			
							equal (is_seconds_part_shown, other.is_seconds_part_shown) and
							equal (is_time_separator_shown, other.is_time_separator_shown) and
							equal (time_separator, other.time_separator)
		end

feature -- Status report

	can_format (a_time_duration: DT_TIME_DURATION) : BOOLEAN is
			-- Can `a_time_duration' be formatted by `Current'?
		do
			Result := a_time_duration /= Void
		ensure then
			true_if_not_void: Result = (a_time_duration /= Void)
		end

	is_decimal_format: BOOLEAN
			-- Is the duration formatted as decimal fractions of an hour?

feature -- Status setting

	enable_decimal_format is
			-- Enable the decimal format.
		do
			is_decimal_format := True
		ensure
			is_decimal_format: is_decimal_format
		end
		
	disable_decimal_format is
			-- Disable the decimal format.
		do
			is_decimal_format := False
		ensure
			not_is_decimal_format: not is_decimal_format
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

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_time_duration: DT_TIME_DURATION): STRING is
			-- Result of formatting `a_time_duration'.
		local
			l_time_duration: DT_TIME_DURATION
		do
			create last_formatted.make (width)

			l_time_duration := a_time_duration.to_canonical
			if is_decimal_format then
				last_formatted.append_string (decimal_format (width, l_time_duration.hour,l_time_duration.minute,l_time_duration.second, l_time_duration.millisecond))
			else						
				last_formatted.append_string (l_time_duration.hour.out)
				if is_time_separator_shown then 
					last_formatted.append_character (time_separator)
				end
				last_formatted.append_string (minutes_part (l_time_duration.minute))
				if is_seconds_part_shown then
					if is_time_separator_shown then 
						last_formatted.append_character (time_separator)
					end
					last_formatted.append_string (seconds_part (l_time_duration.second))
					if is_milliseconds_part_shown then
						if is_time_separator_shown then 
							last_formatted.append_character (time_separator)
						end
						last_formatted.append_string (milliseconds_part (l_time_duration.millisecond))
					end
				end
			end					
			format_prefix 
			format_suffix
	
			if last_formatted.count > width then
				last_formatted := insufficient_width_handler.string_with_valid_width (l_time_duration, Current)
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			decimal_format: (is_decimal_format and decimals > 0) implies Result.has (decimal_character)
			time_separator: (not is_decimal_format and is_time_separator_shown) implies Result.has (time_separator)
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	decimal_format (a_width, an_hour_part,a_minute_part,a_second_part, a_millisecond_part: INTEGER): STRING is
			-- Hours Minutes,seconds and milliseconds as a fraction of an hour.
		local
			l_double_format : FM_DOUBLE_FORMAT
			l_double : DOUBLE
		do
			create l_double_format.make (a_width, decimals)
			l_double_format.no_justify
			l_double_format.hide_positive_sign
			l_double_format.show_zero
			l_double_format.set_decimal_character (decimal_character)
			l_double_format.set_suffix_string (Void)
			l_double_format.set_prefix_string (Void)
			l_double_format.hide_thousand_separator
			l_double_format.disable_zero_prefix
			l_double := an_hour_part + (a_minute_part / 60) + (a_second_part / 3600) + (a_millisecond_part / 3600000)
			Result := l_double_format.formatted (l_double)
		end
	
end -- class FM_TIME_DURATION_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

