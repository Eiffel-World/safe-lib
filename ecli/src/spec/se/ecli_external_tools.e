indexing
	description: "Tools for Eiffel/External (to C) communication"
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/26 19:33:44 $"
	revision: "$Revision: 1.7 $"
	licensing: "See notice at end of class"

class
	ECLI_EXTERNAL_TOOLS

inherit
	ECLI_EXTERNAL_TOOLS_COMMON

feature -- Basic operations

	string_to_pointer (s : STRING) : POINTER is
			-- pointer to "C" version of 's'
		do
			Result := s.to_external
		end

	pointer_to_string (p : POINTER) : STRING is
		do
			create Result.from_external_copy (p)
		end

	string_copy_from_pointer (s : STRING; p : POINTER) is
			-- copy 'C' string at `p' into `s'
		do
			s.from_external_copy (p)
		end

feature -- Inapplicable

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
