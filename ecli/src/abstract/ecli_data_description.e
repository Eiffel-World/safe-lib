indexing
	description: "Properties of an ECLI data item"
	author: "Paul G. Crismer"
	date: "$Date: 2001/09/15 10:24:10 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

deferred class
	ECLI_DATA_DESCRIPTION

feature -- Status report

	db_type_code : INTEGER is
			-- (redefine in descendant classes)
		deferred
		end

	column_precision : INTEGER is
			-- maximum number of 'digits' used by the data type
			-- for character and binary data : number of bytes or characters
			-- for numeric data : number of sigificant digits
			-- (redefine in descendant classes)
		deferred
		end

	decimal_digits : INTEGER is
			-- decimal digits or scale
			-- (redefine in descendant classes)
		deferred
		end
		
end -- class ECLI_DATA_DESCRIPTION
--
-- Copyright: 2000-2001, Paul G. Crismer, <pgcrism@pi.be>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
