indexing
	description: "Objects that formats STRING objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/19 11:49:51 $";
	revision: "$Revision: 1.2 $";
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
			set_void_string (shared_default_format.void_string)			
			justification := shared_default_format.justification
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			padding_character_for_empty_string_default: padding_character_for_empty_string = shared_default_format.padding_character_for_empty_string
			string_for_empty_string: equal (string_for_empty_string, shared_default_format.string_for_empty_string)
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			void_string_default: equal (void_string, shared_default_format.void_string)
			justification_default: justification = shared_default_format.justification
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
				set_void_string (Void)				
				left_justify
			ensure
				width_is_1: width = 1
				padding_character_is_blank: padding_character.is_equal (' ')
				string_for_empty_string_is_void: string_for_empty_string = Void
				prefix_string_is_void : prefix_string = Void
				suffix_string_is_void : suffix_string = Void
				void_string_is_void : void_string = Void
				is_left_justified : is_left_justified
			end

feature {NONE} -- Initialization

feature -- Access

	shared_default_format: FM_STRING_FORMAT is
			-- Shared default options for format.
		once
			Create Result.make_default
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
			Result := 
			precursor (other) and
			equal (string_for_empty_string, other.string_for_empty_string)
		end

feature -- Status report

	can_format (a_string: STRING) : BOOLEAN is
			-- Can `a_string be' formatted by `Current'?
		do
			Result := a_string = Void or else not a_string.has('%N')
		ensure then
			has_not_new_lines: Result = (a_string = Void or else not a_string.has('%N'))
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
			Precursor (other)
			set_string_for_empty_string (other.string_for_empty_string)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_string: STRING): STRING is
			-- Result of formatting `a_string'.
		do
			!!last_formatted.make (width)

			if a_string /= Void then
				if a_string.is_empty then
					if string_for_empty_string /= Void then
						last_formatted.append_string (string_for_empty_string)
						justify (padding_character)
					else
						justify (padding_character_for_empty_string)
					end					
				else
					last_formatted.append_string (a_string)
					format_prefix
					format_suffix
					if last_formatted.count > width then
						handle_insufficient_width (a_string)
					end
					justify (padding_character)
				end
			else
				if void_string /= Void then
					last_formatted.copy (void_string)
				end
				justify (padding_character)
			end
			Result := last_formatted
		ensure then
			string_for_empty_string: (a_string /= Void and a_string.is_empty and string_for_empty_string /= Void) implies Result.has_substring (string_for_empty_string)
			padding_character_for_empty_string: (a_string /= Void and a_string.is_empty and string_for_empty_string = Void and is_justified) implies Result.occurrences (padding_character_for_empty_string) = width
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class FM_STRING_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

