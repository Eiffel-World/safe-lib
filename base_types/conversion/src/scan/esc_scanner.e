indexing
	description: "Objects that scan a string representation of and object of type T "
	comments: "Implementations of scan should check if a_string is same as last_input_string before scanning again (to limit overhead)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/16 10:50:12 $"
	revision: "$Revision: 1.1 $"

deferred class
	ESC_SCANNER [T]

feature -- Access

	last_object: T
			-- Last scanned object.

feature -- Basic operation

	scan (a_string: STRING) is
			-- Scan `a_string'.
		require
			a_string_defined: a_string /= Void
		deferred
		ensure
			is_scanned xor (not is_scanned and error /= Void)
		end

feature -- Status report

	error: UT_ERROR
			-- Scanner error.

	is_scanned: BOOLEAN is
			-- Is last input string scanned successfuly?
		do
			Result := error = Void
		ensure
			Result = (error = Void)
		end		

feature {NONE} -- Implementation

	last_input_string: STRING
			-- Last scanned input string.
	
end -- class ESC_SCANNER


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--