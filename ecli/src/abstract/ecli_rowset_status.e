indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2002/04/15 20:08:48 $"
	revision: "$Revision: 1.2 $"

class
	ECLI_ROWSET_STATUS

inherit

	C_ARRAY_INT16

	ECLI_EXTERNAL_API
		export 
			{NONE} all;
			{ANY} Sql_row_success, Sql_row_success_with_info, Sql_row_error
		end
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