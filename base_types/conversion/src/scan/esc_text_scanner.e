indexing
	description: "Objects that scan a string representation of a TEXT, each paragraph is separated with %N "
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

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

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_set_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 2 then
if yy_act = 1 then
--|#line 42
last_text.append_paragraph (text); prior_line_is_empty := False; all_lines_are_empty := False
else
--|#line 44
if prior_line_is_empty then force_empty_line end; prior_line_is_empty := True
end
else
--|#line 0
last_token := yyError_token
fatal_error ("scanner jammed")
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    3,    7,    7>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    8,    3,    7,    7,    7>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    4,    0,    5,    0,    5,    2>>)
		end

	yy_set_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    7,    1,    7,    8,    7,    8,    0,    7>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    2>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    4,    1,    2,    1,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 5
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 7
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 8
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 3
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 4
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
			-- Start condition codes

feature -- User-set features



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