indexing
	description: "Objects that formats objects of type G on multiple lines"

	usage: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2004/12/19 11:49:51 $";
	revision: "$Revision: 1.2 $";
	author: "Fafchamps Eric"

deferred class
	FM_MULTI_LINE_FORMAT [G]

inherit
	ANY
		redefine
			is_equal,
			copy
		end

feature {NONE} -- Initialization

feature -- Access

	left_margin_width: INTEGER
			-- Width of left margin.

	right_margin_width: INTEGER
			-- Width of right margin.

	width: INTEGER
			-- Maximum allowed width.

	void_text : TEXT
			-- Text representation for Void.

feature -- Measurement

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result :=
			left_margin_width = other.left_margin_width and
			right_margin_width = other.right_margin_width and
			width = other.width and
			is_word_wrapped = other.is_word_wrapped and
			equal (void_text, other.void_text)
		end

feature -- Status report

	is_word_wrapped: BOOLEAN
			-- Is word wrapped?

feature -- Status setting

	enable_word_wrapping is
			-- Enable word wrapping.
		do
			is_word_wrapped := True
		ensure
			is_word_wrapped: is_word_wrapped
		end

	disable_word_wrapping is
			-- Disable word wrapping.
		do
			is_word_wrapped := False
		ensure
			is_word_wrapped: not is_word_wrapped
		end

feature -- Cursor movement

feature -- Element change

	set_void_text (a_text : TEXT) is
			-- Set text representation for Void with `a_text'.
		do
			void_text := clone (a_text)
		ensure
			void_text_copied : equal (void_text, a_text) and (a_text /= Void implies void_text /= a_text)
		end

	set_left_margin_width (a_width: INTEGER) is
			-- Set left_margin_width with `a_width'.
		require
			valid_width: a_width >= 0 and (a_width < width - right_margin_width)
		do
			left_margin_width := a_width
		ensure
			left_margin_width_copied: left_margin_width = a_width
		end

	set_right_margin_width (a_width: INTEGER) is
			-- Set right_margin_width with `a_width'.
		require
			valid_width: a_width >= 0 and (a_width < width - left_margin_width)
		do
			right_margin_width := a_width
		ensure
			right_margin_width_copied: right_margin_width = a_width
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
			set_void_text (other.void_text)
		end

feature -- Miscellaneous

feature -- Basic operations

	formatted (an_object: G): TEXT is
			-- Result of formatting `an_object'.
		deferred
		ensure
			result_defined: Result /= Void
			width: Result.maximum_paragraph_size <= width			
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	available_width: INTEGER is
			-- Available width for the paragraph.
		do
			Result := width - right_margin_width - left_margin_width
		ensure
			Result = (width - right_margin_width - left_margin_width)
		end

invariant
	strict_positif_width: width > 0
	valid_margins: left_margin_width >= 0 and right_margin_width >= 0 and left_margin_width + right_margin_width < width

end -- class FM_MULTI_LINE_FORMAT

--
-- Copyright: 2000-2004, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
