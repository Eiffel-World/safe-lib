indexing
	description: "Access to UINT32 routines"
	author: "Paul G. Crismer"
	
	library: "XS_C : eXternal Support C"
	
	date: "$Date: 2003/08/19 15:52:28 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	XS_IMPORTED_UINT32_ROUTINES
	
feature -- Basic operations

	UINT32_ : XS_UINT32_ROUTINES is
		once
			create Result
		end

end -- class XS_IMPORTED_UINT32_ROUTINES
--
-- Copyright: 2003; Paul G. Crismer; <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
