indexing
	description: "CLI SQL REAL value"
	author: "Paul G. Crismer"
	date: "$Date: 2003/06/30 21:24:56 $"
	revision: "$Revision: 1.14 $"
	licensing: "See notice at end of class"

class
	ECLI_REAL

inherit
	ECLI_GENERIC_VALUE [REAL]
		redefine
			item, set_item, out,
			to_real, convertible_to_real,
			to_integer, convertible_to_integer,
			to_double, convertible_to_double
		end

	ECLI_EXTERNAL_TOOLS
		export
			{NONE} all
		undefine
			dispose, out, copy, is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			out, is_equal, copy
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

	item : REAL is
		do
				Result := to_real
		end

feature -- Measurement

feature -- Status report

	convertible_to_real : BOOLEAN is
		do
			Result := True
		end

	convertible_to_double : BOOLEAN is
		do
			Result := True
		end

	convertible_to_integer : BOOLEAN is
		do
			Result := True
		end

feature -- Status setting


	c_type_code: INTEGER is
		once
			Result := sql_c_float --  !!!
		end

	size : INTEGER is
		do
			Result := 7
		end

	sql_type_code: INTEGER is
		once
			Result := sql_real
		end

	decimal_digits: INTEGER is
		do
			Result := 0
		end

	display_size: INTEGER is
		do
			Result := 13
		end

	transfer_octet_length: INTEGER is
		do
			Result := 4
		end

feature -- Cursor movement

feature -- Element change

	set_item (value : REAL) is
			-- set item to 'value', truncating if necessary
		do
			c_memory_put_real (ecli_c_value_get_value (buffer), value)
			ecli_c_value_set_length_indicator (buffer, transfer_octet_length)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	to_real : REAL is
		do
			if not is_null then
				--ecli_c_value_copy_value (buffer, $impl_item)
				--Result := impl_item
				Result := c_memory_get_real (ecli_c_value_get_value (buffer))
			end
		end

	to_double : DOUBLE is
		do
			if not is_null then
				Result := to_real
			end
		end

	to_integer : INTEGER is
		do
			if not is_null then
				Result := to_real.truncated_to_integer
			end
		end

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_real (Current)
		end

	out : STRING is
		local
			message_buffer : XS_C_STRING
		do
			if is_null then
				Result := "NULL"
			else
				create message_buffer.make (50)
				sprintf_real (message_buffer.handle, item.item)
				Result := pointer_to_string(message_buffer.handle)
			end
		end

feature {NONE} -- Implementation

	octet_size : INTEGER is 
		do 
			Result := 4 
		ensure 
			result_is_4: Result = 4 
		end

	sprintf_real (s : POINTER; r : REAL) is
			--
		external "C"
		alias "ecli_c_sprintf_real"
		end

end -- class ECLI_REAL
--
-- Copyright: 2000-2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
