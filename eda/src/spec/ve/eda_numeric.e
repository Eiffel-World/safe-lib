indexing
	description: "Properties of numeric types."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:06:14 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

deferred class
	EDA_NUMERIC

inherit
	NUMERIC
		rename
			exponentiable as ve_exponentiable
		end

feature -- Basic operations

	infix "^" (other : DOUBLE) : DOUBLE is
		do
		end

	ve_exponentiable (other : DOUBLE) : BOOLEAN is
		do
		end


end -- class EDA_NUMERIC

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
