indexing
	description:

		"Properties of numeric types."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/05/25 08:10:01 $"

deferred class KL_NUMERIC

inherit

	NUMERIC
		rename exponentiable as ve_exponentiable,
		infix "^" as ve_exponentiation
	end
	
feature -- Basic operations

	ve_exponentiation (other : DOUBLE) : DOUBLE is
			-- Not implemented
		do
		end
		
	ve_exponentiable (other : DOUBLE) : BOOLEAN is
			-- Not implemented
		do
		end

end


