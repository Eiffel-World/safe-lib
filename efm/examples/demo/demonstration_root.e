indexing
	description: "Root class for Eiffel Format Demonstration";
	author: "Eric Fafchamps"
	date: "$Date: 2005/05/16 18:03:44 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"
class
	DEMONSTRATION_ROOT

creation

	make

feature -- Initialization

	make is
			-- Initialize demonstration.
		do
		end
				

feature {NONE} -- Implementation

	boolean_format: FM_BOOLEAN_FORMAT
	
	date_format: FM_DATE_FORMAT
	
	date_time_format: FM_DATE_TIME_FORMAT
	
	double_format: FM_DOUBLE_FORMAT
	
	integer_format: FM_INTEGER_FORMAT
	
	string_format: FM_STRING_FORMAT
	
	text_format: FM_TEXT_FORMAT
	
	time_duration_format: FM_TIME_DURATION_FORMAT
	
	time_format: FM_TIME_FORMAT

end -- class TRANSACT

--
-- Copyright: 2001-2005, Eric Fafchamps <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
