indexing
	description: "Properties of numeric types."

	library: "EDA"
	author: "Paul G. Crismer"

	date: "$Date: 2003/02/26 18:54:04 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

deferred class
	EDA_NUMERIC

inherit
	NUMERIC
		rename exponentiable as ve_exponentiable
	end
	
feature -- Basic operations

	infix "^" (other : DOUBLE) : DOUBLE is
			-- Not implemented
		do
		end
		
	ve_exponentiable (other : DOUBLE) : BOOLEAN is
			-- Not implemented
		do
		end

end -- class EDA_NUMERIC

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
