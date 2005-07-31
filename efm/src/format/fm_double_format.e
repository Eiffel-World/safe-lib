indexing
	description: "Objects that formats DOUBLE objects"

	usage: ""
	refactoring: "[
					There is no option to choose another type of rounding when fitting the number of decimals.
					]"

	status: "see notice at end of class";
	date: "$Date: 2005/07/31 18:22:28 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps Eric"

class
	FM_DOUBLE_FORMAT

inherit
	FM_NUMERIC_FORMAT [DOUBLE_REF]
		redefine
			formatted,
			is_equal
		end

creation
	make, make_default

feature {NONE} -- Initialization.

	make (a_width: INTEGER; n_decimals: INTEGER) is
			-- Initialize with a maximum allowed `a_width' and `n_decimals'.
		require
			a_width_strictly_positive: a_width > 0
			n_decimals_positive: n_decimals >= 0
		do
			width := a_width
			decimals := n_decimals
			set_padding_character (shared_default_format.padding_character)
			set_prefix_string (shared_default_format.prefix_string)
			set_suffix_string (shared_default_format.suffix_string)
			set_void_string (shared_default_format.void_string)			
			justification := shared_default_format.justification
			is_positive_sign_shown := shared_default_format.is_positive_sign_shown
			is_negative_sign_shown := shared_default_format.is_negative_sign_shown
			set_thousand_separator (shared_default_format.thousand_separator)
			is_zero_shown := shared_default_format.is_zero_shown
			is_thousand_separator_shown := shared_default_format.is_thousand_separator_shown
			is_zero_prefix_enabled := shared_default_format.is_zero_prefix_enabled
			is_trailing_zero_shown := shared_default_format.is_trailing_zero_shown
			set_decimal_character (shared_default_format.decimal_character)
			insufficient_width_handler := shared_default_format.insufficient_width_handler			
		ensure
			width_copied: width = a_width
			decimals_copied: decimals = n_decimals
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			void_string_default: equal (void_string, shared_default_format.void_string)
			justification_default: justification = shared_default_format.justification
			thousand_separator_default: thousand_separator = shared_default_format.thousand_separator
			is_positive_sign_shown_default: is_positive_sign_shown = shared_default_format.is_positive_sign_shown
			is_negative_sign_shown_default: is_negative_sign_shown = shared_default_format.is_negative_sign_shown
			decimal_character_default: decimal_character = shared_default_format.decimal_character
			is_zero_shown_default: is_zero_shown = shared_default_format.is_zero_shown
			is_thousand_separator_shown_default: is_thousand_separator_shown = shared_default_format.is_thousand_separator_shown
			is_trailing_zero_shown_default: is_trailing_zero_shown = shared_default_format.is_trailing_zero_shown
			is_zero_prefixed_default: is_zero_prefix_enabled = shared_default_format.is_zero_prefix_enabled
			insufficient_width_handler_default: insufficient_width_handler = shared_default_format.insufficient_width_handler
		end

	make_default is
			-- Make with default values.
			-- (used for the initialization of the shared_default_format)
		do
			width := 1
			set_decimals (0)
			set_padding_character (' ')
			set_prefix_string (Void)
			set_suffix_string (Void)
			set_void_string (Void)			
			right_justify
			set_thousand_separator (',')
			hide_positive_sign
			show_negative_sign
			show_zero
			disable_zero_prefix
			show_thousand_separator
			set_decimal_character ('.')
			show_trailing_zero	
			create insufficient_width_handler
		ensure
			width_is_1 : width = 1
			decimals_is_0: decimals = 0
			padding_character_is_blank : padding_character.is_equal (' ')
			prefix_string_is_void : prefix_string = Void
			suffix_string_is_void : suffix_string = Void
			void_string_is_void : void_string = Void			
			is_right_justified : is_right_justified
			thousand_separator_is_comma : thousand_separator.is_equal (',')				
			is_positive_sign_hidden: is_positive_sign_hidden
			is_negative_sign_shown: is_negative_sign_shown
			is_zero_shown: is_zero_shown
			is_zero_prefix_disabled: is_zero_prefix_disabled
			is_thousand_separator_shown: is_thousand_separator_shown
			decimal_character_is_dot: decimal_character.is_equal ('.')
			is_trailing_zero_shown: is_trailing_zero_shown
		end

