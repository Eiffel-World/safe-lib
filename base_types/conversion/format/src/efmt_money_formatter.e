indexing
	description: "Objects that formats EMO_MONEY objects"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/13 18:03:04 $"
	revision: "$Revision: 1.1 $"

class
	EFMT_MONEY_FORMATTER

inherit
	EFMT_NUMERIC_FORMATTER [EMO_MONEY]
		redefine
			format
		end

creation
	make

feature {NONE} -- Initialization.

	make (a_width: INTEGER) is
			-- Initialize with a maximum allowed `a_width'.
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
			is_positive_sign_showed := defaults.is_positive_sign_showed
			is_negative_sign_showed := defaults.is_negative_sign_showed
			def_thousand_separator (defaults.thousand_separator)
			is_zero_showed := defaults.is_zero_showed
			is_thousand_separator_showed := defaults.is_thousand_separator_showed
			is_zero_prefixed := defaults.is_zero_prefixed
			is_trailing_zero_showed := defaults.is_trailing_zero_showed
			def_decimal_character (defaults.decimal_character)
			no_decimals_filler := defaults.no_decimals_filler
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = defaults.padding_character 
			overflow_character_default: overflow_character = defaults.overflow_character
			prefix_string_default: prefix_string = defaults.prefix_string
			suffix_string_default: suffix_string = defaults.suffix_string
			justification_default: justification = defaults.justification
			size_reduction_default: is_size_reduction_enabled  = defaults.is_size_reduction_enabled
			thousand_separator_default: thousand_separator = defaults.thousand_separator
			is_positive_sign_showed_default: is_positive_sign_showed = defaults.is_positive_sign_showed
			is_negative_sign_showed_default: is_negative_sign_showed = defaults.is_negative_sign_showed
			decimal_character_default: decimal_character = defaults.decimal_character
			is_zero_showed_default: is_zero_showed = defaults.is_zero_showed
			is_thousand_separator_showed_default: is_thousand_separator_showed = defaults.is_thousand_separator_showed
			is_trailing_zero_showed_default: is_trailing_zero_showed = defaults.is_trailing_zero_showed
			is_zero_prefixed_default: is_zero_prefixed = defaults.is_zero_prefixed
			no_decimals_filler_default: no_decimals_filler = defaults.no_decimals_filler
		end
			
feature -- Status report

	is_trailing_zero_showed: BOOLEAN
			-- Are trailing zeros in fractional part showed.

	decimal_character: CHARACTER
			-- Character for begin of fractional part?

	defaults: EFMT_MONEY_FORMATTER is
			-- Shared default options for money formatters.
		once
			!!Result.make (10)
			Result.def_padding_character (' ')
			Result.def_overflow_character ('*')	
			Result.def_prefix_string (Void)
			Result.def_suffix_string (Void)
			Result.right_justify
			Result.disable_size_reduction
			Result.def_thousand_separator (',')
			Result.hide_positive_sign
			Result.show_negative_sign
			Result.show_zero
			Result.disable_zero_prefix
			Result.show_thousand_separator
			Result.def_decimal_character ('.')
			Result.show_trailing_zero
			Result.def_no_decimals_filler (Void)	
		end

	no_decimals_filler: STRING
			-- Filler when precision = 1
			-- e.g : if filler = "-" and amount = 12 then format = "12,-"
	
feature -- Status setting

	hide_trailing_zero is
			-- Don't show trailing zeros in the fractional part.
		do
			is_trailing_zero_showed := False		
		ensure
			not_is_trailing_showed: not is_trailing_zero_showed
		end

	show_trailing_zero is 
			-- Show the trailing zeroes in the fractional part.
		do
			is_trailing_zero_showed := True
		ensure
			is_trailing_zero_showed: is_trailing_zero_showed
		end

	def_decimal_character (a_character: CHARACTER) is
			-- Define decimal character with `a_character'.
		do
			decimal_character := a_character
		ensure
			decimal_character_copied: decimal_character = a_character
		end

	def_no_decimals_filler (a_string: STRING) is
			-- Define the filler after the decimal point for a precision = 1.
		do
			no_decimals_filler := a_string
		ensure
			no_decimals_filler_defined: no_decimals_filler = a_string
		end

feature -- Basic operations


	format (a_money: EMO_MONEY) is
			-- String format of `a_money'.
		local
			last_formatted_estring: ESTRING
			estring: ESTRING
			double_value: DOUBLE
			index_of_units: INTEGER
			sign: INTEGER
			i,j: INTEGER
		do
			!!last_formatted.make (width)
			!!last_formatted_estring.make_from_string (last_formatted)

			if a_money /= Void then
				double_value := a_money.to_double

				sign := double_value.sign
	
				if double_value /= 0.0 or is_zero_showed then
	
					double_value := double_value.abs

					--| format with a units part and a fractional part separated with a dot.
					!!estring.make_from_string (double_value.out)
					last_formatted_estring.append_string (estring)

					--| Truncate trailing zeros after precision.
					if last_formatted_estring.has ('.') then
						index_of_units := last_formatted_estring.index_of ('.', 1) - 1
						last_formatted_estring.prune_all_trailing_after_index ('0', index_of_units + a_money.currency.decimals + 1)
					else
						index_of_units := last_formatted_estring.count
					end

					if not is_trailing_zero_showed and last_formatted_estring.has ('.') then
						--| Prune trailing zeros.
						last_formatted_estring.prune_all_trailing ('0')
					end

					if not last_formatted_estring.is_empty and then last_formatted_estring.item (last_formatted_estring.count) = '.' then
						--| Remove trailing decimal point.
						last_formatted_estring.remove (last_formatted_estring.count)
					end

					if last_formatted_estring.has ('.') and decimal_character /= '.' then
						--| Replace decimal point with decimal_character.
						last_formatted_estring.put (decimal_character, last_formatted_estring.index_of ('.', 1))
					end

					if is_thousand_separator_showed and not (is_size_reduction_enabled and last_formatted.count >= width) then
						--| Insert thousand separators
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


					if a_money.currency.precision = 1 and no_decimals_filler /= Void  and not last_formatted_estring.has (decimal_character) and not (is_size_reduction_enabled and last_formatted.count >= width) then
						last_formatted_estring.append_character (decimal_character)
						last_formatted.append_string (no_decimals_filler)
					end 

					format_zero_prefix (sign)

					format_sign (sign)
					
					format_prefix
					format_suffix 	
			
					if last_formatted_estring.count > width then
						handle_overflow
					end
				end
			end
			justify
		end

end -- class EFMT_MONEY_FORMATTER
