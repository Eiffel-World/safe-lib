indexing
	description: "Abstraction for a report"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

deferred class
	EREP_REPORT

feature -- Access

	left_margin_width: INTEGER
			-- Width of left margin.
		
	right_margin_width: INTEGER
			-- Width of right margin.
			
	bottom_margin_height: INTEGER
			-- Height of bottom margin.

	top_margin_height: INTEGER
			-- Height of top margin.

	page_height: INTEGER
			-- Height of page.

	page_width: INTEGER
			-- Width of page.

	header_height: INTEGER
			-- Height of page header (the header appears on each page)

	footer_height: INTEGER
			-- Height of page footer (the footer appears on each page)

feature -- Status report

	reserved_height: INTEGER is
			-- Reservered height for margins.
		do
			Result := top_margin_height + bottom_margin_height
		ensure
			Result = (top_margin_height + bottom_margin_height)
		end

	reserved_width: INTEGER is
			-- Reserved width for margins.
		do
			Result := left_margin_width + right_margin_width
		ensure
			Result = (left_margin_width + right_margin_width)
		end

	available_height: INTEGER is
			-- Available height within the page.
		do
			Result := page_height - reserved_height
		ensure
			Result = (page_height - reserved_height)
		end

	available_width: INTEGER is
			-- Available width within the page.
		do
			Result := page_width - reserved_width
		ensure
			Result = page_width - reserved_width
		end

	is_first_page: BOOLEAN is
			-- Is the current page the first page?
		do
			Result := page = 1
		ensure
			Result = (page = 1)
		end
		
	is_last_page: BOOLEAN is
			-- Is the current page the last page?
		do
			Result := exhausted
		ensure
			Result = exhausted
		end
		
	page: INTEGER
			-- Current page

	line: INTEGER
			-- Current line (relative to the end of the top margin), a write operation will be on this line.

	column: INTEGER
			-- Current column (relative to the end of the left margin), a write operation will be on this column.
	
	exhausted: BOOLEAN is
			-- Are the items to write exhausted?
		deferred
		end

feature -- Element change

	set_left_margin_width (a_width: INTEGER) is
			-- Set left_margin_width with `a_width'.
		require
			valid_width: a_width >= 0 and (reserved_width + (a_width - left_margin_width)) < page_width
		do
			left_margin_width := a_width
		ensure
			left_margin_width_copied: left_margin_width = a_width
		end

	set_right_margin_width (a_width: INTEGER) is
			-- Set right_margin_width with `a_width'.
		require
			valid_width: a_width >= 0 and (reserved_width + (a_width - left_margin_width)) < page_width
		do
			right_margin_width := a_width
		ensure
			right_margin_width_copied: right_margin_width = a_width
		end

	set_top_margin_height (a_height: INTEGER) is
			-- Set top_margin_height with `a_height'.
		require
			valid_height: a_height >= 0 and (reserved_height + (a_height - top_margin_height)) < page_height
 		do
			top_margin_height := a_height
		ensure
			top_margin_height_copied: top_margin_height = a_height
		end

	set_bottom_margin_height (a_height: INTEGER) is
			-- Set bottom_margin_height with `a_height'.
		require
			valid_height: a_height >= 0 and (reserved_height + (a_height - bottom_margin_height)) < page_height
		do
			bottom_margin_height := a_height
		ensure
			bottom_margin_height_copied: bottom_margin_height = a_height
		end

	set_page_height (a_height: INTEGER) is
			-- Set page_height with `a_height'.
		require
			valid_height: a_height > reserved_height
		do
			page_height := a_height
		ensure
			page_height_copied: page_height = a_height
		end

	set_page_width (a_width: INTEGER) is
			-- Set page_width with `a_width'.
		require
			valid_width: a_width > reserved_width
		do
			page_width := a_width
		ensure
			page_width_copied: page_width = a_width
		end

	set_header_height (a_height: INTEGER) is
			-- Set height of page header with `a_height' (the header appears on each page).
		require
			valid_height: a_height >= 0 and (reserved_height + ( a_height - header_height)) < page_height
		do
			header_height := a_height
		ensure
			header_height_copied: header_height = a_height
		end

	set_footer_height (a_height: INTEGER) is
			-- Set height of page footer with `a_height' (the footer appears on each page).
		require
			valid_height: a_height >= 0 and (reserved_height + ( a_height - footer_height)) < page_height
		do
			footer_height := a_height
		ensure
			footer_height_copied: footer_height = a_height
		end
			 
