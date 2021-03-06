indexing
	description: "Objects that handle cached accesses to database repository."
	author: "Paul G. Crismer"
	date: "$Date: 2008/05/16 07:39:37 $"
	revision: "$Revision: 1.5 $"

class
	COLUMNS_REPOSITORY

create
	make

feature {NONE} -- Initialization

	make (current_session : ECLI_SESSION) is
			-- make repository for `current_session'
		require
			current_session_not_void: current_session /= Void
			current_session_connected: current_session.is_connected
		do
			session := current_session
			create columns.make (30)
		ensure
			session_set: session = current_session
		end

feature -- Access

	last_column : ECLI_COLUMN
			-- Last column found in the repository

	session : ECLI_SESSION
			-- Session on which the database repository is searched.

feature -- Status report

	found : BOOLEAN
			-- Has the last search succeeded?

feature -- Basic operations

	search (catalog_name, schema_name, table_name, column_name : STRING) is
			-- Search columns corresponding to `catalog_name', `schema_name', `table_name', `column_name'.
		require
			table_name_not_void: table_name /= Void
			columne_name_not_void: column_name /= Void
		local
			cursor : ECLI_COLUMNS_CURSOR
			nm : ECLI_NAMED_METADATA
			id : STRING
		do
			id := hash_identifiant (catalog_name, schema_name, table_name, column_name)
			columns.search (id)
			if columns.found then
				last_column := columns.found_item
			else
				last_column := Void
				create nm.make (catalog_name, schema_name, table_name)
				create cursor.make_query_column ( nm, column_name, session)
				--| Fix for Oracle driver that returns fool results.  Retrieve all results.
				from
					if cursor.is_ok then
						cursor.start
					end
				until
					not cursor.is_ok or else cursor.off
				loop
					columns.force (cursor.item, hash_identifiant (catalog_name, schema_name, table_name, cursor.item.name))
					cursor.forth
				end
				cursor.close
				columns.search (id)
				if columns.found then
					last_column := columns.found_item
				else
					last_column := Void
					columns.force (Void, id)
				end
			end
			if last_column = Void then
				found := False
			else
				found := True
			end
		ensure
			found_implies_last_column_not_Void: found implies last_column /= Void
		end

feature {NONE} -- Implementation

	hash_identifiant (catalog_name, schema_name, table_name, column_name : STRING) : STRING is
		require
			table_name_not_void: table_name /= Void
			columne_name_not_void: column_name /= Void
		do
			create Result.make (50)
			if catalog_name /= Void then
				Result.append_string (catalog_name)
			end
			Result.append_character (hash_delimiter)
			if schema_name /= Void then
				Result.append_string (schema_name)
			end
			Result.append_character (hash_delimiter)
			Result.append_string (table_name)
			Result.append_character (hash_delimiter)
			Result.append_string (column_name)
		ensure
			result_not_void: Result /= Void
		end

	hash_delimiter : CHARACTER is '|'

	columns : DS_HASH_TABLE[ECLI_COLUMN, STRING]

end -- class COLUMNS_REPOSITORY
