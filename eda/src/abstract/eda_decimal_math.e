indexing
	description: "Access to decimal math constants and shared context"
	author: "Paul G. Crismer"
	date: "$Date: 2003/12/22 10:53:13 $"
	revision: "$Revision: 1.2 $"

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

	not_a_number : EDA_DECIMAL is
		once
			Result := zero.nan
		end
		
	signaling_not_a_number : EDA_DECIMAL is
		once
			Result := zero.Snan
		end
		
end -- class EDA_DECIMAL_MATH