feature -- Access

	decimals: INTEGER
			-- Number of digits in fractional part.

	decimal_character: CHARACTER
			-- Character for begin of fractional part.
			
	shared_default_format: FM_DOUBLE_FORMAT is
			-- Shared default options for double formats.
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
			equal (decimal_character, other.decimal_character) and
			equal (decimals, other.decimals) and
			equal (is_trailing_zero_shown, other.is_trailing_zero_shown)
		end

feature -- Status report

	can_format (a_double: DOUBLE_REF) : BOOLEAN is
			-- Can `a_double' be formatted by `Current'?
		do
			Result := True
		ensure then
			is_true: Result = True
		end

	is_trailing_zero_shown: BOOLEAN
			-- Are trailing zeros in fractional part shown.
	
	is_trailing_zero_hidden: BOOLEAN is
			-- Are trailing zeros in fractional part hidden.
		do
			Result := not is_trailing_zero_shown			
		end

feature -- Status setting

	hide_trailing_zero is
			-- Don't show trailing zeros in the fractional part.
		do
			is_trailing_zero_shown := False		
		ensure
			not_is_trailing_shown: not is_trailing_zero_shown
		end

	show_trailing_zero is 
			-- Show the trailing zeroes in the fractional part.
		do
			is_trailing_zero_shown := True
		ensure
			is_trailing_zero_shown: is_trailing_zero_shown
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
			-- Set character for begin of fractional part with `a_character'.
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

	formatted (a_double: DOUBLE_REF): STRING is
			-- Result of formatting `a_double'.
		local
			last_formatted_estring: ESTRING
			estring: ESTRING
			double_value: DOUBLE
			index_of_units: INTEGER
			sign: INTEGER
			i,j: INTEGER
		do
			create last_formatted.make (width)
			create last_formatted_estring.make_from_string (last_formatted)


			if a_double /= Void and then (a_double.item /= 0.0 or is_zero_shown) then
				sign := a_double.sign

				double_value := a_double.abs
				if double_value /= 0.0 then
					double_value := double_value + 5 / (10 ^ (decimals +1))
				end

				create estring.make_from_string (double_value.out)
				last_formatted_estring.append_string (estring)

				if last_formatted_estring.has ('.') then
					index_of_units := last_formatted_estring.index_of ('.', 1) - 1
					last_formatted_estring.head (index_of_units + decimals + 1)
				else
					index_of_units := last_formatted_estring.count
				end

				if not is_trailing_zero_shown and last_formatted_estring.has ('.') then
					last_formatted_estring.prune_all_trailing ('0')
				end

				if not last_formatted_estring.is_empty and then last_formatted_estring.item (last_formatted_estring.count) = '.' then
					last_formatted_estring.remove (last_formatted_estring.count)
				end

				if last_formatted_estring.has ('.') and decimal_character /= '.' then
					last_formatted_estring.put (decimal_character, last_formatted_estring.index_of ('.', 1))
				end

				if is_thousand_separator_shown then
					from
						i := index_of_units
						j := 0
					until
						i = 0
					loop
						j := j + 1
						if j = 3 and i /= 1 then
							last_formatted_estring.insert_character (thousand_separator, i)
							j := 0
						end
						i := i - 1
					end
				end

				format_zero_prefix (sign)

				format_sign (sign)
					
				format_prefix
				format_suffix 	
			
				if last_formatted_estring.count > width then
					last_formatted := insufficient_width_handler.string_with_valid_width (a_double, Current)
				end
			else
				if void_string /= Void then
					last_formatted.copy (void_string)
				end				
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			thousand_separator: a_double /= Void implies (a_double >= 1000.0 and is_thousand_separator_shown implies Result.has (thousand_separator))
			zero_shown: a_double /= Void implies (a_double = 0.0 and is_zero_shown implies Result.has ('0'))
			positive_sign_shown: a_double /= Void implies (a_double > 0.0 and is_positive_sign_shown implies Result.has ('+'))
			negative_sign_shown: a_double /= Void implies (a_double < 0.0 and is_negative_sign_shown implies Result.has ('-'))
			decimal_character: a_double /= Void implies (a_double.abs > 0 and decimals > 0 implies Result.has (decimal_character))
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class FM_DOUBLE_FORMAT

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
