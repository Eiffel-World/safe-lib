indexing
	description: "Commands that list the columns of a table."
	author: "Paul G. Crismer"
	date: "$Date: 2003/12/22 10:09:03 $"
	revision: "$Revision: 1.6 $"

class
	ISQL_CMD_COLUMNS

inherit
	ISQL_COMMAND

feature -- Access

	help_message : STRING is
		do
			Result := padded ("col[umns] <table-name>", command_width)
			Result.append_string ("List all columns in <table-name>.")
		end

	match_string : STRING is once Result := "col" end
	
feature -- Status report
	
	needs_session : BOOLEAN is True
	
	matches (text: STRING) : BOOLEAN is
		do
			Result := matches_single_string (text, match_string)
		end
		
feature -- Basic operations

	execute (text : STRING; context : ISQL_CONTEXT) is
			-- show columns
		local
			stream : KL_WORD_INPUT_STREAM
			l_table, l_schema, l_catalog : STRING
			query : ECLI_NAMED_METADATA
			cursor : like cursor_type
		do
			create stream.make (text, " %T")
			stream.read_word
			if not stream.end_of_input then
				--| try reading table_name
				stream.read_quoted_word
				if not stream.end_of_input then
					l_table := clone (stream.last_string)
					if stream.is_last_string_quoted then
						l_table := l_table.substring (2, l_table.count-1)
					end
					stream.read_quoted_word
					if not stream.end_of_input then
						l_schema := l_table
						l_table := clone (stream.last_string)
						if stream.is_last_string_quoted then
							l_table := l_table.substring (2, l_table.count-1)
						end
						stream.read_quoted_word
						if not stream.end_of_input then
							l_catalog := l_schema
							l_schema := l_table
							l_table := clone (stream.last_string)
							if stream.is_last_string_quoted then
								l_table := l_table.substring (2, l_table.count-1)
							end
						end
					end
				end
				create query.make (l_catalog, l_schema, l_table)
				cursor := new_cursor (query, context.session)
				put_results (cursor, context)
				cursor.close
			end
		end
		
feature {NONE} -- Implementation

	new_cursor (a_table: ECLI_NAMED_METADATA; a_session: ECLI_SESSION) : ECLI_COLUMNS_CURSOR is
			-- 
		do
				create Result.make (a_table, a_session)
		end
		
	put_results (a_cursor : like cursor_type; context : ISQL_CONTEXT) is
			-- 
		local
			the_column : like column_type
		do
			if a_cursor.is_executed then
				from
					a_cursor.start
					context.filter.begin_heading
					put_heading (context.filter)
					context.filter.end_heading
				until
					not a_cursor.is_ok or else a_cursor.off
				loop
					the_column := a_cursor.item
					context.filter.begin_row
					put_detail (the_column, context.filter)
					context.filter.end_row
					a_cursor.forth
				end			
			else
				context.filter.begin_error
				context.filter.put_error (sql_error_msg (a_cursor, "Cannot get columns metadata"))				
				context.filter.end_error
			end
		end

	put_heading (filter : ISQL_FILTER) is
			-- 
		require
			filter_exists: filter /= Void
			filter_heading_begun: filter.is_in_heading
		do
			filter.put_heading ("COLUMN_NAME")
			filter.put_heading ("TYPE")
			filter.put_heading ("SIZE")
			filter.put_heading ("DESCRIPTION")
		end
		
	put_detail (the_column : like column_type; filter : ISQL_FILTER) is
			-- 
		require
			the_column_exists: the_column /= Void
			filter_exists: filter /= Void
			filter_row_begun: filter.is_in_row
		do
			filter.put_column (nullable_string (the_column.name))
			filter.put_column (nullable_string (the_column.type_name))
			filter.put_column (nullable_string (the_column.size.out))
			filter.put_column (nullable_string (the_column.description))
		end
	
	column_type : ECLI_COLUMN is do end
	cursor_type : ECLI_COLUMNS_CURSOR is do end
	
	
end -- class ISQL_CMD_COLUMNS
