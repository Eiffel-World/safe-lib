indexing
	description: "Objects that are capable of operating on a rowset."
	author: ""
	date: "$Date: 2002/09/03 20:35:50 $"
	revision: "$Revision: 1.3 $"

class
	ECLI_ROWSET_CAPABLE

feature -- Measurement

	row_capacity : INTEGER
			-- maximum number of rows in this rowset
	
feature -- Status report

	item_status (index : INTEGER) : INTEGER is
			-- status of `index'th value in current rowset
		do
			Result := rowset_status.item (index)
		end

	row_count : INTEGER
			-- number of rows processed by rowset operation

feature {NONE} -- implementation
	
	rowset_status : ECLI_ROWSET_STATUS
	
	status_array : ARRAY[INTEGER]
	
	fill_status_array is
			-- 
		local
			index: INTEGER
		do
			from index := 1
				!!status_array.make (1, row_capacity)
			until index > row_capacity
			loop
				status_array.put (rowset_status.item (index), index)
				index := index + 1
			end
		end
		

invariant
	row_capacity_valid: row_capacity >= 1
	row_count_valid: row_count <= row_capacity

end -- class ECLI_ROWSET_CAPABLE
