indexing
	description: "CLI SQL INTEGER value"
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 09:23:29 $"
	revision: "$Revision: 1.10 $"
	licensing: "See notice at end of class"

class
	ECLI_INTEGER

inherit
	ECLI_VALUE
		redefine
			item, set_item, out,
			to_integer, convertible_to_integer,
			to_real, convertible_to_real,
			to_double, convertible_to_double 
		end

creation
	make

feature -- Initialization

	make is
		do
			buffer := ecli_c_alloc_value (4)
			create impl_item
		end

feature -- Access

	item : INTEGER_REF is
		do
			if is_null then
				Result := Void
			else
				impl_item.set_item (to_integer)
				Result := impl_item
			end
		end

feature -- Measurement

feature -- Status report

	convertible_to_integer : BOOLEAN is
		do
			Result := True
		end

	convertible_to_double : BOOLEAN is
		do
			Result := True
		end
		
	convertible_to_real : BOOLEAN is
		do
			Result := True
		end
		
feature -- Access


	c_type_code: INTEGER is
		once
			Result := sql_c_long
		end

	column_precision: INTEGER is
		do
			Result := 10
		end

	sql_type_code: INTEGER is
		once
			Result := sql_integer
		end

	decimal_digits: INTEGER is
		do
			Result := 0
		end

	display_size: INTEGER is
		do
			Result := 11
		end

	transfer_octet_length: INTEGER is
		do
			Result := 4
		ensure then
			integer_32: Result = 4
		end

feature -- Cursor movement

feature -- Element change

	set_item (value : like item) is
			-- set item to 'value', truncating if necessary
		do
			actual_value := value.item
			ecli_c_value_set_value (buffer, $actual_value, transfer_octet_length)
			ecli_c_value_set_length_indicator (buffer, transfer_octet_length)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	to_integer : INTEGER is
		do
			if not is_null then
				ecli_c_value_copy_value (buffer, $actual_value)
				Result := actual_value
			end
		end

	to_real : REAL is
		do
			if not is_null then
				Result := to_integer
			end
		end
		
	to_double : DOUBLE is
		do
			if not is_null then
				Result := to_integer
			end
		end
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations


	out : STRING is
		do
			if is_null then
				Result := "NULL"
			else
				Result := item.item.out
			end
		end

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_integer (Current)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	actual_value : INTEGER

	octet_size : INTEGER is do Result := 4 ensure then result_is_4: Result = 4 end

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_INTEGER
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
