indexing
	description: "Objects that create arrayed buffers for rowset commands"
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 21:01:06 $"
	revision: "$Revision: 1.3.2.1 $"

class
	ECLI_ARRAYED_BUFFER_FACTORY

inherit
	ECLI_ABSTRACT_BUFFER_FACTORY [ECLI_ARRAYED_VALUE]

creation
	make

feature {NONE} -- Initialization

	make (a_row_count : INTEGER) is
			-- make buffer for 'a_row_count'
		do
			row_count := a_row_count
		ensure
			row_count_set: row_count = a_row_count
		end

feature -- Access


feature -- Measurement

	row_count : INTEGER

feature -- Status report

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

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	impl_value_factory : like value_factory

	value_factory : ECLI_ARRAYED_VALUE_FACTORY is
		do
			if impl_value_factory = Void then
				create impl_value_factory.make (row_count)
			end
			Result := impl_value_factory
		end

	value_anchor : ECLI_ARRAYED_VALUE is
			--
		do

		end

invariant
	invariant_clause: -- Your invariant here

end -- class ECLI_ARRAYED_BUFFER_FACTORY
