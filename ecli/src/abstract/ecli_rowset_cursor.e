indexing
	description: "Objects that define a rowset cursor and allow sweeping through it.  Rows are physically retrieved `row_count' at a time, minimizing network traffic if any."
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 21:00:37 $"
	revision: "$Revision: 1.8.2.1 $"

class
	ECLI_ROWSET_CURSOR

inherit

	ECLI_ABSTRACT_ROW_CURSOR [ECLI_ARRAYED_VALUE, ECLI_VALUE]
		rename
			make as row_cursor_make, open as row_cursor_open,
			make_prepared as row_cursor_make_prepared, open_prepared as row_cursor_open_prepared
		export
			{NONE} row_cursor_make, row_cursor_open
		redefine
			start, create_row_buffers, fill_cursor,
			fetch_next_row, buffer_factory
		end

	ECLI_ROWSET_CAPABLE

creation
	make, make_prepared, open, open_prepared

feature -- Initialization

	make, open (a_session : ECLI_SESSION; a_definition : STRING; a_row_count : INTEGER) is
		require
			session_connected: a_session /= Void and then a_session.is_connected
			session_handles_arrayed_results: a_session.is_bind_arrayed_results_capable
			definition_exists: a_definition /= Void
			row_count_valid: a_row_count >= 1
		do
			row_capacity := a_row_count
			!!rowset_status.make (row_capacity)
			row_cursor_make (a_session, a_definition)
		ensure
			valid: is_valid
			definition_set: definition = a_definition
			definition_is_sql: equal (definition, sql)
			limit_set: buffer_factory.precision_limit = buffer_factory.Default_precision_limit
			row_count_set: row_capacity = a_row_count
		end

	make_prepared, open_prepared (a_session : ECLI_SESSION; a_definition : STRING; a_row_count : INTEGER) is
			-- make prepared cursor for `a_session' on `a_definition', for fetching at most `a_row_count' at a time
		require
			session_connected: a_session /= Void and then a_session.is_connected
			session_handles_arrayed_results: a_session.is_bind_arrayed_results_capable
			definition_exists: a_definition /= Void
			row_count_valid: a_row_count >= 1
		do
			make (a_session, a_definition, a_row_count)
			prepare
		ensure
			valid: is_valid
			definition_set: definition = a_definition
			definition_is_sql: equal (definition, sql)
			prepared_if_ok: is_ok implies is_prepared
			definition_is_a_query:  is_ok implies has_results
			limit_set: buffer_factory.precision_limit = buffer_factory.Default_precision_limit
			row_count_set: row_capacity = a_row_count
		end

feature -- Access

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

		start is
				-- Execute query `definition', positioning on first available result row
			do
				physical_fetch_count := 0; fetch_increment := 0
				Precursor
			ensure then
				cursor_exists: (is_executed and then has_results) implies (cursor /= Void and then cursor.count = result_columns_count)
				fetched_columns_count_set: (is_executed and then has_results) implies (fetched_columns_count = result_columns_count.min (cursor.count))
			end

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	buffer_factory : ECLI_ARRAYED_BUFFER_FACTORY

	create_buffer_factory is
		do
			!!buffer_factory.make (row_capacity)
		end

	create_row_buffers is
			-- Create `cursor' filled with ECLI_VALUE descendants
		do
			Precursor
			if cursor /= Void then
				bind_results
			end
		end

	bind_results is
			-- Bind results to cursor buffer values
		local
			index : INTEGER
		do
			--| Bind by column
			set_status (ecli_c_set_integer_statement_attribute (handle, Sql_attr_row_bind_type, Sql_bind_by_column))
			--| Declare maximum number of retrieved values at a time
			set_status (ecli_c_set_integer_statement_attribute (handle, Sql_attr_row_array_size, row_capacity))
			--| Declare status indicator array
			set_status (ecli_c_set_pointer_statement_attribute (handle, Sql_attr_row_status_ptr, rowset_status.to_external, 0))
			from index := 1
			until index > result_columns_count
			loop
				cursor.item (index).bind_as_result (Current, index)
				index := index + 1
			end
		end

	logical_fetch_count : INTEGER is
			-- logical number of fetch operations
		do
			Result := physical_fetch_count * row_capacity + fetch_increment
		end

	physical_fetch_count : INTEGER
			-- physical number of fetches (with database transfers)

	fetch_increment : INTEGER
			-- number of logical fetches since last physical one


	fill_cursor is
			-- update 'count' of all values in cursor
		local
			index : INTEGER
		do
			from index := 1
			until index > result_columns_count
			loop
				cursor.item (index).set_count (row_count)
				index := index + 1
			end
			fetched_columns_count := result_columns_count
		end

	fetch_next_row is
			-- logical fetch of one row
		do
			if physical_fetch_count > 0 and then row_count < row_capacity and then fetch_increment >= row_count then
					go_after
			else
				if fetch_increment \\ row_capacity = 0 then
					--| protect from moving GC
					collection_off
					--| Bind `row_count' a getting the actual number of rows fetched
					set_status (ecli_c_set_pointer_statement_attribute (handle, Sql_attr_rows_fetched_ptr, $row_count, 0))
					--| Do actual fetch
					Precursor
					--| restore GC
					collection_on
					fill_status_array
					start_values
					physical_fetch_count := physical_fetch_count + 1
					fetch_increment := 1
					fetched_columns_count := result_columns_count.min (cursor.count)
				else
					forth_values
					fetch_increment := fetch_increment + 1
				end
			end
		end

	start_values is
			-- call 'start' on each value in cursor
		local
			index : INTEGER
		do
			from index := 1
			until index > result_columns_count
			loop
				cursor.item (index).start
				index := index + 1
			end
		end

	forth_values is
			-- call 'forth' on each value in cursor
		local
			index : INTEGER
		do
			from index := 1
			until index > result_columns_count
			loop
				cursor.item (index).forth
				index := index + 1
			end

		end

invariant
	invariant_clause: True -- Your invariant here

end -- class ECLI_ROWSET_CURSOR
