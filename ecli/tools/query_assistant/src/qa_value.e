indexing
	description: 

		"ECLI_VALUE with eiffel generation metadata"

	author: 	"Paul G. Crismer"
	date: 		"$Date: 2003/07/02 19:45:00 $"
	revision: 	"$Revision: 1.6 $"
	licensing: 	"See notice at end of class"

deferred class
	QA_VALUE

inherit
	ECLI_VALUE
		undefine
			out,
			to_character, convertible_to_character,
			to_double, convertible_to_double,
			to_integer, convertible_to_integer,
			as_string, convertible_to_string,
			to_real, convertible_to_real,
			to_date, convertible_to_date,
			to_timestamp, convertible_to_timestamp,
			to_time, convertible_to_time,
			copy
		end


feature

	ecli_type : STRING is 
		deferred
		end
		
	value_type : STRING is
		deferred
		end
		
	creation_call : STRING is
		deferred
		ensure			
		end

feature {NONE} -- implementation

	make_call : STRING is
		do
			create Result.make (12)
			Result.append ("make")
		end


	make_call_with_precision : STRING is
		do
			create Result.make (12)
			Result.append ("make (")
			Result.append (size.out)
			Result.append (")")
		end

	make_first_call : STRING is
		once
			create Result.make (12)
			Result.append ("make_first")
		end
		
	make_default_call : STRING is
			-- 
		once
			create Result.make_from_string ("make_default")
		end
		
end -- class QA_VALUE
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
