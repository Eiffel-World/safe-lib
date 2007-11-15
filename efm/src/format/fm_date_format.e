indexing
	description: "Objects that formats DATE objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2007/11/15 10:01:57 $";
	revision: "$Revision: 1.6 $";
	author: "Fafchamps eric"

class
	FM_DATE_FORMAT

inherit
	FM_SINGLE_LINE_FORMAT [DT_DATE]
		redefine
			is_equal
		end
		
create
	make, make_default

feature {NONE} -- Initialization.

		make (a_width: INTEGER) is
				-- Initialize with `a_width'
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
			set_padding_character (shared_default_format.padding_character)
			set_prefix_string (shared_default_format.prefix_string)
			set_suffix_string (shared_default_format.suffix_string)
			justification := shared_default_format.justification
			set_date_separator (shared_default_format.date_separator)
			order := shared_default_format.order
			is_four_digits_year := shared_default_format.is_four_digits_year
			is_leading_zero_shown := shared_default_format.is_leading_zero_shown
			is_date_separator_shown := shared_default_format.is_date_separator_shown
			insufficient_width_handler := shared_default_format.insufficient_width_handler			
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			justification_default: justification = shared_default_format.justification
			date_separator_default: date_separator = shared_default_format.date_separator
			date_separator_visibility: is_date_separator_shown = shared_default_format.is_date_separator_shown
			order_default: order = shared_default_format.order
			four_digits_year_default: is_four_digits_year = shared_default_format.is_four_digits_year
			leading_zero_shown_default: is_leading_zero_shown = shared_default_format.is_leading_zero_shown		
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
				set_date_separator ('-')
				show_date_separator
				select_ymd_order
				enable_four_digits_year
				show_leading_zero	
				create insufficient_width_handler
			ensure
				width_is_1 : width = 1
				padding_character_is_blank : padding_character.is_equal (' ')
				prefix_string_is_void : prefix_string = Void
				suffix_string_is_void : suffix_string = Void
				is_center_justified : is_center_justified
				date_separator_is_minus : date_separator.is_equal ('-')
				is_date_separator_shown : is_date_separator_shown
				is_ymd_ordered : is_ymd_ordered
				is_four_digits_year : is_four_digits_year
				is_leading_zero_shown : is_leading_zero_shown
			end


feature {NONE} -- Initialization

feature -- Access

	date_separator: CHARACTER
			-- Date separator

	shared_default_format: FM_DATE_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		end

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := 
				precursor (other) and
				equal (date_separator, other.date_separator) and
				equal (is_date_separator_shown, other.is_date_separator_shown) and
				equal (is_four_digits_year, other.is_four_digits_year) and
				equal (is_leading_zero_shown, other.is_leading_zero_shown) and
				equal (order, other.order)			
		ensure then
			definition: Result implies 
							equal (date_separator, other.date_separator) and
							equal (is_date_separator_shown, other.is_date_separator_shown) and
							equal (is_four_digits_year, other.is_four_digits_year) and
							equal (is_leading_zero_shown, other.is_leading_zero_shown) and
							equal (order, other.order)			
		end

feature -- Status report

	can_format (a_date: DT_DATE) : BOOLEAN is
			-- Can `a_date' be formatted by `Current'?
		do
			Result := a_date /= Void
		ensure then
			true_if_not_void: Result = (a_date /= Void)
		end

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

	is_leading_zero_shown: BOOLEAN
			-- Is the leading zero shown for the day, month and year part?
			-- e.g: when true : 01/09/00

	is_leading_zero_hidden: BOOLEAN is
			-- Is the leading zero hidden for the day, month and year part?
			-- e.g: when true : 1/9/0
		do
			Result := not is_leading_zero_shown
		end

	is_date_separator_shown: BOOLEAN
			-- Is the date separator shown?

	is_date_separator_hidden: BOOLEAN is
			-- Is the date separator hidden?
		do
			Result := not is_date_separator_shown
		end

feature -- Status setting

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
			is_leading_zero_shown := True
		ensure
			is_leading_zero_showe: is_leading_zero_shown
		end

	show_date_separator is	
			-- Show the date separator.
		do
			is_date_separator_shown := True
		ensure
			is_date_separator_shown: is_date_separator_shown
		end

	hide_date_separator is
			-- Hide the date separator.
		do
			is_date_separator_shown := False
		ensure
			is_date_separator_hidden: is_date_separator_hidden
		end

	hide_leading_zero is
			-- Hide leading zero in day, month and year part.
		do
			is_leading_zero_shown := False
		ensure
			is_leading_zero_hidden: is_leading_zero_hidden
		end

feature -- Cursor movement

feature -- Element change

	set_date_separator (a_separator: CHARACTER) is
			-- Set date separator with `a_separator'.
		do
			date_separator := a_separator
		ensure
			date_separator_copied: date_separator = a_separator
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_date: DT_DATE): STRING is
			-- Result of formatting `a_date'.
		do
			create last_formatted.make (width)

			if is_ymd_ordered then
				append_year (a_date)
				if is_date_separator_shown then
					append_separator
				end
				append_month (a_date)
				if is_date_separator_shown then
					append_separator
				end
				append_day (a_date)	
			else
				if is_dmy_ordered then 
					append_day (a_date)
					if is_date_separator_shown then
						append_separator
					end
					append_month (a_date)
					if is_date_separator_shown then
						append_separator
					end
					append_year (a_date)
				else
					append_month (a_date)
					if is_date_separator_shown then
						append_separator
					end
					append_day (a_date)
					if is_date_separator_shown then
						append_separator
					end
					append_year (a_date)
				end
			end

			format_prefix 
			format_suffix

			if last_formatted.count > width then
				last_formatted := insufficient_width_handler.string_with_valid_width (a_date, Current)
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			date_separator: is_date_separator_shown implies Result.has (date_separator)
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {FM_DATE_FORMAT}

	order: INTEGER
			-- Order of year, month and day parts.

feature {NONE} -- Implementation

	append_separator is
			-- Append date_separator.
		do
			last_formatted.append_character (date_separator)
		end

	append_day (a_date: DT_DATE) is
			-- Append day part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			create integer_format.make (2)
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
			last_formatted.append_string (integer_format.formatted (a_date.day))
		end

	append_month (a_date: DT_DATE) is
			-- Append month part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			create integer_format.make (2)
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
			last_formatted.append_string (integer_format.formatted (a_date.month))						
		end

	append_year (a_date: DT_DATE) is
			-- Append year part.
		local
			integer_format: FM_INTEGER_FORMAT
		do
			if is_four_digits_year then
				create integer_format.make (4)
			else
				create integer_format.make (2)
			end
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
			if is_four_digits_year then 
				last_formatted.append_string (integer_format.formatted (a_date.year))
			else
				last_formatted.append_string (integer_format.formatted (a_date.year \\ 100))
			end
		end

	ymd_order: INTEGER is 0
			-- Is the order year,month,day?

	dmy_order: INTEGER is 1
			-- Is the order day,month,year?

	mdy_order: INTEGER is 2
			-- Is the order month,day,year?

invariant
	exclusif_order: is_dmy_ordered xor is_mdy_ordered xor is_ymd_ordered
	
end -- class FM_DATE_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
