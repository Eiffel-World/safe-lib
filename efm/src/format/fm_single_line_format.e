indexing
	description: "Objects that format objects of type G in a STRING without newline"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/19 11:49:51 $";
	revision: "$Revision: 1.2 $";
	author: "Fafchamps Eric"

deferred class
	FM_SINGLE_LINE_FORMAT [G]

inherit
	ANY
		redefine
			copy,
			is_equal
		end
		
feature {NONE} -- Initialization

feature -- Access

	width: INTEGER
			-- Maximum allowed width.

	void_string: STRING
			-- String representation for Void.

	prefix_string: STRING
			-- String prepended to the Result of formatted.
	
	suffix_string: STRING
			-- String appended to the Result of formatted.

	padding_character: CHARACTER
			-- Padding character for justification.

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result :=
			equal (last_formatted, other.last_formatted) and
			equal (prefix_string, other.prefix_string) and
			equal (suffix_string, other.suffix_string) and
			equal (void_string, other.void_string)
		end

feature -- Status report

	can_format (an_object: G) : BOOLEAN is
			-- Can `an_object' be formatted by `Current'?
		deferred
		end

	is_justified: BOOLEAN is
			-- Is justified.
		do
			Result := is_left_justified or is_center_justified or is_right_justified
		ensure
			is_justified: Result = (is_left_justified or is_center_justified or is_right_justified)
		end

	is_left_justified: BOOLEAN is
			-- Is left justified.
		do
			Result := (justification = Left_justification)
		ensure
			left_justified: Result = (justification = Left_justification)
		end

	is_center_justified: BOOLEAN is
			-- Is center justified.
		do
			Result := (justification = Center_justification)
		ensure
			center_justification: Result = (justification = Center_justification)
		end

	is_right_justified: BOOLEAN is
			-- Is right justified.
		do
			Result := (justification = Right_justification)
		ensure
			right_justification: Result = (justification = Right_justification)
		end

	is_not_justified: BOOLEAN is
			-- Is not justified.
		do
			Result :=  (justification = No_justification)
		ensure
			no_justification: Result = (justification = No_justification)
		end

	is_insufficient_width_error: BOOLEAN
			-- The width was insufficient during the last call to formatted.

feature -- Status setting

	left_justify is
			-- Justify to the left.
		do
			justification := Left_justification
		ensure
			is_left_justified: is_left_justified
		end

	center_justify is
			-- Justify to the center.
		do
			justification := Center_justification
		ensure
			is_center_justified: is_center_justified
		end

	right_justify is
			-- Justify to the right.
		do
			justification := Right_justification
		ensure
			is_right_justified: is_right_justified
		end

	no_justify is
			-- Do not justify.
		do
			justification := No_justification
		ensure
			is_not_justified: is_not_justified
		end

feature -- Cursor movement

