indexing
	description: "Module parameter description by the user."

	library: "Access_gen : Access Modules Generators utilities"
	
	author: "Paul G. Crismer"
	date: "$Date: 2003/06/30 21:24:57 $"
	revision: "$Revision: 1.4 $"

class
	MODULE_PARAMETER

inherit
	HASHABLE
		redefine
			is_equal
		end
		
create
	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_reference_column: REFERENCE_COLUMN) is
			-- Initialize `Current'.
		require
			a_name_not_void: a_name /= Void
			a_reference_column_not_void: a_reference_column /= Void
		do
			set_name (a_name)
			set_reference_column (a_reference_column)
		ensure
			name_assigned: name = a_name
			reference_column_assigned: reference_column = a_reference_column			
		end

feature -- Access

	reference_column: REFERENCE_COLUMN
			-- column with which 'Current' is related

	name: STRING

	metadata : ECLI_COLUMN

	implementation : QA_VALUE
	
feature -- Measurement

	hash_code : INTEGER is 
		do
			Result := name.hash_code
		end
		
feature -- Status report

	check_validity (a_session : ECLI_SESSION; a_catalog_name, a_schema_name : STRING) is
			require
				a_session_not_void: a_session /= Void
				a_session_connected: a_session.is_connected
			local
				cursor : ECLI_COLUMNS_CURSOR
				nm : ECLI_NAMED_METADATA
			do
				create nm. make (a_catalog_name, a_schema_name, reference_column.table) 
				create cursor.make_query_column (nm,reference_column.column,a_session)
				if cursor.is_ok then
					cursor.start
					if not cursor.off then
						is_valid := True
						metadata := cursor.item
					else
						is_valid := False
						metadata := Void
					end
				else
					is_valid := False
					metadata := Void
				end
				cursor.close
			ensure
				valid_and_metadata: is_valid implies metadata /= Void
			end
			
	is_valid : BOOLEAN

			
feature -- Status setting

feature -- Cursor movement

feature {NONE} -- Element change

	set_reference_column (a_reference_column: REFERENCE_COLUMN) is
			-- Set `reference_column' to `a_reference_column'.
		require
			a_reference_column_not_void: a_reference_column /= Void
		do
			reference_column := a_reference_column
		ensure
			reference_column_assigned: reference_column = a_reference_column
		end

	set_name (a_name: STRING) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
		end

feature -- Element change

	set_implementation (value : QA_VALUE) is
			-- 
		require
			value_exists: value /= Void
		do
			implementation := value
		ensure
			implementation_assigned: implementation = value
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Comparison

	is_equal (other : like Current) : BOOLEAN is
			-- 
		do
			Result := name.is_equal (other.name) and then reference_column.is_equal (other.reference_column)
		end
		

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here
	name_not_void: name /= Void
	reference_column_not_void: reference_column /= Void

end -- class MODULE_PARAMETER
