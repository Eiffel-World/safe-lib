indexing
	description: "Factory of ECLI_VALUE descendant instances"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/28 08:52:04 $"
	revision: "$Revision: 1.4 $"
	licensing: "See notice at end of class"

class
	ECLI_ARRAYED_VALUE_FACTORY

inherit

	ECLI_VALUE_FACTORY
		rename
			make as make_value
		redefine
			last_result,
			create_double_value, 
			create_real_value, 
			create_integer_value, 
			create_time_value, 
			create_timestamp_value,
			create_datetime_value,
			create_date_value,
			create_char_value,
			create_varchar_value
		end
			
creation
	make

feature -- Initialization

	make (a_row_count : INTEGER) is
		do
			row_count := a_row_count
		ensure
			row_count_set: row_count = a_row_count
		end

feature -- Access

	last_result : ECLI_ARRAYED_VALUE

feature -- Measurement

	row_count : INTEGER
	
feature -- Status report

feature -- Miscellaneous

	create_double_value is
		do
			!ECLI_ARRAYED_DOUBLE!last_result.make (row_count)
		end

	create_real_value is
		do
			!ECLI_ARRAYED_REAL!last_result.make (row_count)
		end

	create_integer_value is
		do
			!ECLI_ARRAYED_INTEGER!last_result.make (row_count)
		end

	create_char_value (column_precision : INTEGER) is
		do
			!ECLI_ARRAYED_CHAR!last_result.make (column_precision,row_count)
		end

	create_varchar_value (column_precision : INTEGER) is
		do
			if column_precision > 254 then
				!ECLI_ARRAYED_LONGVARCHAR!last_result.make (column_precision,row_count)
			else
				!ECLI_ARRAYED_VARCHAR!last_result.make (column_precision, row_count)
			end
		end

	create_date_value is
		do
			!ECLI_ARRAYED_DATE!last_result.make (row_count)
		end

	create_timestamp_value is
		do
			!ECLI_ARRAYED_TIMESTAMP!last_result.make (row_count)
		end

	create_datetime_value is
		do
			!ECLI_ARRAYED_DATE_TIME!last_result.make (row_count)
		end
		
	create_time_value is
		do
			!ECLI_ARRAYED_TIME!last_result.make (row_count)
		end

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_ARRAYED_VALUE_FACTORY
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
