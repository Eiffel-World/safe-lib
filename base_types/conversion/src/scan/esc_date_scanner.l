%{
indexing
	description: "Objects that scan a string representation of a EDT_DATE"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

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
%}

%option	nodefault
%option outfile="esc_date_scanner.e"

DIGIT	[0-9]


%%

{DIGIT}+	{
				date_parts.force_last (text.to_integer)
			}
			
"."|"-"|"_"|"/"

.			{
				!ESC_SYNTAX_ERROR!error.make (text)					
			}

%%

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