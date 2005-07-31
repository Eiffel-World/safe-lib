indexing
	description: "Objects that formats INTEGER objects"
	
	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/07/31 18:22:28 $";
	revision: "$Revision: 1.3 $";
	author: "Fafchamps eric"

class
	FM_INTEGER_FORMAT

inherit
	FM_NUMERIC_FORMAT [INTEGER_REF]

creation
	make, make_default

feature {NONE} -- Initialization.

		make (a_width: INTEGER) is
				-- Initialize with `a_width' and the shared_default_format.
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
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
			insufficient_width_handler := shared_default_format.insufficient_width_handler
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			void_string_default: equal (void_string, shared_default_format.void_string)
			justification_default: justification = shared_default_format.justification
			is_positive_sign_shown_default: is_positive_sign_shown = shared_default_format.is_positive_sign_shown
			is_negative_sign_shown_default: is_negative_sign_shown = shared_default_format.is_negative_sign_shown
			thousand_separator_default: thousand_separator = shared_default_format.thousand_separator
			is_zero_shown_default: is_zero_shown = shared_default_format.is_zero_shown
			is_thousand_separator_shown_default: is_thousand_separator_shown = shared_default_format.is_thousand_separator_shown
			is_zero_prefix_enabled_default: is_zero_prefix_enabled = shared_default_format.is_zero_prefix_enabled
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
				set_void_string (Void)				
				right_justify
				set_thousand_separator (',')
				hide_positive_sign
				show_negative_sign
				show_zero
				disable_zero_prefix
				show_thousand_separator
				create insufficient_width_handler
			ensure
				width_is_1 : width = 1
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
			end

feature -- Access

	shared_default_format: FM_INTEGER_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		ensure
			defined: Result /= Void
		end

feature -- Measurement

feature -- Comparison

feature -- Status report

	can_format (an_integer: INTEGER_REF) : BOOLEAN is
			-- Can `an_integer' be formatted by `Current'?
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

	formatted (an_integer: INTEGER_REF): STRING is
			-- Result of formatting `an_integer'.
		local
			estring: ESTRING
			last_formatted_estring: ESTRING
			i,j: INTEGER
			sign: INTEGER
		do
			create last_formatted.make (width)
			create last_formatted_estring.make_from_string (last_formatted)


			if an_integer /= Void and then (an_integer.item /= 0 or is_zero_shown) then
				sign := an_integer.sign

				create estring.make_from_string (an_integer.abs.out)
				last_formatted_estring.append_string (estring)

				if is_thousand_separator_shown then

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
					last_formatted := insufficient_width_handler.string_with_valid_width (an_integer, Current)
				end				
			else
				if void_string /= Void then
					last_formatted.copy (void_string)
				end
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			thousand_separator: an_integer /= Void implies (an_integer >= 1000 and is_thousand_separator_shown implies Result.has (thousand_separator))
			zero_shown: an_integer /= Void implies (an_integer = 0 and is_zero_shown implies Result.has ('0'))
			positive_sign_shown: an_integer /= Void implies (an_integer > 0 and is_positive_sign_shown implies Result.has ('+'))
			negative_sign_shown: an_integer /= Void implies (an_integer < 0 and is_negative_sign_shown implies Result.has ('-'))
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class CLASS_TEMPLATE

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
