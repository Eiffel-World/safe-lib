indexing
	description: "Objects that reflect status of rowset operations.  They basically are an array of integer."
	author: "Paul G. Crismer <pgcrism at pi.be>"
	date: "$Date: 2002/09/03 20:35:50 $"
	revision: "$Revision: 1.4 $"

class
	ECLI_ROWSET_STATUS

inherit

	C_ARRAY_INT16

	ECLI_EXTERNAL_API
		export 
			{NONE} all;
			{ANY} Sql_row_success, Sql_row_success_with_info, Sql_row_error,
				  Sql_row_deleted, Sql_row_updated,	Sql_row_norow, Sql_row_added
		end
	
	ANY
	
creation
	make

feature -- Status report

	is_ok (index : INTEGER) : BOOLEAN is
			--
		require
			valid_index: index >= 1 and index <= count
		do
			Result := (item (index) = Sql_row_success) or else (item (index) = Sql_row_success_with_info)
		end

	is_error (index : INTEGER) : BOOLEAN is
			--
		require
			valid_index: index >= 1 and index <= count
		do
			Result := (item (index) = Sql_row_error)
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	to_external : POINTER is
			--
		do
			Result := handle
		end

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class ECLI_ROWSET_STATUS
