indexing
	description: "Pre-condition error for a feature"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

class
	EMI_PRECONDITION_ERROR

inherit
	UT_ERROR

creation
	make

feature {NONE} -- Initialization

	make (a_string: STRING) is
			-- Create a new error reporting that `a_string' contains a syntax error.
		require
			a_string_not_void: a_string /= Void
		do
			!!parameters.make (1,1)
			parameters.put (a_string, 1)
		end
	

feature -- Access

	default_template: STRING is
			-- Default template used to built the error message
		do
			Result := "$0: Precondition error : $1"
		end

	code: STRING is
			-- Error code
			-- (Might be useful to identify user-defined templates.)
		do
			Result := "EMI_PRECONDITION_ERROR"
		end

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = a_string

end -- class EMI_PRECONDITION_ERROR

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
