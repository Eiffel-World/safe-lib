indexing
	description: "Objects that formats CURRENCY objects"
	author: "Fafchamps eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

class
	EFMT_CURRENCY_FORMATTER

inherit
	EFMT_FORMATTER [EMO_CURRENCY]

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
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = defaults.padding_character 
			overflow_character_default: overflow_character = defaults.overflow_character
			prefix_string_default: prefix_string = defaults.prefix_string
			suffix_string_default: suffix_string = defaults.suffix_string
			justification_default: justification = defaults.justification
			size_reduction_default: is_size_reduction_enabled  = defaults.is_size_reduction_enabled
		end

feature -- Status report

	defaults: EFMT_STRING_FORMATTER is
			-- Shared default options for string formatters.
		once
			!!Result.make (10)
			Result.def_padding_character (' ')
			Result.def_overflow_character ('*')	
			Result.def_prefix_string (Void)
			Result.def_suffix_string (Void)
			Result.left_justify
			Result.disable_size_reduction
		end

feature -- Basic operations

	format (a_currency: EMO_CURRENCY) is
			-- Format `a_string'.
		local
			estring: ESTRING
		do
			!!last_formatted.make (width)

			if a_currency /= Void then
				last_formatted.append_string (a_currency.identifier)
				!!estring.make_from_string (last_formatted)
				format_prefix
				format_suffix
				if last_formatted.count > width then
					handle_overflow
				end
			end
			justify
		end


end -- class EFMT_CURRENCY_FORMATTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
