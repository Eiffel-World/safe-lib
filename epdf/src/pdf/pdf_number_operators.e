indexing
	description: 
	
		"PDF number operations"

	author: 	"Paul G. Crismer"
	licencing: 	"See notice at end of class"
	date: 		"$Date: 2002/03/20 15:19:06 $"
	revision: 	"$Revision: 1.1 $"

class
	PDF_NUMBER_OPERATORS


feature -- Status report


	equal_numbers (a, b : DOUBLE) : BOOLEAN is
			-- is a = b i.e the difference negligible ?
		do
			Result := ((a - b).abs < 0.0000001)
		end

feature -- Conversion


end -- class PDF_NUMBER_OPERATORS
