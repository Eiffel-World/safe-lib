indexing
	description: "Widget that let you edit a DATE in a single line of text"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:15:23 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_DATE_ENTRY

inherit
	ECTK_ENTRY [DT_DATE]
		rename
			make as make_ectk_entry
		redefine
			display_formatter, 
			edit_formatter,
			define_display_formatter,
			define_edit_formatter
		end

creation
	make


feature {NONE} -- Initilization.

	make (parent: CURSES_WINDOW; a_height, a_width, y, x: INTEGER) is
			-- Make with origin coordinates relative to parent.
		require
			window_exists: parent /= void;
			positive_size: a_width >= 0 and a_height >= 0;
			positive_origin: x >= 0 and y >= 0;
			inside_parent_size: parent.width >= a_width and parent.height >= a_height;
			width_in_parent: parent.width >= a_width + x;
			height_in_parent: parent.height >= a_height + y
		do
			make_ectk_entry (parent, a_height, a_width, y, x)

			!EFMT_DATE_FORMATTER!display_formatter.make (window.width)

			!EFMT_DATE_FORMATTER!edit_formatter.make (window.width)
			edit_formatter.no_justify
			edit_formatter.enable_size_reduction
			edit_formatter.def_prefix_string (Void)
			edit_formatter.def_suffix_string (Void)

			!ESC_DATE_SCANNER!scanner.make
		ensure
			display_formatter_width: display_formatter.width = window.width
			edit_formatter_width: edit_formatter.width = window.width
			edit_formatter_is_not_justified: edit_formatter.is_not_justified
			edit_formatter_is_size_reduction_enabled: edit_formatter.is_size_reduction_enabled
			edit_formatter_prefix_string_void: edit_formatter.prefix_string = Void
			edit_formatter_suffix_string_void: edit_formatter.suffix_string = Void
		end

feature -- Status report

	display_formatter: EFMT_DATE_FORMATTER
			-- Formatter for displaying.

	edit_formatter: EFMT_DATE_FORMATTER
			-- Formatter for editing.

feature -- Status setting

	define_display_formatter (a_formatter: EFMT_DATE_FORMATTER) is
			-- Define display_formatter with `a_formattter'.
		do
			display_formatter := a_formatter
		end

	define_edit_formatter (a_formatter: EFMT_DATE_FORMATTER) is
			-- Define edit_formatter with `a_formattter'.
		do
			edit_formatter := a_formatter
		end

end -- class ECTK_DATE_ENTRY


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