feature -- Element change

	set_void_string (a_string: STRING) is
			-- Set string representation for Void with `a_string'.
		require
			a_string_width: a_string /= Void implies a_string.count <= width
		do
			void_string := clone (a_string)
		ensure
			void_string_copied: equal (void_string, a_string) and (a_string /= Void implies void_string /= a_string)
		end

	set_prefix_string (a_prefix: STRING) is
			-- Set prefix with `a_prefix'.
		require
			a_prefix_width: a_prefix /= Void implies a_prefix.count <= width
			a_prefix_suffix_width: (a_prefix /= void and suffix_string /= Void) implies a_prefix.count + suffix_string.count <= width
		do
			prefix_string := clone (a_prefix)
		ensure
			prefix_string_copied: equal (prefix_string, a_prefix) and (a_prefix /= Void implies prefix_string /= a_prefix)
		end

	set_suffix_string (a_suffix: STRING) is
			-- Set suffix with `a_suffix'.
		require
			a_suffix_width: a_suffix /= Void implies a_suffix.count <= width
			a_suffix_prefix_width: (a_suffix /= void and prefix_string /= Void) implies a_suffix.count + prefix_string.count <= width
		do
			suffix_string := clone (a_suffix)
		ensure
			suffix_string_copied: equal (suffix_string, a_suffix) and (a_suffix /= Void implies suffix_string /= a_suffix)
		end

	set_padding_character (a_character: CHARACTER) is
			-- Set padding_character with ´a_character'.
		do
			padding_character := a_character
		ensure
			padding_character_copied: padding_character = a_character
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
			standard_copy (other)
			last_formatted := clone (other.last_formatted)
			set_prefix_string (other.prefix_string)
			set_suffix_string (other.suffix_string)
			set_void_string (other.void_string)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (an_object: G): STRING is
			-- Result of formatting `an_object'.
		require
			can_format: can_format (an_object)
		deferred		
		ensure then
			result_defined: Result /= Void
			no_new_line: not Result.has ('%N')
			within_width: Result.count <= width
			justified_implies_width: is_justified implies Result.count = width
			void_string: (an_object = Void and void_string /= Void) implies (Result.has_substring (void_string))
			has_prefix_string: (not is_insufficient_width_error and an_object /= Void and prefix_string /= Void) implies Result.has_substring (prefix_string)
			left_justified_prefix_string: (not is_insufficient_width_error and an_object /= Void and is_left_justified and prefix_string /= Void) implies (equal (Result.substring (1, prefix_string.count), prefix_string))
			has_suffix_string: (not is_insufficient_width_error and is_right_justified and suffix_string /= Void) implies Result.has_substring (suffix_string)
			right_justified_suffix_string: (not is_insufficient_width_error and is_right_justified and suffix_string /= Void) implies (equal (Result.substring (Result.count - suffix_string.count + 1, Result.count), suffix_string))
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {FM_SINGLE_LINE_FORMAT} -- Implementation

	justification: INTEGER
			-- Justification.
			
	last_formatted: STRING
			-- Last formatted object.

feature {NONE} -- Implementation

	No_justification: INTEGER is 0

	Left_justification: INTEGER is 1

	Center_justification: INTEGER is 2

	Right_justification: INTEGER is 3

	justify (a_padding_character: CHARACTER) is
			-- Justify last_formatted.
		require
			last_formatted /= Void
		local
			estring: ESTRING
		do
			!!estring.make_from_string (last_formatted)
			inspect justification
			when left_justification then
				estring.extend_to_count (a_padding_character, width)
			when center_justification then
				estring.center_to_count (a_padding_character, width)
			when right_justification then
				estring.prepend_to_count (a_padding_character, width)
			when no_justification then
				--| nothing to do	
			end
		end

	handle_insufficient_width (an_object: G) is
			-- Handle the case of having insufficient width to format `an_object'.
		require
			last_formatted /= Void
		local 
			estring: ESTRING
		do
			!!estring.make_from_string (last_formatted)
			estring.wipe_out
			estring.extend_to_count ('*', width)
		ensure
			sufficient_width: last_formatted.count <= width
		end

	format_prefix is
			-- Prepend last_formatted with the prefix.
		require
			last_formatted /= Void
		local
			prefix_estring: ESTRING
			last_formatted_estring: ESTRING
		do
			if prefix_string /= Void then
				!!prefix_estring.make_from_string (prefix_string)
				!!last_formatted_estring.make_from_string (last_formatted)
				last_formatted_estring.prepend_string (prefix_estring)
			end
		end

	format_suffix is
			-- Append last_formatted with the prefix.
		require
			last_formatted /= Void
		local
			suffix_estring: ESTRING
			last_formatted_estring: ESTRING
		do
			if suffix_string /= Void then
				!!suffix_estring.make_from_string (suffix_string)
				!!last_formatted_estring.make_from_string (last_formatted)
				last_formatted_estring.append_string (suffix_estring)
			end
		end

invariant
	width_strictly_positive: width > 0
	exclusif_justification: is_left_justified xor is_right_justified xor is_center_justified xor is_not_justified
	prefix_string_width: prefix_string /= Void implies prefix_string.count <= width
	suffix_width: suffix_string /= Void implies suffix_string.count <= width
	prefix_suffix_width: (prefix_string /= void and suffix_string /= Void) implies prefix_string.count + suffix_string.count <= width
	
end -- class FM_SINGLE_LINE_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

