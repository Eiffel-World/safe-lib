indexing
	description: "Objects that iterate over the SQL types supported by a datasource"
	author: "Paul G. Crismer"
	date: "$Date: 2002/08/22 19:57:58 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_SQL_TYPES_CURSOR

inherit
--	ECLI_STATEMENT
--		rename
--			execute as statement_execute
--		export {NONE} all;
--			{ANY} start, forth , off, after, close
--		redefine
--			start, forth
--		end

	ECLI_CURSOR
		rename
			statement_start as start,
			close as cursor_close, statement_close as close
		export 
			{ANY} close
		redefine
			start, forth
		end

	ECLI_TYPE_CODES
		export {NONE} all;
		{ANY}
				sql_char,
				sql_numeric,
				sql_decimal,
				sql_integer,
				sql_smallint,
				sql_float,
				sql_real,
				sql_double,
				sql_varchar,
				sql_type_date,
				sql_type_time,
				sql_type_timestamp,
				sql_longvarchar
		end
		
create
	open_all_types, open_by_type
	
feature -- Initialization

	open_all_types (a_session : ECLI_SESSION) is
			-- make cursor for all types supported by `a_session'
		require
			session_opened: a_session /= Void and then a_session.is_connected
			closed: is_closed
		do
			make (a_session)
			get_type_info (ecli_c_sql_all_types)
		ensure
			executed: is_ok implies is_executed
			open: not is_closed
		end

	open_by_type (a_session : ECLI_SESSION; a_type : INTEGER) is
		require
			session_opened: a_session /= Void and then a_session.is_connected
			valid_type: supported_types.has (a_type)
			closed: is_closed
		do
			make (a_session)
			get_type_info (a_type)
		ensure
			executed: is_ok implies is_executed
			open: not is_closed
		end
		
		
feature -- Access

	item : ECLI_SQL_TYPE is
			-- current type description
		require
			not_off: not off
		do
			Result := impl_item
		ensure
			definition: Result /= Void
		end

	supported_types : ARRAY[INTEGER] is
			-- 
		once
			Result := <<
				sql_char,
				sql_numeric,
				sql_decimal,
				sql_integer,
				sql_smallint,
				sql_float,
				sql_real,
				sql_double,
				sql_varchar,
				sql_type_date,
				sql_type_time,
				sql_type_timestamp,
				sql_longvarchar
			>>
		end
		
feature -- Cursor Movement

	start is
		do
			if cursor  = Void then
				create_buffers
			end
			Precursor
			if not off then
				!!impl_item.make (Current)
			end	
		end
		
	forth is
		do
			Precursor
			if not off then
				!!impl_item.make (Current)
			else
				impl_item := Void				
			end
		end


feature {ECLI_SQL_TYPE} -- Status

	is_odbc_v3 : BOOLEAN is
			-- 
		do
			Result := result_columns_count > 15
		end

feature {ECLI_SQL_TYPE} -- Access

		buffer_type_name,
			buffer_literal_prefix,
			buffer_literal_suffix,
			buffer_create_params,
			buffer_local_type_name : ECLI_VARCHAR

		buffer_data_type,
			buffer_column_size,
			buffer_nullable,
			buffer_case_sensitive,
			buffer_searchable,
			buffer_unsigned_attribute,
			buffer_fixed_prec_scale,
			buffer_auto_unique_value,
			buffer_minimum_scale,
			buffer_maximum_scale,
			buffer_sql_data_type,
			buffer_sql_date_time_sub,
			buffer_num_prec_radix,
			buffer_interval_precision : ECLI_INTEGER
	
feature {NONE} -- Implementation

		create_buffers is
				-- create buffers for cursor
		do
			create buffer_type_name.make (40)
			create buffer_literal_prefix.make (20)
			create buffer_literal_suffix.make (20)
			create buffer_create_params.make (40)
			create buffer_local_type_name.make (40)
			
			create buffer_data_type.make
			create buffer_column_size.make
			create buffer_nullable.make
			create buffer_case_sensitive.make
			create buffer_searchable.make
			create buffer_unsigned_attribute.make
			create buffer_fixed_prec_scale.make
			create buffer_auto_unique_value.make 
			create buffer_minimum_scale.make
			create buffer_maximum_scale.make
			create buffer_sql_data_type.make
			create buffer_sql_date_time_sub.make
			create buffer_num_prec_radix.make
			create buffer_interval_precision.make
			
			set_cursor (<<
				buffer_type_name,
				buffer_data_type,
				buffer_column_size,
				buffer_literal_prefix,
				buffer_literal_suffix,
				buffer_create_params,
				buffer_nullable,
				buffer_case_sensitive,
				buffer_searchable,
				buffer_unsigned_attribute,
				buffer_fixed_prec_scale,
				buffer_auto_unique_value,
				buffer_local_type_name,
				buffer_minimum_scale,
				buffer_maximum_scale,
				buffer_sql_data_type,
				buffer_sql_date_time_sub,
				buffer_num_prec_radix,
				buffer_interval_precision
				>>)
		end

	impl_item : ECLI_SQL_TYPE
	
	definition : STRING is once Result := "SQLGetTypeInfo" end
	
	get_type_info (type : INTEGER) is
			-- 
		do
			set_status (ecli_c_get_type_info ( handle, type))
			if is_ok then
				get_result_columns_count
				is_executed := True
				if has_results then
					set_cursor_before
				else
					set_cursor_after
				end
	         else
	         	impl_result_columns_count := 0
			end
			create_buffers
		end
		
invariant
	invariant_clause: True -- Your invariant here

end -- class ECLI_SQL_TYPES_CURSOR
