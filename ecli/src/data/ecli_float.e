indexing
	description: "CLI SQL FLOAT value"
	author: "Paul G. Crismer"
	date: "$Date: 2002/04/15 20:08:48 $"
	revision: "$Revision: 1.6 $"
	licensing: "See notice at end of class"

class
	ECLI_FLOAT

inherit
	ECLI_DOUBLE
		redefine
			column_precision, sql_type_code, decimal_digits, display_size, transfer_octet_length
		end

creation
	make

feature -- Initialization

		
feature -- Access


feature -- Measurement

feature -- Status report

		

feature -- Status setting


	column_precision: INTEGER is
		do
			Result := 15
		end

	sql_type_code: INTEGER is
		once
			Result := sql_float
		end
	
	decimal_digits: INTEGER is
		do 
			Result := 0
		end

	display_size: INTEGER is
		do
			Result := 22
		end

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_value_get_length (buffer)
		end

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature {NONE} -- Implementation

end -- class ECLI_FLOAT
--
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
