indexing
	description: "Reference columns for parameters."

	library: "Access_gen : Access Modules Generators utilities"
	
	author: "Paul G. Crismer"
	date: "$Date: 2003/06/11 13:11:16 $"
	revision: "$Revision: 1.2 $"

class
	REFERENCE_COLUMN

create
	make

feature {NONE} -- Initialization

	make (a_table, a_column : STRING) is
			-- Initialize `Current'.
		require
			a_table_not_void: a_table /= Void
			a_column_not_void: a_column /= Void
		do
			set_table (a_table)
			set_column (a_column)
		end

feature -- Access

	column: STRING
			-- column name

	table: STRING
			-- table name

feature -- Measurement

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature {NONE} -- Element change

	set_column (a_column: STRING) is
			-- Set `column' to `a_column'.
		require
			a_column_not_void: a_column /= Void
		do
			column := a_column
		ensure
			column_assigned: column = a_column
		end

	set_table (a_table: STRING) is
			-- Set `table' to `a_table'.
		require
			a_table_not_void: a_table /= Void
		do
			table := a_table
		ensure
			table_assigned: table = a_table
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here
	table_not_void: table /= Void
	column_not_void: column /= Void

end -- class REFERENCE_COLUMN
