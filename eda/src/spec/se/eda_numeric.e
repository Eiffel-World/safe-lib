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
			sign as smarteiffel_sign
		redefine
			smarteiffel_sign
		end
		
feature 

	sign : INTEGER is
			-- sign : positive = 1; negative = -1
		deferred
		end
		
	smarteiffel_sign : INTEGER_8 is
		do
			Result := sign.to_integer_8
		end

end -- class EDA_NUMERIC

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
