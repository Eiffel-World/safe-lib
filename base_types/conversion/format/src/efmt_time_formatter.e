indexing
	description: "Objects that formats TIME objects"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/13 18:03:04 $"
	revision: "$Revision: 1.1 $"

class
	EFMT_TIME_FORMATTER
inherit
	EFMT_FORMATTER [DT_TIME]

creation
	make

feature {NONE} -- Initialization.

		make (a_width: INTEGER) is
				-- Initialize.
		require
			a_width_strict_positif: a_width > 0
		do
			width := a_width
			def_padding_character (defaults.padding_character)
			def_overflow_character (defaults.overflow_character)	
			def_prefix_string (defaults.prefix_string)
			def_suffix_string (defaults.suffix_string)
			justification := defaults.justification
			is_size_reduction_enabled := defaults.is_size_reduction_enabled
			def_time_separator (defaults.time_separator)
			is_time_separator_showed := defaults.is_time_separator_showed
			is_seconds_part_showed := defaults.is_seconds_part_showed
			is_milliseconds_part_showed := defaults.is_milliseconds_part_showed
			is_leading_zero_showed := defaults.is_leading_zero_showed
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = defaults.padding_character 
			overflow_character_default: overflow_character = defaults.overflow_character
			prefix_string_default: prefix_string = defaults.prefix_string
			suffix_string_default: suffix_string = defaults.suffix_string
			justification_default: justification = defaults.justification
			size_reduction_default: is_size_reduction_enabled  = defaults.is_size_reduction_enabled
			time_separator_default: time_separator = defaults.time_separator
			time_separator_visibility: is_time_separator_showed = defaults.is_time_separator_showed
			seconds_part_visibility: is_seconds_part_showed = defaults.is_seconds_part_showed
			milliseconds_part_visibility: is_milliseconds_part_showed = defaults.is_milliseconds_part_showed
			leading_zero_showed_default: is_leading_zero_showed = defaults.is_leading_zero_showed		
		end

feature -- Status report

	defaults: EFMT_TIME_FORMATTER is
			-- Shared default options for time formatters.
		once
			!!Result.make (5)
			Result.def_padding_character (' ')
			Result.def_overflow_character ('*')	
			Result.def_prefix_string (Void)
			Result.def_suffix_string (Void)
			Result.center_justify
			Result.disable_size_reduction
			Result.def_time_separator (':')
			Result.show_time_separator
			Result.hide_seconds_part
			Result.hide_milliseconds_part
			Result.show_leading_zero		
		end

	time_separator: CHARACTER
			-- Time separator

	is_leading_zero_showed: BOOLEAN
			-- Is the leading zero showed for the day and month part?
			-- e.g: when true : 01/09/00
	
	is_seconds_part_showed: BOOLEAN
			-- Is the seconds part showed?

	is_milliseconds_part_showed: BOOLEAN
			-- Is the milliseconds part showed?

	is_time_separator_showed: BOOLEAN
			-- Is the time separator showed? 

feature -- Status setting

	def_time_separator (a_separator: CHARACTER) is
			-- Define time_separator with `a_separator'.
		do
			time_separator := a_separator
		ensure
			time_separator_defined: time_separator = a_separator
		end

	show_time_separator is
			-- Show time separator.
		do
			is_time_separator_showed := True
		ensure
			is_time_separator_showed: is_time_separator_showed
		end

	show_seconds_part is
			-- Show seconds part.
		do
			is_seconds_part_showed := True
		ensure
			is_seconds_part_showed: is_seconds_part_showed
		end

	show_milliseconds_part is
			-- Show milliseconds part.
		do
			is_milliseconds_part_showed := True
		ensure
			is_milliseconds_part_showed: is_milliseconds_part_showed
		end

	hide_time_separator is
			-- Hide time separator.
		do
			is_time_separator_showed := False
		ensure
			not_is_time_separator_showed: not is_time_separator_showed
		end

	hide_seconds_part is
			-- Hide seconds part.
		do
			is_seconds_part_showed := False
		ensure
			not_is_seconds_part_showed: not is_seconds_part_showed
		end	

	hide_milliseconds_part is
			-- Hide milliseconds part.
		do
			is_milliseconds_part_showed := False
		ensure
			not_is_milliseconds_part_showed: not is_milliseconds_part_showed
		end

	show_leading_zero is
			-- Show leading zero in day and month part.
		do
			is_leading_zero_showed := True
		ensure
			is_leading_zero_showed: is_leading_zero_showed
		end

	hide_leading_zero is
			-- Hide leading zero in day and month part.
		do
			is_leading_zero_showed := False
		ensure
			not_is_leading_zero_showed: not is_leading_zero_showed
		end

feature -- Basic operations

	format (a_time: DT_TIME) is
			-- String format of `a_time'.
		local
			last_formatted_estring: ESTRING
		do
			!!last_formatted.make (width)

			if a_time /= Void then
				!!last_formatted_estring.make_from_string (last_formatted)

					append_hours (a_time)
					if is_time_separator_showed then 
						append_separator
					end
					append_minutes (a_time)
					if is_time_separator_showed then 
						append_separator
					end
					append_seconds (a_time)
					if is_time_separator_showed then 
						append_separator
					end
					append_milliseconds (a_time)	

				format_prefix 
				format_suffix

				if last_formatted_estring.count > width then
					handle_overflow
				end
			end
			justify
		end


