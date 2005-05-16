indexing
	description: "Objects that formats numeric objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/05/16 18:03:44 $";
	revision: "$Revision: 1.2 $";
	author: "Fafchamps Eric"

deferred class
	FM_NUMERIC_FORMAT [G]

inherit
	FM_SINGLE_LINE_FORMAT [G]
		redefine
			is_equal
		end
		
feature {NONE} -- Initialization

feature -- Access

	thousand_separator: CHARACTER
			-- Thousand separator

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := 
			precursor (other) and
			equal (is_negative_sign_shown, other.is_negative_sign_shown) and
			equal (is_positive_sign_shown, other.is_positive_sign_shown) and
			equal (is_thousand_separator_shown, other.is_thousand_separator_shown) and
			equal (is_zero_prefix_enabled, other.is_zero_prefix_enabled) and
			equal (is_zero_shown, other.is_zero_shown) and			
			equal (thousand_separator, other.thousand_separator)
		end

feature -- Status report

	is_zero_prefix_enabled: BOOLEAN
			-- Is the numeric prefixed with zeros?

	is_zero_prefix_disabled : BOOLEAN is
			-- The numeric will not be prefixed with zeros?
		do
			Result := not is_zero_prefix_enabled	
		end
		
	is_zero_shown: BOOLEAN
			-- Is zero value shown?

	is_zero_hidden: BOOLEAN is
			-- Is zero value hidden?
		do
			Result := not is_zero_shown
		end

	is_positive_sign_shown: BOOLEAN
			-- Is the positive sign shown?
			
	is_positive_sign_hidden: BOOLEAN is
			-- Is the positive sign hidden?
		do
			Result := not is_positive_sign_shown
		end

	is_negative_sign_shown: BOOLEAN
			-- Is the negative sign shown?

	is_negative_sign_hidden: BOOLEAN is
			-- Is the negative sign hidden?
		do
			Result := not is_negative_sign_shown
		end

	is_thousand_separator_shown: BOOLEAN
			-- Is the thousand separator shown?

	is_thousand_separator_hidden: BOOLEAN is
			-- Is the thousand separator hidden?
		do
			Result := not is_thousand_separator_shown
		end

feature -- Status setting

	show_zero is
			-- Show zero integer value.
		do
			is_zero_shown := True
		ensure
			is_zero_shown: is_zero_shown
		end

	show_positive_sign is
			-- Show positive sign.
		do
			is_positive_sign_shown := True
		ensure
			is_positive_sign_shown: is_positive_sign_shown
		end

	hide_positive_sign is
			-- Hide positive sign.
		do
			is_positive_sign_shown := False
		ensure
			is_positive_sign_hidden: is_positive_sign_hidden
		end

	show_negative_sign is
			-- Show negative sign.
		do
			is_negative_sign_shown := True
		ensure
			is_negative_sign_shown: is_negative_sign_shown
		end

	hide_negative_sign is
			-- Hide negative sign.
		do
			is_negative_sign_shown := False
		ensure
			is_negative_sign_hidden: is_negative_sign_hidden
		end

	hide_zero is
			-- Hide zero integer value.
		do
			is_zero_shown := False
		ensure
			is_zero_hidden : is_zero_hidden
		end
			
	enable_zero_prefix is
			-- Prefix the value with zeros until the width is reached.
		do
			is_zero_prefix_enabled := True
		ensure
			is_zero_prefix_enabled: is_zero_prefix_enabled
		end

	disable_zero_prefix is
			-- Don't prefix the value with zeros.
		do
			is_zero_prefix_enabled := False
		ensure
			is_zero_prefix_disabled: is_zero_prefix_disabled
		end

	show_thousand_separator is
			-- Show thousand separator.
		do
			is_thousand_separator_shown := True
		ensure
			is_thousand_separator_shown: is_thousand_separator_shown
		end

	hide_thousand_separator is
			-- Hide thousand separator.
		do
			is_thousand_separator_shown := False
		ensure
			is_thousand_separator_hidden: is_thousand_separator_hidden
		end

feature -- Cursor movement

feature -- Element change

	set_thousand_separator (a_character: CHARACTER) is
			-- Set thousand separator with `a_character'.
		do
			thousand_separator := a_character
		ensure
			thousand_separator_copied: thousand_separator = a_character
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	format_sign (a_sign: INTEGER) is
			-- Format `a_sign' in last_formatted.
		local
			last_formatted_estring: ESTRING
		do
			create last_formatted_estring.make_from_string (last_formatted)
			if a_sign = -1 and is_negative_sign_shown then
				last_formatted_estring.insert_character ('-', 1)
			else 
				if a_sign = 1 and is_positive_sign_shown then
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
			if is_zero_prefix_enabled then
				create last_formatted_estring.make_from_string (last_formatted)
				space_left := width - last_formatted_estring.count
				if a_sign = 1 and is_positive_sign_shown then
					space_left := space_left - 1
				end
				if a_sign = -1 and is_negative_sign_shown then
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

end -- class FM_NUMERIC_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
