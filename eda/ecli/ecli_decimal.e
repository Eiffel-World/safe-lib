indexing

	description:

		"Objects that ..."

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2006/03/07 17:10:10 $"

class ECLI_DECIMAL

inherit

	ECLI_GENERIC_VALUE [STRING]
		redefine
			item, set_item, out,
			impl_item,
			bind_as_parameter
		end

	XS_IMPORTED_UINT32_ROUTINES
		undefine
			is_equal, copy, out
		end

	KL_IMPORTED_INTEGER_ROUTINES
		undefine
			is_equal, copy, out
		end
			
creation

	make

feature {NONE} -- Initialization

	make (new_precision, new_decimal_digits : INTEGER) is
		require
			valid_new_precision: new_precision > 0 and new_precision <= max_capacity
			valid_new_decimal_digits: new_decimal_digits >=0 and new_decimal_digits <= new_precision
		local
			s : STRING
		do
			precision := new_precision
			decimal_digits := new_decimal_digits
			buffer := ecli_c_alloc_value (new_precision *2)--+3) -- sign, digits, decimal point, terminating '%U'
			create s.make (0)
			impl_item := s
			set_null
			create ext_item.make_shared_from_pointer (ecli_c_value_get_value (buffer), capacity)
		ensure
			is_null: is_null
--			capacity: capacity >= new_precision+2
			precision_set: precision = new_precision
			decimal_digits_set: decimal_digits = new_decimal_digits
		end
		
feature -- Access

	precision : INTEGER
	
	decimal_digits : INTEGER
	
	item : STRING is
		do
			if is_null then
				Result := Void
			else
				ext_item.copy_to (impl_item)
				Result := impl_item
			end
		end

	max_capacity : INTEGER is
		do
			Result := 256
		end

	capacity : INTEGER is
		do
			Result := ecli_c_value_get_length (buffer) - 1
		end

	count : INTEGER --is
			-- actual length of item
--		do
--			if not is_null then
--				Result := ecli_c_value_get_length_indicator (buffer)
--			end
--		end

feature -- Measurement

feature -- Status report

	convertible_as_character : BOOLEAN is
			-- Is this value convertible to a character ?
		do 
			Result := False
		end

	convertible_as_boolean : BOOLEAN is
			-- Is this value convertible to a boolean ?
		do 
			Result := False
		end

	convertible_as_date : BOOLEAN is
			-- Is this value convertible to a date ?
		do 
			Result := False
		end

	convertible_as_time : BOOLEAN is
			-- Is this value convertible to a time ?
		do 
			Result := False
		end

	convertible_as_timestamp : BOOLEAN is
			-- Is this value convertible to a timestamp ?
		do 
			Result := False
		end

	convertible_as_string : BOOLEAN is 
		do
			Result := True
		end

	convertible_as_integer : BOOLEAN is 
		do
			Result := not is_null and then item.is_integer
		end

	convertible_as_double : BOOLEAN is 
		do
			Result := not is_null and then item.is_double
		end


	convertible_as_real : BOOLEAN is 
		do
			Result := not is_null and then item.is_real
		end
		
	c_type_code: INTEGER is
		once
			Result := sql_c_char
		end

	size: INTEGER is
		do
			Result := precision
		end

	sql_type_code: INTEGER is
		once
			Result := Sql_decimal
		end
	
--	decimal_digits: INTEGER is
--		do 
--			Result := 0
--		end

	display_size: INTEGER is
		do
			Result := transfer_octet_length - 1
		end

	transfer_octet_length: INTEGER is
		do
			Result := ecli_c_value_get_length (buffer)
		end

feature -- Element change

	set_item (value : STRING) is
			-- Set item to 'value', truncating if necessary.
		local
			actual_length, transfer_length : INTEGER
		do
			if value.count > capacity then
				actual_length := capacity
				transfer_length := capacity
			else
				actual_length := value.count + 1
				transfer_length := actual_length - 1
			end
--			create ext_item.make_shared_from_pointer (ecli_c_value_get_value (buffer), transfer_length)
			ext_item.from_string (value)
			ecli_c_value_set_length_indicator (buffer, transfer_length)
			count := value.count
		end

	set_from_decimal (value : MA_DECIMAL) is
		require
			value_exists: value /= Void
			value_precision_compatible: value.count <= precision
			decimal_digits_compatible: value.exponent <= 0 and then -(value.exponent) <= decimal_digits
		local
			l : MA_DECIMAL
			s : STRING
		do
			l := value  -- .rescale (-decimal_digits, value.shared_decimal_context)
			s := l.to_scientific_string
			if s.count <= capacity then
				set_item (s)
			end
		ensure
			set: as_decimal.is_equal (value)-- .rescale (-decimal_digits, value.shared_decimal_context))
		end
		
feature -- Conversion

	as_string : STRING is
			-- Conversion to STRING value
		do
			Result := clone (item)
		end

	as_integer : INTEGER is
		do
			Result := item.to_integer
		end
		
	as_double : DOUBLE is
		do
			Result := item.to_double
		end
		
	as_real : REAL is
		do 
			Result := item.to_real
		end
		
		
	out : STRING is
		do
			if is_null then
				Result := "NULL"
			else
				Result := item
			end
		end

	as_decimal : MA_DECIMAL is
		require
			not_null: not is_null
		local
			math_context : MA_DECIMAL_CONTEXT
		do
			create math_context.make (precision, 0)
			create Result.make_from_string_ctx (item, math_context)
		end

	as_character : CHARACTER is
			-- Current converted to CHARACTER 
		do
			do_nothing
		end

	as_boolean : BOOLEAN is
			-- Current converted to BOOLEAN
		do
			do_nothing
		end

	as_date : DT_DATE is
			-- Current converted to DATE
		do
			do_nothing
		end

	as_time : DT_TIME is
			-- Current converted to DT_TIME
		do
			do_nothing
		end

	as_timestamp : DT_DATE_TIME is
			-- Current converted to DT_DATE_TIME
		do
			do_nothing
		end

		
feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
			-- Trace content into `a_tracer'.
		do
			a_tracer.put_string (Current)
		end

	append_substring_to (i_start, i_end : INTEGER; string : STRING) is
			-- Append substring [i_start..i_end] to string.
		require
			i_start_ok: i_start > 0 and i_start <= i_end
			i_end_ok: i_end > 0 and i_end <= count
			string_exists: string /= Void
			not_null: not is_null
		do
			ext_item.append_substring_to (i_start, i_end, string)
		ensure
			string_set: string.substring (
				(old (string.count)) + 1, 
				string.count).is_equal (item.substring (i_start, i_end))			
		end

	bind_as_parameter (stmt : ECLI_STATEMENT; index: INTEGER) is
			-- Bind this value as input parameter 'index' of 'stmt'.
		do
			stmt.set_status (ecli_c_bind_parameter (stmt.handle,
				index,
				Parameter_directions.Sql_param_input,
				c_type_code,
				sql_type_code,
				size,
				decimal_digits,
				to_external,
				count,
				length_indicator_pointer))
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	impl_item : STRING

	ext_item : XS_C_STRING
	
end
