indexing
	description: "Objects that formats BOOLEAN objects"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2007/11/15 10:01:57 $";
	revision: "$Revision: 1.6 $";
	author: "Fafchamps eric"

class
	FM_BOOLEAN_FORMAT

inherit
	FM_SINGLE_LINE_FORMAT [BOOLEAN]
		redefine
			is_equal,
			copy
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
			set_true_string (shared_default_format.true_string)
			set_false_string (shared_default_format.false_string)
			insufficient_width_handler := shared_default_format.insufficient_width_handler
		ensure
			width_copied: width = a_width
			padding_character_default: padding_character = shared_default_format.padding_character 
			prefix_string_default: equal (prefix_string, shared_default_format.prefix_string)
			suffix_string_default: equal (suffix_string, shared_default_format.suffix_string)
			justification_default: justification = shared_default_format.justification
			true_string_default: equal (true_string, shared_default_format.true_string)
			false_string_default: equal (false_string, shared_default_format.false_string)
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
				set_true_string ("1")
				set_false_string ("0")
				center_justify
				create insufficient_width_handler
			ensure
				width_is_1: width = 1
				padding_character_is_blank: padding_character.is_equal (' ')
				prefix_string_is_void: prefix_string = Void
				suffix_string_is_void: suffix_string = Void
				true_string_is_1: true_string.is_equal ("1")
				false_string_is_0: false_string.is_equal ("0")
				is_center_justified: is_center_justified
			end

feature {NONE} -- Initialization

feature -- Access

	true_string: STRING
			-- String representation for True value.
			
	false_string: STRING
			-- String representation for False value.

	shared_default_format: FM_BOOLEAN_FORMAT is
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
				equal (true_string, other.true_string) and
				equal (false_string, other.false_string)
		ensure then
			definition: Result implies 
						equal (true_string, other.true_string) and
						equal (false_string, other.false_string)
		end

feature -- Status report

	can_format (a_boolean: BOOLEAN): BOOLEAN is
			-- Can `a_boolean' be formatted by `Current'?
		do
			Result := True
		ensure then
			is_true: Result = True
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_true_string (a_string: STRING) is
			-- Set string representation of True value with `a_string'.
		require
			a_string_defined: a_string /= Void
		do
			true_string := clone (a_string)
		ensure
			true_string_copied: equal (true_string, a_string) and true_string /= a_string
		end

	set_false_string (a_string: STRING) is
			-- Set string representation of false value with `a_string'.
		require
			a_string_defined: a_string /= Void
		do
			false_string := clone (a_string)
		ensure
			false_string_shared: equal (false_string, a_string) and false_string /= a_string
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
			last_formatted := clone (other.last_formatted)
			set_false_string (other.false_string)
			set_true_string (other.true_string)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (a_boolean: BOOLEAN): STRING is
			-- Result of formatting `a_boolean'.
		do
			create last_formatted.make (width)			
			if a_boolean.item = True then
				last_formatted.append_string (true_string)
			else
				last_formatted.append_string (false_string)
			end	
			format_prefix 
			format_suffix
	
			if last_formatted.count > width then
				last_formatted := insufficient_width_handler.string_with_valid_width (a_boolean, Current)
			end
			justify (padding_character)
			Result := last_formatted
		ensure then
			true_string: (a_boolean.item = True) implies Result.has_substring (true_string)
			false_string: (a_boolean.item = False) implies Result.has_substring (false_string)
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

end -- class FM_BOOLEAN_FORMAT

--
-- Copyright (c) 2000-2006, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
