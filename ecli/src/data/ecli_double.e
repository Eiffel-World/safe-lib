indexing
	description: 
	
		"CLI SQL DOUBLE value"

	author: "Paul G. Crismer"
	date: "$Date: 2003/05/08 13:59:23 $"
	revision: "$Revision: 1.15 $"
	licensing: "See notice at end of class"

class
	ECLI_DOUBLE

inherit
	ECLI_GENERIC_VALUE [DOUBLE]
		redefine
			item, set_item, out,
			to_double, convertible_to_double, to_integer, convertible_to_integer,
			to_real, convertible_to_real
		end

	XS_C_MEMORY_ROUTINES
		undefine
			copy,out, is_equal
		end

	
creation
	make

feature -- Initialization

	make is
		do
			buffer := ecli_c_alloc_value (transfer_octet_length)
		end
		
feature -- Access

	item : DOUBLE is
		do
			Result := to_double
		end

feature -- Measurement

feature -- Status report

	convertible_to_double : BOOLEAN is
		do
			Result := True
		end

	convertible_to_integer : BOOLEAN is
		do
			Result := True
		end

	convertible_to_real : BOOLEAN is
		do
			Result := True
		end

feature -- Status setting

	c_type_code: INTEGER is
		once
			Result := sql_c_double
		end

	column_precision: INTEGER is
		do
			Result := 15
		end

	sql_type_code: INTEGER is
		once
			Result := sql_double
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
			Result := 8
		end

feature -- Cursor movement

feature -- Element change

	set_item (value : DOUBLE) is
			-- set item to 'value', truncating if necessary
		do
--			impl_item := value.item
--			ecli_c_value_set_value (buffer, $impl_item, transfer_octet_length)
			c_memory_put_double (ecli_c_value_get_value (buffer), value)
			ecli_c_value_set_length_indicator (buffer, transfer_octet_length)
		ensure then
			item_set: item = value
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	to_double : DOUBLE is
		do
			if not is_null then
--				ecli_c_value_copy_value (buffer, $impl_item)
--				Result := impl_item
				Result := c_memory_get_double (ecli_c_value_get_value(buffer))
			end
		end

	to_integer : INTEGER is
		do
			if not is_null then
				Result := to_double.truncated_to_integer
			end
		end

	to_real : REAL is
		do
			if not is_null then
				Result := to_double.truncated_to_real
			end
		end
		
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_double (Current)
		end

	out : STRING is
		local
			message_buffer : XS_C_STRING
		do
			if is_null then
				Result := "NULL"
			else
				create message_buffer.make (50)
				sprintf_double (message_buffer.handle, item.item)
				Result := pointer_to_string(message_buffer.handle)
			end
		end

feature {NONE} -- Implementation

	sprintf_double (s : POINTER; d : DOUBLE) is
			-- 
		external "C" 
		alias "ecli_c_sprintf_double"
		end

end -- class ECLI_DOUBLE
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
