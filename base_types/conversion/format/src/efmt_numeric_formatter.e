indexing
	description: "Objects that formats numeric objects"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 08:24:45 $"
	revision: "$Revision: 1.2 $"

deferred class
	EFMT_NUMERIC_FORMATTER [G]

inherit
	EFMT_FORMATTER [G]

feature -- Status report

	is_zero_prefixed: BOOLEAN
			-- Is the value prefixed with zeros until the width is reached?

	is_zero_showed: BOOLEAN
			-- Is zero integer value showed?

	is_positive_sign_showed: BOOLEAN
			-- Is the positive sign showed?

	is_negative_sign_showed: BOOLEAN
			-- Is the negative sign showed?

	is_thousand_separator_showed: BOOLEAN
			-- Is the thousand separator showed?

	thousand_separator: CHARACTER
			-- Thousand separator

feature -- Status setting

	show_zero is
			-- Show zero integer value.
		do
			is_zero_showed := True
		ensure
			is_zero_showed: is_zero_showed
		end

	show_positive_sign is
			-- Show positive sign.
		do
			is_positive_sign_showed := True
		ensure
			is_positive_sign_showed: is_positive_sign_showed
		end

	hide_positive_sign is
			-- Hide positive sign.
		do
			is_positive_sign_showed := False
		ensure
			not_is_positive_sign_showed: not is_positive_sign_showed
		end

	show_negative_sign is
			-- Show negative sign.
		do
			is_negative_sign_showed := True
		ensure
			is_negative_sign_showed: is_negative_sign_showed
		end

	hide_negative_sign is
			-- Hide negative sign.
		do
			is_negative_sign_showed := False
		ensure
			not_is_negative_sign_showed: not is_negative_sign_showed
		end

	hide_zero is
			-- Hide zero integer value.
		do
			is_zero_showed := False
		ensure
			not_is_zero_showed : not is_zero_showed
		end
			
	enable_zero_prefix is
			-- Prefix the value with zeros until the width is reached.
		do
			is_zero_prefixed := True
		ensure
			is_zero_prefixed: is_zero_prefixed
		end

	disable_zero_prefix is
			-- Don't prefix the value with zeros.
		do
			is_zero_prefixed := False
		ensure
			not_is_zero_prefixed: not is_zero_prefixed
		end

	show_thousand_separator is
			-- Show thousand separator.
		do
			is_thousand_separator_showed := True
		ensure
			is_thousand_separator_showed: is_thousand_separator_showed
		end

	hide_thousand_separator is
			-- Hide thousand separator.
		do
			is_thousand_separator_showed := False
		ensure
			not_is_thousand_separator_showed: not is_thousand_separator_showed
		end
	
	def_thousand_separator (a_character: CHARACTER) is
			-- Define thousand separator with `a_character'.
		do
			thousand_separator := a_character
		ensure
			thousand_separator_copied: thousand_separator = a_character
		end


feature {NONE} -- Implementation

	format_sign (a_sign: INTEGER) is
			-- Format `a_sign' in last_formatted.
		local
			last_formatted_estring: ESTRING
		do
			!!last_formatted_estring.make_from_string (last_formatted)
			if a_sign = -1 and is_negative_sign_showed then
				last_formatted_estring.insert_character ('-', 1)
			else 
				if a_sign = 1 and is_positive_sign_showed then
					last_formatted_estring.insert_character ('+', 1)
				end
			end
		end


	format_zero_prefix (a_sign: INTEGER) is
			-- If needed prepend with zeros while leaving enough space for sign, prefix_string and suffix_string.
		local
			space_left: INTEGER
			last_formatted_estring: ESTRING
		do
			if is_zero_prefixed and not (is_size_reduction_enabled and last_formatted.count >= width) then
				!!last_formatted_estring.make_from_string (last_formatted)
				space_left := width - last_formatted_estring.count
				if a_sign = 1 and is_positive_sign_showed then
					space_left := space_left - 1
				end
				if a_sign = -1 and is_negative_sign_showed then
					space_left := space_left - 1
				end
				if prefix_string /= Void then
					space_left := space_left - prefix_string.count
				end
				if suffix_string /= Void then
					space_left := space_left - suffix_string.count
				end

				if space_left > 0 then
					last_formatted_estring.prepend_to_count ('0', last_formatted_estring.count + space_left)
				end
			end
		end

end -- class EFMT_NUMERIC_FORMATTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
