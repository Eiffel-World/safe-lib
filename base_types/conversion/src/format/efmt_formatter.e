indexing
	description: "Objects that formats other objects"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

deferred class
	EFMT_FORMATTER [G]

feature -- Access

	last_formatted: STRING
			-- Last formatted object.

	width: INTEGER
			-- Maximum allowed width of formatted string.


feature -- Status report

	prefix_string: STRING
			-- Prefix string prepended to the formatted string.
	
	suffix_string: STRING
			-- Suffix string appended to the formatted string.

	padding_character: CHARACTER
			-- Padding character for justification.

	overflow_character: CHARACTER
			-- Character used to indicate an overflow.

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

	is_size_reduction_enabled: BOOLEAN
			-- Is a size reduction tried when an overflow occurs.
			-- e.g : if width = 8: 100,145.3 will be reduced to 100145.3

	successful: BOOLEAN is
			-- Is the last format successful?
		local
			estring: ESTRING
		do
			!!estring.make_from_string (last_formatted)
			Result := (estring.occurrences (overflow_character) /= estring.count)
		end

feature -- Status setting

	def_prefix_string (a_prefix: STRING) is
			-- Define prefix_string with `a_prefix'.
		do
			prefix_string := a_prefix
		ensure
			shared_prefix: prefix_string = a_prefix
		end

	def_suffix_string (a_suffix: STRING) is
			-- Define suffix_string with `a_suffix'.
		do
			suffix_string := a_suffix
		ensure
			shared_suffix: suffix_string = a_suffix
		end

	def_padding_character (a_character: CHARACTER) is
			-- Define padding_character with ´a_character'.
		do
			padding_character := a_character
		ensure
			padding_character_copied: padding_character = a_character
		end

	def_overflow_character (a_character: CHARACTER) is
			-- Define overflow_character with `a_character'.
		do
			overflow_character := a_character
		ensure
			overflow_character_copied: overflow_character = a_character
		end

	def_width (a_width: INTEGER) is
			-- Define width with `a_width'.
		require
			a_width_strict_positif: a_width > 0
		do
			width := a_width
		ensure
			width_copied: width = a_width
		end

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

	enable_size_reduction is
			-- Enable the size reduction trial on overflow.
		do	
			is_size_reduction_enabled := True			
		ensure
			is_size_reduction_enabled : is_size_reduction_enabled
		end

	disable_size_reduction is
			-- Disable the size reduction trial on overflow.
		do
			is_size_reduction_enabled := False
		ensure
			not_is_size_reduction_enabled : not is_size_reduction_enabled
		end

feature -- Basic operations

	format (an_object: G) is
			-- Format `an_object'.
		deferred
		ensure
			justified_implies_count_equal_width: not is_not_justified implies last_formatted.count = width
			within_width: last_formatted.count <= width
			padding_character_on_void: an_object = Void implies (last_formatted.occurrences (padding_character) = last_formatted.count)
		end


feature {NONE} -- Implementation

	justify is
			-- Justify last_formatted.
		require
			last_formatted /= Void
		local
			estring: ESTRING
		do
			!!estring.make_from_string (last_formatted)
			inspect justification
			when left_justification then
				estring.extend_to_count (padding_character, width)
			when center_justification then
				estring.center_to_count (padding_character, width)
			when right_justification then
				estring.prepend_to_count (padding_character, width)
			when no_justification then
				--| nothing to do	
			end
		end

	handle_overflow is
			-- Fill last_formatted with the overflow character.
		require
			last_formatted /= Void
		local 
			estring: ESTRING
		do
			!!estring.make_from_string (last_formatted)
			estring.wipe_out
			estring.extend_to_count (overflow_character, width)
		end


	format_prefix is
			-- Prepend last_formatted with the prefix_string.
		require
			last_formatted /= Void
		local
			prefix_estring: ESTRING
			last_formatted_estring: ESTRING
		do
			if prefix_string /= Void and then not (is_size_reduction_enabled and last_formatted.count + prefix_string.count > width) then
				!!prefix_estring.make_from_string (prefix_string)
				!!last_formatted_estring.make_from_string (last_formatted)
				last_formatted_estring.prepend_string (prefix_estring)
			end
		end

	format_suffix is
			-- Append last_formatted with the suffix_string.
		require
			last_formatted /= Void
		local
			suffix_estring: ESTRING
			last_formatted_estring: ESTRING
		do
			if suffix_string /= Void and then not (is_size_reduction_enabled and last_formatted.count + suffix_string.count > width) then
				!!suffix_estring.make_from_string (suffix_string)
				!!last_formatted_estring.make_from_string (last_formatted)
				last_formatted_estring.append_string (suffix_estring)
			end
		end
		

	No_justification: INTEGER is 0

	Left_justification: INTEGER is 1

	Center_justification: INTEGER is 2

	Right_justification: INTEGER is 3

feature {EFMT_FORMATTER} -- Implementation

	justification: INTEGER
	
	
invariant
	width_strict_positif: width > 0
	justified: is_left_justified xor is_right_justified xor is_center_justified xor is_not_justified

end -- class EFMT_FORMATTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
