indexing
	description: "Objects that hold shared information about ECLI_DECIMAL usage."
	author: "Paul G. Crismer"
	date: "$Date: 2010/10/26 09:04:10 $"
	revision: "$Revision: 1.3 $"

class
	SHARED_TYPE_USAGE

feature -- Access

	use_integer_64 : BOOLEAN is
			-- Is INTEGER_64 desirable?
		do
			Result := use_integer_64_cell.item
		end

	use_decimal : BOOLEAN is
			-- Is MA_DECIMAL desirable?
		do
			Result := use_decimal_cell.item
		end

	force_decimal : BOOLEAN is
			-- Is MA_DECIMAL used for every numeric type?
		do
			Result := force_decimal_cell.item
		end

	minimum_character_buffer_size : INTEGER
			-- Minimum buffer size for character/binary length data.
		do
			Result := minimum_character_buffer_size_cell.item
		end

	is_straigth_factory : BOOLEAN
			-- Is factory building instances in a straigth manner, i.e. without applying any intelligence?
		do
			Result := is_straigth_factory_cell.item
		end

feature {ACCESS_GEN} -- Element change

	set_use_decimal (value : BOOLEAN) is
			-- Set `use_decimal' to `value'.
		do
			use_decimal_cell.put (value)
		end

	set_use_integer_64 (value : BOOLEAN) is
			-- Set `use_integer_64' to `value'.
		do
			use_integer_64_cell.put (value)
		end

	set_force_decimal (value : BOOLEAN) is
			-- Set `use_integer_64' to `value'.
		do
			use_integer_64_cell.put (value)
		end

	set_minimum_character_buffer_size (value : INTEGER) is
			-- Set `minimimum_character_buffer_size'.
		do
			minimum_character_buffer_size_cell.put (value)
		end

	set_is_straigth_factory (value : BOOLEAN) is
			-- Set `is_straigth_factory'
		do
			is_straigth_factory_cell.put (value)
		end

feature {NONE} -- Implementation

	use_decimal_cell : DS_CELL [BOOLEAN] is
		once
			create Result.make (False)
		end

	use_integer_64_cell : DS_CELL [BOOLEAN] is
		once
			create Result.make (False)
		end

	force_decimal_cell : DS_CELL[BOOLEAN] is
		once
			create Result.make (False)
		end

	minimum_character_buffer_size_cell : DS_CELL[INTEGER] is
		once
			create Result.make (0)
		end

	is_straigth_factory_cell : DS_CELL[BOOLEAN] is
		once
			create Result.make (False)
		end

invariant

	use_decimal_cell_not_void: use_decimal_cell /= Void

end -- class SHARED_USE_DECIMAL
