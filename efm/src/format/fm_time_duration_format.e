indexing
	description: "Objects that formats TIME_DURATION objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/12 20:21:34 $";
	revision: "$Revision: 1.1 $";
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
			set_void_string (shared_default_format.void_string)			
			justification := shared_default_format.justification
			set_time_separator (shared_default_format.time_separator)
			is_time_separator_shown := shared_default_format.is_time_separator_shown
			is_seconds_part_shown := shared_default_format.is_seconds_part_shown
			is_milliseconds_part_shown := shared_default_format.is_milliseconds_part_shown
			is_leading_zero_shown := shared_default_format.is_leading_zero_shown
			is_decimal_format := shared_default_format.is_decimal_format
			decimals := shared_default_format.decimals
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			void_string_default: equal (void_string, shared_default_format.void_string)
			justification_default: justification = shared_default_format.justification
			time_separator_default: time_separator = shared_default_format.time_separator
			time_separator_visibility: is_time_separator_shown = shared_default_format.is_time_separator_shown
			seconds_part_visibility: is_seconds_part_shown = shared_default_format.is_seconds_part_shown
			milliseconds_part_visibility: is_milliseconds_part_shown = shared_default_format.is_milliseconds_part_shown
			leading_zero_shown_default: is_leading_zero_shown = shared_default_format.is_leading_zero_shown		
			decimal_format_default : is_decimal_format = shared_default_format.is_decimal_format
			decimals_default : decimals = shared_default_format.decimals
		end

		make_default is
				-- Make with default values.
				-- (used for the initialization of the shared_default_format)
			do
				width := 1
				set_padding_character (' ')
				set_prefix_string (Void)
				set_suffix_string (Void)
				set_void_string (Void)
				center_justify
				set_time_separator (':')
				show_time_separator
				hide_seconds_part
				hide_milliseconds_part
				hide_leading_zero		
				set_decimal_character ('.')
				set_decimals (1)
			ensure
				width_is_1 : width = 1
				padding_character_is_blank : padding_character.is_equal (' ')
				prefix_string_is_void : prefix_string = Void
				suffix_string_is_void : suffix_string = Void
				void_string_is_void : void_string = Void				
				is_center_justified : is_center_justified
				time_separator_is_colon: time_separator.is_equal (':')
				is_time_separator_shown: is_time_separator_shown
				is_seconds_part_hidden: is_seconds_part_hidden
				is_milliseconds_part_hidden: is_milliseconds_part_hidden
				is_leading_zero_hidden: is_leading_zero_hidden
				decimal_character_is_dot: decimal_character.is_equal ('.')
				decimals_is_1: decimals = 1
			end

feature -- Access

	shared_default_format: FM_TIME_DURATION_FORMAT is
			-- Shared default options for format.
		once
			Create Result.make_default
		end

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
		end

feature -- Status report

	can_format (a_time_duration: DT_TIME_DURATION) : BOOLEAN is
			-- Can `a_time_duration' be formatted by `Current'?
		do
			Result := True
		ensure then
			is_true: Result = True
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_time_duration: DT_TIME_DURATION): STRING is
			-- Result of formatting `a_time_duration'.
		do
			!!last_formatted.make (width)

			if a_time_duration /= Void then
					if is_decimal_format then
						last_formatted.append_string (decimal_format (width, a_time_duration.hour,a_time_duration.minute,a_time_duration.second, a_time_duration.millisecond))
					else						
						last_formatted.append_string (hours_part (a_time_duration.hour))
						if is_time_separator_shown then 
							last_formatted.append_character (time_separator)
						end
						last_formatted.append_string (minutes_part (a_time_duration.minute))
						if is_seconds_part_shown then
							if is_time_separator_shown then 
								last_formatted.append_character (time_separator)
							end
							last_formatted.append_string (seconds_part (a_time_duration.second))
							if is_milliseconds_part_shown then
								if is_time_separator_shown then 
									last_formatted.append_character (time_separator)
								end
								last_formatted.append_string (milliseconds_part (a_time_duration.millisecond))
							end
						end
					end					
				format_prefix 
				format_suffix

				if last_formatted.count > width then
					handle_insufficient_width (a_time_duration)
				end
			else
				if void_string /= Void then
					last_formatted.copy (void_string)
				end			
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			decimal_format: (a_time_duration /= Void and is_decimal_format and decimals > 0) implies Result.has (decimal_character)
			time_separator: (a_time_duration /= Void and not is_decimal_format and is_time_separator_shown) implies Result.has (time_separator)
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	
end -- class FM_TIME_DURATION_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

