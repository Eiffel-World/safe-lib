indexing
	description:

		"Properties of numeric types."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/04/27 19:13:16 $"

deferred class KL_NUMERIC

inherit

	NUMERIC
		rename
			sign as smarteiffel_sign
		redefine
			smarteiffel_sign
		end
		
feature 

	sign : INTEGER is
			-- Sign : positive = 1; negative = -1
		deferred
		end
		
	smarteiffel_sign : INTEGER_8 is
		do
			Result := sign.to_integer_8
		end

end


