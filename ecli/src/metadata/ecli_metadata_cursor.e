indexing
	description: "Objects that open a cursor on database metadata"
	author: "Paul G. Crismer"
	
	library: "ECLI"
	
	date: "$Date: 2003/09/16 18:52:26 $"
	revision: "$Revision: 1.10 $"
	licensing: "See notice at end of class"

deferred class
	ECLI_METADATA_CURSOR

inherit

	ECLI_CURSOR
		rename
			statement_start as start, make as cursor_make
		export
			{ANY} close
		redefine
			start, forth, create_buffers, definition
		end

feature {NONE} -- Initialization

	make (a_name : ECLI_NAMED_METADATA; a_session : ECLI_SESSION) is
			-- Void values for a_name.catalog, a_name.schema, a_name.name can be Void are 'wildcards'
		require
			a_name_not_void: a_name /= Void
			a_session_not_void: a_session /= Void
			a_session_connected: a_session.is_connected
		local
			catalog_length, schema_length, name_length : INTEGER
			p_catalog, p_schema, p_name : POINTER
		do
			cursor_make (a_session)
			if a_name.catalog /= Void then
				create queried_catalog_impl.make_from_string (a_name.catalog)
				catalog_length := a_name.catalog.count
				p_catalog := queried_catalog_impl.handle
			end
			if a_name.schema /= Void then
				create queried_schema_impl.make_from_string (a_name.schema)
				schema_length := a_name.schema.count
				p_schema := queried_schema_impl.handle
			end
			if a_name.name /= Void then
				create queried_name_impl.make_from_string (a_name.name)
				name_length := a_name.name.count
				p_name := queried_name_impl.handle
			end
			set_status (
				do_query_metadata ( 
					p_catalog, catalog_length,
					p_schema, schema_length, 
					p_name, name_length))
			update_state_after_execution
		ensure
			executed: is_ok implies is_executed
			queried_catalog_set: a_name.catalog /= Void implies queried_catalog.is_equal (a_name.catalog)
			queried_schema_set: a_name.schema /= Void implies queried_schema.is_equal (a_name.schema)
			queried_name_set: a_name.name /= Void implies queried_name.is_equal (a_name.name)
		end

feature -- Access

	queried_catalog : STRING is
			-- queried catalog name
		do
			if queried_catalog_impl /= Void then
				Result := queried_catalog_impl.as_string
			end
		end
		
	queried_schema : STRING is
			-- queried schema name
		do
			if queried_name_impl /= Void then
				Result := queried_schema_impl.as_string
			end	
		end
		
	queried_name : STRING is
			-- queried name (table, column or procedure)
		do
			if queried_name_impl /= Void then
				Result := queried_name_impl.as_string
			end
		end
		
	item : ANY is
			-- item at current cursor position
		require
			not_off: not off
		do
			Result := impl_item
		ensure
			definition: Result /= Void
		end

feature -- Cursor Movement

	start is
			-- advance cursor at first item if any
		do
			if results  = Void then
				create_buffers
			end
			Precursor
			if not off then
				create_item
			else
				impl_item := Void
			end
		end

	forth is
			-- advance cursor to next item
		do
			Precursor
			if not off then
				create_item
			end
		end

feature {NONE} -- Implementation

	create_buffers is
			-- create buffers for cursor
		deferred
		end

	create_item is
			-- create item from current cursor value
		deferred
		end

	impl_item : like item

	definition : STRING is
			-- definition of query
	 	deferred
	 	end

	update_state_after_execution is
			-- post_make action
		do
			if is_ok then
				get_result_columns_count
				is_executed := True
				if has_result_set then
					set_cursor_before
					create_buffers
				else
					set_cursor_after
				end
			else
				impl_result_columns_count.put (0)
			end
		end

	do_query_metadata (a_catalog : POINTER; a_catalog_length : INTEGER;
		a_schema : POINTER; a_schema_length : INTEGER;
		a_name : POINTER; a_name_length : INTEGER) : INTEGER is
			-- query metadata
		deferred
		end

	queried_catalog_impl : XS_C_STRING
	queried_schema_impl : XS_C_STRING
	queried_name_impl : XS_C_STRING
	
end -- class ECLI_METADATA_CURSOR
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
