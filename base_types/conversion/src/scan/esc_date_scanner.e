indexing
	description: "Objects that scan a string representation of a EDT_DATE"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

class
	ESC_DATE_SCANNER
inherit 
	ESC_SCANNER [DT_DATE]
		rename
			last_object as last_date
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
--|#line 38

				date_parts.force_last (text.to_integer)
			
else
--|#line 42

end
else
if yy_act = 3 then
--|#line 44

				!ESC_SYNTAX_ERROR!error.make (text)					
			
else
--|#line 0
last_token := yyError_token
fatal_error ("scanner jammed")
end
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
			    0,    4,    5,    6,    6,    6,    7,    6,    8,    8,
			    9,    3,    9,    9,    9,    9,    9,    9,    9>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    8,    7,
			    3,    9,    9,    9,    9,    9,    9,    9,    9>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   10,   11,   11,   11,    3,    2,   11>>)
		end

	yy_set_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    9,    1,    9,    9,    9,    9,    9,    9,    0>>)
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
			    1,    1,    1,    1,    1,    3,    4,    5,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    7,    1,    1,    1,    1,

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
			    0,    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    5,    3,    4,    2,    1,    1,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 11
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 9
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 10
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

	yyNb_rules: INTEGER is 4
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 5
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
			order := defaults.order
			!!date_parts.make
		ensure
			order_default: order = defaults.order
		end
	

feature -- Status report

	defaults: ESC_DATE_SCANNER is
			-- Shared default options for date scanners.
		once
			!!Result.make
			Result.select_ymd_order
		end

	is_ymd_ordered: BOOLEAN is
			-- Is the order year,month,day?
		do
			Result := order = Ymd_order
		ensure
			is_ymd_ordered: Result = (order = Ymd_order)
		end

	is_dmy_ordered: BOOLEAN is
			-- Is the order day,month,year?
		do
			Result := order = Dmy_order
		ensure
			is_dmy_ordered: Result = (order = Dmy_order)
		end

	is_mdy_ordered:BOOLEAN is
			-- Is the order month,day,year?
		do
			Result := order = Mdy_order
		ensure
			is_mdy_ordered: Result = (order = Mdy_order)
		end

feature -- Status setting

	select_ymd_order is
			-- Select the year month day order of presentation.
		do
			order := Ymd_order
		ensure
			is_ymd_ordered: is_ymd_ordered
		end

	select_dmy_order is
			-- Select the day month year order of presentation.
		do
			order := Dmy_order
		ensure
			is_dmy_ordered: is_dmy_ordered	
		end

	select_mdy_order is
			-- Select the month day year order of presentation.
		do
			order := Mdy_order
		ensure
			is_mdy_ordered: is_mdy_ordered
		end
	
feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		local
			year,month,day: INTEGER
			new_date: DT_DATE
		do
			error := Void
			date_parts.wipe_out
			reset
			set_input_buffer (new_string_buffer (a_string))
			scan_yy
			if scanning_error then
				!ESC_SYNTAX_ERROR!error.make (a_string)
			end
			if error = Void then
				if date_parts.count = 3 then
					date_parts.start
					inspect order
					when ymd_order then
						year := date_parts.item_for_iteration
						date_parts.forth
						month := date_parts.item_for_iteration
						date_parts.forth
						day := date_parts.item_for_iteration
					when dmy_order then
						day := date_parts.item_for_iteration
						date_parts.forth
						month := date_parts.item_for_iteration
						date_parts.forth
						year := date_parts.item_for_iteration
					when mdy_order then
						month := date_parts.item_for_iteration
						date_parts.forth
						day := date_parts.item_for_iteration
						date_parts.forth
						year := date_parts.item_for_iteration
					else
					end
					if year < 100 then
						if year < 50 then
							year := 2000 + year
						else
							year := 1900 + year
						end
					end
		
					if month >= date_tool.January and then month <= date_tool.December and then	day >= 1 and then day <= date_tool.days_in_month (month, year) then
						!!new_date.make (year, month, day)
						last_date := new_date
					else
						!ESC_SYNTAX_ERROR!error.make (a_string)					
					end
				else
					!ESC_SYNTAX_ERROR!error.make (a_string)
				end
			end			
		end

feature {NONE} -- Implementation


	ymd_order: INTEGER is 0
			-- Is the order year,month,day?

	dmy_order: INTEGER is 1
			-- Is the order day,month,year?

	mdy_order: INTEGER is 2
			-- Is the order month,day,year?


	date_parts: DS_LINKED_LIST [INTEGER]
			-- Integral date parts
			
	date_tool: DT_DATE is
			-- Date used as tool for validation.
		local
			dt_system_clock: DT_SYSTEM_CLOCK
		once
			!!dt_system_clock.make
			Result := dt_system_clock.date_now
		end
			
feature {ESC_DATE_SCANNER} -- Implementation

	order: INTEGER
			-- Order of year, month and day parts.

end -- class ESC_DATE_SCANNER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--