indexing
	description: "Objects that represent ARRAYs of typed values to be exchanged with the database.%
		% These mainly are exchange buffers.  The capacity is set at creation and cannot be changed.%
		% The actual number of elements to take into account is set using set_count.%
		% 'set_count' must not be used by a client except when passing parameters.  The other private usage is %
		% when a rowset_cursor fetches the last set of data (usually less than the capacity)."

	author: "Paul G. Crismer"

	usage: "Used in row-set operations : column-wise binding for result-sets, %
		% or column-wise binding of parameters for modifications.%
		% Access modes: direct ('item_at'), linear ('start', 'forth', 'item')."

	date: "$Date: 2003/02/27 16:49:02 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECLI_GENERIC_ARRAYED_VALUE [G]

inherit

	ECLI_ARRAYED_VALUE
		redefine
			out
		end


feature -- Access

	item_at (index : INTEGER) : G is
			-- item at `index'th position
		require
			valid_index: index >= lower and index <= count
			not_null: not is_null_at (index)
		deferred
		end

feature -- Element change

	set_item_at (value : G; index : INTEGER) is
			-- set `index'th value to `value'
		require
			valid_index: index >= lower and index <= count
		deferred
		ensure
--			item_set: equal (item_at (index), truncated (value))
			not_null: not is_null_at (index)
		end

	set_item (value : G) is
		do
			set_item_at (value, cursor_index)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

	out : STRING is
		local
			i : INTEGER
		do
			from i := 1
				!!Result.make (10)
				Result.append_string ("<<")
			until i > count
			loop
				if is_null_at (i) then
					Result.append_string ("NULL")
				else
					Result.append_string (out_item_at (i))
				end
				i := i + 1
				if i <= count then
					Result.append_string (", ")
				end
			end
			Result.append_string (">>")
		end

	truncated (value : G) : G is
		deferred
		end
		
		
feature {NONE} -- Implementation


	out_item_at (index : INTEGER) : STRING is
		do
			Result := item_at (index).out
		end

end -- class ECLI_GENERIC_ARRAYED_VALUE
