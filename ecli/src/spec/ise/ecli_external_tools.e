indexing
	description: "Tools for Eiffel/External (to C) communication"
	author: "Paul G. Crismer"
	date: "$Date: 2002/12/10 08:33:14 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

expanded class
	ECLI_EXTERNAL_TOOLS

feature -- Basic operations

	string_to_pointer (s : STRING) : POINTER is
			-- pointer to "C" version of 's'
		require
			good_string: s /= Void
		local
			a : ANY
		do
			a := s.to_c
			Result := pointer($a)
		end

	pointer_to_string (p : POINTER) : STRING is
		require
			good_pointer: p /= default_pointer
		do
			create Result.make (0)
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
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--