indexing
	description: 
	
		"Objects that reflect status of rowset operations. They basically are an array of integer."

	author: "Paul G. Crismer "
	date: "$Date: 2004/01/29 20:30:37 $"
	revision: "$Revision: 1.10 $"

class
	ECLI_ROWSET_STATUS

inherit

	XS_C_ARRAY_INT16

	ECLI_EXTERNAL_API
		export 
			{NONE} all;
			{ANY} Sql_row_success, Sql_row_success_with_info, Sql_row_error,
				  Sql_row_deleted, Sql_row_updated,	Sql_row_norow, Sql_row_added
		end
	
creation
	make

feature -- Status report

	is_ok (index : INTEGER) : BOOLEAN is
			-- is `index'-th status ok?
		require
			valid_index: index >= 1 and index <= count
		do
			Result := (item (index) = Sql_row_success) or else (item (index) = Sql_row_success_with_info)
		end

	is_error (index : INTEGER) : BOOLEAN is
			-- is `index'-th status in error ?
		require
			valid_index: index >= 1 and index <= count
		do
			Result := (item (index) = Sql_row_error)
		end

end -- class ECLI_ROWSET_STATUS
