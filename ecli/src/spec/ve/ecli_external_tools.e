indexing
	description: "Tools for Eiffel/External (to C) communication"
	author: "Paul G. Crismer"
	date: "$Date: 2001/09/09 19:03:31 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

expanded class
	ECLI_EXTERNAL_TOOLS

feature -- Basic operations

	string_to_pointer (s : STRING) : POINTER is
			-- pointer to "C" version of 's'
		require
			good_string: s /= Void
		do
			Result := s.to_c
		end

	pointer_to_string (p : POINTER) : STRING is
		require
			good_pointer: p /= default_pointer
		do
			!! Result.make (0)
			Result.from_c (p)
		end

feature {NONE} -- Implementation

		pointer (ptr : POINTER) : POINTER is
			do
				Result := ptr
			end

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_EXTERNAL_TOOLS
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
