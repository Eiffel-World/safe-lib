indexing
	description: "Tools for Eiffel/External (to C) communication"
	author: "Paul G. Crismer"
	date: "$Date: 2003/08/19 15:52:28 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	XS_C_EXTERNAL_TOOLS

inherit
	XS_C_EXTERNAL_TOOLS_COMMON

feature -- Basic operations

	string_to_pointer (s : STRING) : POINTER is
			-- pointer to "C" version of 's'
		local
			a : ANY
		do
			a := s.to_c
			Result := pointer($a)
		end

	pointer_to_string (p : POINTER) : STRING is
		do
			create Result.make (0)
			Result.from_c (p)
		end

	string_copy_from_pointer (s : STRING; p : POINTER) is
			-- copy 'C' string at `p' into `s'
		do
			s.from_c (p)
		end
		
feature {NONE} -- Implementation

		pointer (ptr : POINTER) : POINTER is
			do
				Result := ptr
			end

invariant
	invariant_clause: -- Your invariant here

end -- class XS_C_EXTERNAL_TOOLS
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
