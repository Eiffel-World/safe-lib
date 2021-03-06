indexing

	description:
	
			"Date and Time ISO formats and corresponding helper functions."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2006, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2006/03/07 17:10:09 $"

class ECLI_ISO_FORMAT_CONSTANTS

inherit

	ECLI_FORMAT_INTEGER
	
feature -- Access

	time_regex : STRING is "([0-9]{2})\:([0-9]{2})\:([0-9]{2})(\.([0-9]+))"
	
	time_regex_minimum_component_count : INTEGER is 3
		
	timestamp_regex : STRING is 
		once 
			create Result.make (date_regex.count + time_regex.count) 
			Result.append_string (date_regex)
			Result.append_string (" ")
			Result.append_string (time_regex)
		end
	
	date_regex : STRING is "([0-9]{4})-([0-1][0-9])-([0-3][0-9])"
	date_separator : STRING is "-"
	
	date_to_string (date : DT_DATE) : STRING is
			-- convert `date' to corresponding ISO format
		do
			create Result.make (10)
			Result.append_string (pad_integer_4 (date.year))
			Result.append_string (date_separator)
			Result.append_string (pad_integer_2 (date.month))
			Result.append_string (date_separator)
			Result.append_string (pad_integer_2 (date.day))
		end

	time_to_string (time : DT_TIME) : STRING is
			-- convert `time' to corresponding ISO format
		do
			create Result.make (20)
			Result.append_string (pad_integer_2 (time.hour))
			Result.append_string (time_separator)
			Result.append_string (pad_integer_2 (time.minute))
			Result.append_string (time_separator)
			Result.append_string (pad_integer_2 (time.second))
			if time.millisecond > 0 then
				Result.append_string (".")
				Result.append_string (time.millisecond.out)
			end
		end
	
	time_separator : STRING is ":"
	
	timestamp_to_string (timestamp : DT_DATE_TIME) : STRING is
			-- convert `timestamp' to corresponding ISO format
		do
			create Result.make (30)
			Result.append_string (date_to_string (timestamp.date))
			Result.append_string (" ")
			Result.append_string (time_to_string (timestamp.time))
		end
		
end
