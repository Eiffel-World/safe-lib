indexing
	description: "Access to decimal math constants and shared context"
	author: "Paul G. Crismer"
	date: "$Date: 2003/11/20 20:37:27 $"
	revision: "$Revision: 1.1 $"

class
	EDA_DECIMAL_MATH

inherit
	EDA_SHARED_MATH_CONTEXT

feature -- Access

	zero : EDA_DECIMAL is
		once
			create Result.make (1)
			Result := Result.zero
		end
		
	negative_zero : EDA_DECIMAL is
		once
			Result := zero.negative_zero
		end
		
	one : EDA_DECIMAL is
		once
			Result := zero.one
		end
		
	minus_one : EDA_DECIMAL is
		once
			Result := zero.minus_one
		end
	
	infinity : EDA_DECIMAL is
		once
			Result := zero.infinity
		end
		
	negative_infinity :  EDA_DECIMAL is
		once
			Result := zero.negative_infinity
		end

end -- class EDA_DECIMAL_MATH
