indexing
	description: "Objects that formats INTEGER objects"
	author: "Fafchamps eric"
	date: "$Date: 2001/09/15 08:24:45 $"
	revision: "$Revision: 1.2 $"

class
	EFMT_INTEGER_FORMATTER

inherit
	EFMT_NUMERIC_FORMATTER [INTEGER]

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
			is_positive_sign_showed := defaults.is_positive_sign_showed
			is_negative_sign_showed := defaults.is_negative_sign_showed
			def_thousand_separator (defaults.thousand_separator)
			is_zero_showed := defaults.is_zero_showed
			is_thousand_separator_showed := defaults.is_thousand_separator_showed
			is_zero_prefixed := defaults.is_zero_prefixed
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = defaults.padding_character 
			overflow_character_default: overflow_character = defaults.overflow_character
			prefix_string_default: prefix_string = defaults.prefix_string
			suffix_string_default: suffix_string = defaults.suffix_string
			justification_default: justification = defaults.justification
			size_reduction_default: is_size_reduction_enabled  = defaults.is_size_reduction_enabled
			is_positive_sign_showed_default: is_positive_sign_showed = defaults.is_positive_sign_showed
			is_negative_sign_showed_default: is_negative_sign_showed = defaults.is_negative_sign_showed
			thousand_separator_default: thousand_separator = defaults.thousand_separator
			is_zero_showed_default: is_zero_showed = defaults.is_zero_showed
			is_thousand_separator_showed_default: is_thousand_separator_showed = defaults.is_thousand_separator_showed
			is_zero_prefixed_default: is_zero_prefixed = defaults.is_zero_prefixed
		end

feature -- Status report

	defaults: EFMT_INTEGER_FORMATTER is
			-- Shared default options for integer formatters.
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
		end


feature -- Basic operations

	format (an_integer: INTEGER) is
			-- String format of `an_integer'.
		local
			estring: ESTRING
			last_formatted_estring: ESTRING
			i,j: INTEGER
			sign: INTEGER
		do
			!!last_formatted.make (width)
			!!last_formatted_estring.make_from_string (last_formatted)

			sign := an_integer.sign

			if an_integer /= 0 or is_zero_showed then
				!!estring.make_from_string (an_integer.abs.out)
				last_formatted_estring.append_string (estring)

				if is_thousand_separator_showed and not (is_size_reduction_enabled and last_formatted.count >= width) then
					--| Insert thousand separators
					from
						i := estring.count
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
					handle_overflow
				end
			end
			justify
		end

end -- class EFMT_INTEGER_FORMATTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
