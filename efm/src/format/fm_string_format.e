indexing
	description: "Objects that formats STRING objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/03/08 19:24:18 $";
	revision: "$Revision: 1.6 $";
	author: "Fafchamps eric"

class
	FM_STRING_FORMAT

inherit
	FM_SINGLE_LINE_FORMAT [STRING]
		redefine
			is_equal,
			copy
		end
		
creation
	make, make_default

feature {NONE} -- Initialization.

	make (a_width: INTEGER) is
			-- Initialize with `a_width'.
		require
			a_width_strictly_positive: a_width > 0
		do
			width := a_width
			set_padding_character (shared_default_format.padding_character)
			set_padding_character_for_empty_string (shared_default_format.padding_character_for_empty_string)
			set_string_for_empty_string (shared_default_format.string_for_empty_string)
			set_prefix_string (shared_default_format.prefix_string)
			set_suffix_string (shared_default_format.suffix_string)
			justification := shared_default_format.justification
			insufficient_width_handler := shared_default_format.insufficient_width_handler
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			padding_character_for_empty_string_default: padding_character_for_empty_string = shared_default_format.padding_character_for_empty_string
			string_for_empty_string: equal (string_for_empty_string, shared_default_format.string_for_empty_string)
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			justification_default: justification = shared_default_format.justification
			insufficient_width_handler_default: insufficient_width_handler = shared_default_format.insufficient_width_handler
		end


		make_default is
				-- Make with default values.
				-- (used for the initialization of the shared_default_format)
			do
				width := 1
				set_padding_character (' ')
				set_padding_character_for_empty_string (' ')
				set_string_for_empty_string (Void)
				set_prefix_string (Void)
				set_suffix_string (Void)
				left_justify
				create insufficient_width_handler
			ensure
				width_is_1: width = 1
				padding_character_is_blank: padding_character.is_equal (' ')
				string_for_empty_string_is_void: string_for_empty_string = Void
				prefix_string_is_void : prefix_string = Void
				suffix_string_is_void : suffix_string = Void
				is_left_justified : is_left_justified
			end

feature {NONE} -- Initialization

feature -- Access

	shared_default_format: FM_STRING_FORMAT is
			-- Shared default options for format.
		once
			create Result.make_default
		end

	padding_character_for_empty_string: CHARACTER
			-- Padding character for empty string.

	string_for_empty_string: STRING
			-- Format string for empty string.

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := precursor (other) and equal (string_for_empty_string, other.string_for_empty_string)
		ensure then
			definition: Result implies equal (string_for_empty_string, other.string_for_empty_string)
		end

feature -- Status report

	can_format (a_string: STRING) : BOOLEAN is
			-- Can `a_string be' formatted by `Current'?
		do
			Result := a_string /= Void and then not a_string.has('%N')
		ensure then
			has_not_new_lines: Result = (a_string /= Void and then not a_string.has('%N'))
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_padding_character_for_empty_string (a_character: CHARACTER) is
			-- Set padding_character for empty string with `a_character'.
		do
			padding_character_for_empty_string := a_character
		ensure
			padding_character_copied: padding_character_for_empty_string = a_character
		end

	set_string_for_empty_string (a_string : STRING) is
			-- Set format string for empty string with `a_string'.
		do
			string_for_empty_string := clone (a_string)
		ensure
			string_copied: equal (string_for_empty_string, a_string) and (a_string /= Void implies string_for_empty_string /= a_string)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

	copy (other: like Current) is
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
		do
			precursor (other)
			set_string_for_empty_string (other.string_for_empty_string)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_string: STRING): STRING is
			-- Result of formatting `a_string'.
		do
			create last_formatted.make (width)

			if a_string.is_empty then
				if string_for_empty_string /= Void then
					last_formatted.append_string (string_for_empty_string)
				end
				format_prefix
				format_suffix
				if last_formatted.count > width then
					last_formatted := insufficient_width_handler.string_with_valid_width (a_string, Current)
				end
				justify (padding_character_for_empty_string)
			else
				last_formatted.append_string (a_string)
				format_prefix
				format_suffix
				if last_formatted.count > width then
					last_formatted := insufficient_width_handler.string_with_valid_width (a_string, Current)
				end
				justify (padding_character)
			end
			Result := last_formatted
		ensure then
			string_for_empty_string: (a_string.is_empty and string_for_empty_string /= Void) implies Result.has_substring (string_for_empty_string)
			padding_character_for_empty_string: (a_string.is_empty and string_for_empty_string = Void and is_justified and prefix_string = Void and suffix_string = Void) implies Result.occurrences (padding_character_for_empty_string) = width
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class FM_STRING_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

