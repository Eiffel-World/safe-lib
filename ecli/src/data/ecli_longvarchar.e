indexing
	description: 
	
		"SQL LONGVARCHAR (n) values"
		
	author: "Paul-G.Crismer"
	date: "$Date: 2003/08/19 15:59:09 $"
	revision: "$Revision: 1.18 $"
	licensing: "See notice at end of class"

class
	ECLI_LONGVARCHAR

inherit
	ECLI_GENERIC_VALUE [STRING]
		redefine
			item, set_item,convertible_as_string, as_string, out, convertible_as_character, as_character,
			convertible_as_integer, as_integer, convertible_as_double, as_double, impl_item
		end
	
creation
	make

feature {NONE} -- Initialization

	make (n : INTEGER) is
		require
			n > 0 and n <= max_capacity
		local
			s : STRING
		do
			buffer := ecli_c_alloc_value (n+1)
			create s.make (0)
			impl_item := s
			set_null
		ensure
			is_null: is_null
			capacity: capacity = n
		end
		
feature -- Access

	item : STRING is
		do
			if is_null then
				Result := Void
			else
				string_copy_from_pointer (impl_item,ecli_c_value_get_value (buffer))
				Result := impl_item
			end
		end

	max_capacity : INTEGER is
		do
			Result := 1_000_000
		end

	capacity : INTEGER is
		do
			Result := ecli_c_value_get_length (buffer) - 1
		end

	count : INTEGER is
			-- actual length of item
		do
			if not is_null then
				Result := ecli_c_value_get_length_indicator (buffer)
			end
		end

feature -- Measurement

feature -- Status report

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

	convertible_as_character : BOOLEAN is
		do
			Result := count > 0
		end
		
	c_type_code: INTEGER is
		once
			Result := sql_c_char
		end

	size: INTEGER is
		do
			Result := display_size
		end

	sql_type_code: INTEGER is
		once
			Result := sql_longvarchar
		end
	
	decimal_digits: INTEGER is
		do 
			Result := 0
		end

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
			-- set item to 'value', truncating if necessary
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
			create ext_item.make_shared_from_pointer (ecli_c_value_get_value (buffer), transfer_length)
			ext_item.from_string (value)
			ecli_c_value_set_length_indicator (buffer, transfer_length)
		end
			
feature -- Conversion

	as_string : STRING is
			-- Conversion to STRING value
		do
			Result := clone (item)
		end

	as_character : CHARACTER is
			-- Conversion to CHARACTER value
		do
			Result := item @ 1
		ensure then
			result_is_first_character: Result = item @ 1
		end

	as_integer : INTEGER is
			-- 
		do
			Result := item.to_integer
		end
		
	as_double : DOUBLE is
			-- 
		do
			Result := item.to_double
		end
		
feature -- Basic operations

	out : STRING is
		do
			if is_null then
				Result := "NULL"
			else
				Result := item
			end
		end

	trace (a_tracer : ECLI_TRACER) is
		do
			a_tracer.put_string (Current)
		end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	octet_size : INTEGER is do Result := transfer_octet_length end

	impl_item : STRING

	ext_item : XS_C_STRING
	
end -- class ECLI_LONGVARCHAR
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
