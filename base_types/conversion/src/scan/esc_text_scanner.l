%{
indexing
	description: "Objects that scan a string representation of a TEXT, each paragraph is separated with %N "
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:13 $"
	revision: "$Revision: 1.1 $"

class
	ESC_TEXT_SCANNER
inherit 
	ESC_SCANNER [TEXT]
		rename
			last_object as last_text
		end

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_yy,
			make_with_file as make_with_file_yy,
			make_with_buffer as make_with_buffer_yy,
			scan as scan_yy
		export
			{NONE} all
		end

	KL_IMPORTED_INTEGER_ROUTINES --mixin
		export {NONE} all
		end
		
creation
	make
%}

%option	nodefault
%option outfile="esc_text_scanner.e"

LINE	.*

%%

	
{LINE}	last_text.append_paragraph (text); prior_line_is_empty := False; all_lines_are_empty := False

\n	 if prior_line_is_empty then force_empty_line end; prior_line_is_empty := True


%%

feature -- Initialization

	make is
			-- Initialize scanner.
		do
			make_with_buffer_yy (new_string_buffer (" "))
		end
		
feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		local
			a_text: TEXT
		do
			prior_line_is_empty := True
			all_lines_are_empty := True
			!!a_text.make (a_string.occurrences (INTEGER_.to_character(ut_character_codes.New_line_code)
) + 1)
			last_text := a_text
			error := Void

			reset
			set_input_buffer (new_string_buffer (a_string))
			scan_yy

			if scanning_error then
				!ESC_SYNTAX_ERROR!error.make (a_string)
			else
				if prior_line_is_empty and not (a_string.count = 0) and not all_lines_are_empty then
					force_empty_line
				end
			end
		end

feature {NONE} -- Implementation
		
		prior_line_is_empty: BOOLEAN

		all_lines_are_empty: BOOLEAN

		force_empty_line is
				-- Force empty line
			local
				a_string: STRING
			do
					!!a_string.make (1); 
					last_text.append_paragraph (a_string)
			end

		ut_character_codes: UT_CHARACTER_CODES is
				-- Character code.
			once
				!!Result
			end
end -- class ESC_TEXT_SCANNER


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--