feature {NONE} -- Implementation

	append_separator is
			-- Append date_separator.
		do
			last_formatted.append_character (time_separator)
		end

	append_hours (a_time: DT_TIME) is
			-- Append hours part.
		local
			integer_formatter: EFMT_INTEGER_FORMATTER
		do
			!!integer_formatter.make (2)
			integer_formatter.no_justify
			integer_formatter.hide_positive_sign
			integer_formatter.show_zero
			integer_formatter.def_suffix_string (Void)
			integer_formatter.def_prefix_string (Void)
			integer_formatter.hide_thousand_separator
			if is_leading_zero_showed then 
				integer_formatter.enable_zero_prefix
			else
				integer_formatter.disable_zero_prefix
			end
			integer_formatter.format (a_time.hour)
			last_formatted.append_string (integer_formatter.last_formatted)
		end

	append_minutes (a_time: DT_TIME) is
			-- Append minutes part.
		local
			integer_formatter: EFMT_INTEGER_FORMATTER
		do
			!!integer_formatter.make (2)
			integer_formatter.no_justify
			integer_formatter.hide_positive_sign
			integer_formatter.show_zero
			integer_formatter.def_suffix_string (Void)
			integer_formatter.def_prefix_string (Void)
			integer_formatter.hide_thousand_separator
			if is_leading_zero_showed then 
				integer_formatter.enable_zero_prefix
			else
				integer_formatter.disable_zero_prefix
			end
			integer_formatter.format (a_time.minute)
			last_formatted.append_string (integer_formatter.last_formatted)
		end

	append_seconds (a_time: DT_TIME) is
			-- Append seconds part.
		local
			integer_formatter: EFMT_INTEGER_FORMATTER
		do
			!!integer_formatter.make (2)
			integer_formatter.no_justify
			integer_formatter.hide_positive_sign
			integer_formatter.show_zero
			integer_formatter.def_suffix_string (Void)
			integer_formatter.def_prefix_string (Void)
			integer_formatter.hide_thousand_separator
			if is_leading_zero_showed then 
				integer_formatter.enable_zero_prefix
			else
				integer_formatter.disable_zero_prefix
			end
			integer_formatter.format (a_time.second)
			last_formatted.append_string (integer_formatter.last_formatted)
		end

	append_milliseconds (a_time: DT_TIME) is
			-- Append milliseconds part.
		local
			integer_formatter: EFMT_INTEGER_FORMATTER
		do
			!!integer_formatter.make (3)
			integer_formatter.no_justify
			integer_formatter.hide_positive_sign
			integer_formatter.show_zero
			integer_formatter.def_suffix_string (Void)
			integer_formatter.def_prefix_string (Void)
			integer_formatter.hide_thousand_separator
			if is_leading_zero_showed then 
				integer_formatter.enable_zero_prefix
			else
				integer_formatter.disable_zero_prefix
			end
			integer_formatter.format (a_time.millisecond)
			last_formatted.append_string (integer_formatter.last_formatted)
		end

end -- class EFMT_TIME_FORMATTER
