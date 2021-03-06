indexing
	description: "RDBMS result metadata."

	library: "Access_gen : Access Modules Generators utilities"

	author: "Paul G. Crismer"
	date: "$Date: 2012/07/18 14:45:26 $"
	revision: "$Revision: 1.3 $"

class
	RDBMS_ACCESS_RESULT

inherit
	RDBMS_ACCESS_METADATA

	HASHABLE
		undefine
			is_equal
		end

create
	make

feature {NONE} -- Initialization

	make (the_metadata : ECLI_COLUMN_DESCRIPTION; maximum_length : INTEGER) is
			-- Initialize `Current'.
		require
			the_metadata_not_void: the_metadata /= Void
		do
			metadata := the_metadata
			if maximum_length > 0 then
				size_impl := maximum_length.min (metadata.size.as_integer_32)
			else
				size_impl := metadata.size.as_integer_32
			end
		ensure
			metadata_assigned: metadata = the_metadata
		end

feature {NONE}-- Access

	metadata : ECLI_COLUMN_DESCRIPTION

feature -- Access


	sql_type_code : INTEGER is
		do
			Result := metadata.sql_type_code
		end

	size : INTEGER is
		do
			Result := size_impl -- metadata.size
		end

	decimal_digits : INTEGER is
		do
			Result := metadata.decimal_digits
		end

	name : STRING is
		do
			Result := metadata.name.twin
			Result.to_lower
		end

feature -- Status report

	metadata_available : BOOLEAN is
		do
			Result := metadata /= Void
		end

feature {NONE} -- implementation

	size_impl : INTEGER

end -- class MODULE_RESULT
--
-- Copyright (c) 2000-2006, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
