indexing
	description: "Objects that formats DATE objects"
	limitation: "Long date formats like 23 septembre 2000 are not implemented for now"
	author: "Fafchamps eric"
	date: "$Date: 2001/09/13 18:03:04 $"
	revision: "$Revision: 1.1 $"

class
	EFMT_DATE_FORMATTER

inherit
	EFMT_FORMATTER [DT_DATE]

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
			def_date_separator (defaults.date_separator)
			order := defaults.order
			is_four_digits_year := defaults.is_four_digits_year
			is_leading_zero_showed := defaults.is_leading_zero_showed
			is_date_separator_showed := defaults.is_date_separator_showed
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = defaults.padding_character 
			overflow_character_default: overflow_character = defaults.overflow_character
			prefix_string_default: prefix_string = defaults.prefix_string
			suffix_string_default: suffix_string = defaults.suffix_string
			justification_default: justification = defaults.justification
			size_reduction_default: is_size_reduction_enabled  = defaults.is_size_reduction_enabled
			date_separator_default: date_separator = defaults.date_separator
			date_separator_visibility: is_date_separator_showed = defaults.is_date_separator_showed
			order_default: order = defaults.order
			four_digits_year_default: is_four_digits_year = defaults.is_four_digits_year
			leading_zero_showed_default: is_leading_zero_showed = defaults.is_leading_zero_showed		
		end

feature -- Status report

	defaults: EFMT_DATE_FORMATTER is
			-- Shared default options for date formatters.
		once
			!!Result.make (10)
			Result.def_padding_character (' ')
			Result.def_overflow_character ('*')	
			Result.def_prefix_string (Void)
			Result.def_suffix_string (Void)
			Result.center_justify
			Result.disable_size_reduction
			Result.def_date_separator ('-')
			Result.show_date_separator
			Result.select_ymd_order
			Result.enable_four_digits_year
			Result.show_leading_zero		
		end

	date_separator: CHARACTER
			-- Date separator

	is_ymd_ordered: BOOLEAN is
			-- Is the order year,month,day?
		do
			Result := order = Ymd_order
		ensure
			is_ymd_ordered: Result = (order = Ymd_order)
		end

	is_dmy_ordered: BOOLEAN is
			-- Is the order day,month,year?
		do
			Result := order = Dmy_order
		ensure
			is_dmy_ordered: Result = (order = Dmy_order)
		end

	is_mdy_ordered:BOOLEAN is
			-- Is the order month,day,year?
		do
			Result := order = Mdy_order
		ensure
			is_mdy_ordered: Result = (order = Mdy_order)
		end
	
	is_four_digits_year: BOOLEAN
			-- Is the year formatted in 4 digits?

	is_leading_zero_showed: BOOLEAN
			-- Is the leading zero showed for the day and month part?
			-- e.g: when true : 01/09/00
	

	is_date_separator_showed: BOOLEAN
			-- Is the date separator showed?

feature -- Status setting

	def_date_separator (a_separator: CHARACTER) is
			-- Define date_separator with `a_separator'.
		do
			date_separator := a_separator
		ensure
			date_separator_defined: date_separator = a_separator
		end

	select_ymd_order is
			-- Select the year month day order of presentation.
		do
			order := Ymd_order
		ensure
			is_ymd_ordered: is_ymd_ordered
		end

	select_dmy_order is
			-- Select the day month year order of presentation.
		do
			order := Dmy_order
		ensure
			is_dmy_ordered: is_dmy_ordered	
		end

	select_mdy_order is
			-- Select the month day year order of presentation.
		do
			order := Mdy_order
		ensure
			is_mdy_ordered: is_mdy_ordered
		end


	enable_four_digits_year is
			-- Enable the four digits format for the year part.
		do
			is_four_digits_year := True
		ensure
			is_four_digits_year: is_four_digits_year
		end

	disable_four_digits_year is
			-- Disable the four digits format for the year part.
		do
			is_four_digits_year := False
		ensure
			not_is_four_digits_year: not is_four_digits_year
		end
	
	show_leading_zero is
			-- Show leading zero in day and month part.
		do
			is_leading_zero_showed := True
		ensure
			is_leading_zero_showe: is_leading_zero_showed
		end

	show_date_separator is	
			-- Show the date separator.
		do
			is_date_separator_showed := True
		ensure
			is_date_separator_showed: is_date_separator_showed
		end


	hide_date_separator is
			-- Hide the date separator.
		do
			is_date_separator_showed := False
		ensure
			not_is_date_separator_showed: not is_date_separator_showed
		end

	hide_leading_zero is
			-- Hide leading zero in day and month part.
		do
			is_leading_zero_showed := False
		ensure
			not_is_leading_zero_showed: not is_leading_zero_showed
		end

feature -- Basic operations

	format (a_date: DT_DATE) is
			-- String format of `a_date'.
		local
			last_formatted_estring: ESTRING
		do
			!!last_formatted.make (width)

			if a_date /= Void then
				!!last_formatted_estring.make_from_string (last_formatted)


				if is_ymd_ordered then
					append_year (a_date)
					if is_date_separator_showed then
						append_separator
					end
					append_month (a_date)
					if is_date_separator_showed then
						append_separator
					end
					append_day (a_date)	
				else
					if is_dmy_ordered then 
						append_day (a_date)
						if is_date_separator_showed then
							append_separator
						end
						append_month (a_date)
						if is_date_separator_showed then
							append_separator
						end
						append_year (a_date)
					else
						append_month (a_date)
						if is_date_separator_showed then
							append_separator
						end
						append_day (a_date)
						if is_date_separator_showed then
							append_separator
						end
						append_year (a_date)
					end
				end

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
			last_formatted.append_character (date_separator)
		end

	append_day (a_date: DT_DATE) is
			-- Append day part.
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
			integer_formatter.format (a_date.day)
			last_formatted.append_string (integer_formatter.last_formatted)
		end

	append_month (a_date: DT_DATE) is
			-- Append month part.
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
			integer_formatter.format (a_date.month)
			last_formatted.append_string (integer_formatter.last_formatted)						
		end

	append_year (a_date: DT_DATE) is
			-- Append year part.
		local
			integer_formatter: EFMT_INTEGER_FORMATTER
		do
			if is_four_digits_year then
				!!integer_formatter.make (4)
			else
				!!integer_formatter.make (2)
			end
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
			if is_four_digits_year then 
				integer_formatter.format (a_date.year)
			else
				integer_formatter.format (a_date.year \\ 100)
			end
			last_formatted.append_string (integer_formatter.last_formatted)
		end

	ymd_order: INTEGER is 0
			-- Is the order year,month,day?

	dmy_order: INTEGER is 1
			-- Is the order day,month,year?

	mdy_order: INTEGER is 2
			-- Is the order month,day,year?

feature {EFMT_DATE_FORMATTER}

	order: INTEGER
			-- Order of year, month and day parts.

end -- class EFMT_DATE_FORMATTER