feature -- Basic operations

	write (an_output_medium : EREP_OUTPUT_MEDIUM) is
			-- Write report on `an_output_medium.
		require
			output_medium_is_open_write: an_output_medium.is_open_write
		do
			output_medium := an_output_medium
			initialize_write
			from
				page := 1	
				line := 0
				column := 0
			until
				exhausted
			loop
				write_page
				eject_page
				page := page + 1
				line := 0
				column := 0
			end
		end
		
	eject_page is
			-- Eject current page.
		do
			output_medium.put_character ('%F')
		end

feature {NONE} -- Implementation

	output_medium: EREP_OUTPUT_MEDIUM

	character_codes: UT_CHARACTER_CODES is
			-- Character codes
		once
			!!Result
		end

	initialize_write is
			-- Initialization for each write.
		deferred
		end

	write_page is
			-- write a page.
		do
			write_before_body
			write_body
			if exhausted then
				write_summary
			end
			write_after_body
		end
	
	write_before_body is
			-- Write top margin and header.
		do
			skip_top_margin
			write_header
			if header_height > 0 then
				move_to_line (header_height)
			end
		end

	write_body is
			-- Write Body.
		do
			from
			until
				(line =  available_height - footer_height) or exhausted
			loop
				skip_lines (1)
				write_body_line
			end
		end


	write_body_line is
			-- Write body.
		deferred
		ensure
			within_height: line < available_height - footer_height + 1
		end

	write_after_body is
			-- Write footer and bottom margin.
		do
			if line < available_height then
				move_to_line (available_height - footer_height)
			end
			write_footer
			move_to_line (available_height)
			skip_bottom_margin
		end

	write_summary is
			-- Write summary.
		deferred
		end

	skip_left_margin is
			-- Skip left_margin.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > left_margin_width
			loop
				output_medium.put_character (' ')
				i := i + 1
			end
			column := 1
		ensure
			first_column: column = 1
		end

	skip_top_margin is
			-- Skip top margin.
		require
			valid_line: line = 0
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > top_margin_height
			loop
				output_medium.put_new_line
				i := i + 1
			end
			line := 1
		ensure
			first_line: line = 1
		end

	skip_bottom_margin is
			-- Skip bottom margin.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i  > bottom_margin_height
			loop
				output_medium.put_new_line
				i := i + 1
			end
			line := 0
		ensure
			before_new_page: line = 0
		end
				
	write_header is
			-- Write header.
		deferred
		ensure
			within_height: line <= header_height
		end

	write_footer is
			-- Write footer.
		deferred
		ensure
			within_height: line <= available_height
		end

feature -- Cursor movement

		
	move_to_line (a_line: INTEGER) is
			-- Move to line `a_line'.
		require
			not_before_current: not (a_line < line)
			within_height: a_line <= available_height
		do
			from
			until
				line = a_line
			loop
				output_medium.put_new_line
				line := line + 1
			end
			column := 0
		ensure
			new_line: line = a_line
			first_column : column = 0
		end

	skip_lines (a_counter: INTEGER) is
			-- Skip `a_counter' lines .
		require
			within_height: line + a_counter <= available_height
		do
			move_to_line (line + a_counter)
			column := 0
		ensure
			skipped: line = old line + a_counter					
			first_column : column = 0
		end

	move_to_column (a_column: INTEGER) is
			-- Move to column `a_column' origin is end of left_margin.
		require
			before_right_margin: a_column <= available_width
			not_befor_current_column: not (a_column < column)
		do
			from
				if column = 0 then
					skip_left_margin
				end
			until
				column = a_column
			loop
				output_medium.put_character (' ')
				column := column + 1
			end
		ensure
			new_column: column = a_column
		end		

	skip_columns (a_counter: INTEGER) is
			-- Skip `a_counter' columns.
		require
			within_width: column + a_counter <= available_width
		do
			if column = 0 then
				skip_left_margin
			end
			move_to_column (column + a_counter)	
		end

feature -- Output

	put_string (a_string: STRING) is
			-- Write `a_string' to medium.
		require
			string_not_void: a_string /= Void
			within_width: column + a_string.count - 1 <= available_width
		do
			if a_string.count > 0 then
				if column = 0 then
					skip_left_margin
				end
				output_medium.put_string (a_string)
				column := column + a_string.count
			end
		end;

	put_character (a_character: CHARACTER) is
			-- Write `a_character' to medium.
		require
			within_width: column <= available_width
		do
			if column = 0 then
				skip_left_margin
			end
			output_medium.put_character (a_character)
		end;

invariant
	valid_line: line >= 0 and line <= available_height
	valid_column: column >= 0 and column <= available_width

end -- class EREP_REPORT

--
-- Copyright: 2001, Paul G. Crismer, Eric Fafchamps
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
