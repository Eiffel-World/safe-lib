indexing
	description: "Key Table abstraction"
	author: ""
	date: "$Date: 2003/12/29 16:49:48 $"
	revision: "$Revision: 1.1 $"

class
	KEY_TABLE

creation
	make
	
feature {NONE} -- Initialization

	make is
		do
			create code_map.make (1, 0)
		end
		
feature -- Access

	swt_from_internal (internal_code : INTEGER) : INTEGER is
			-- swt code from internal code
--		require
--			mapped_internal: mapped_internal (internal_code)
		local
			index : INTEGER
		do
			index := map_index (internal_code, True)
			if index > 0 then
				Result := code_map.item (index)
			end
		end
		
	internal_from_swt (swt_code : INTEGER) : INTEGER is
			-- internal code from swt code
--	require
--		mapped_swt: mapped_swt (swt_code)
	local
			index : INTEGER
		do
			index := map_index (swt_code, False)
			if index > 0 then
				Result := code_map.item (index)
			end
		end
		
feature -- Measurement

	count : INTEGER is
		do
			Result := code_map.count // 2
		end
		
feature -- Status report

	mapped_internal (internal_code : INTEGER) : BOOLEAN is
			-- does a map [internal_code, ?] exist ?
		local
			index : INTEGER
		do
			index := map_index (internal_code, True)
			if index > 0 then
				Result := True
			end
		end

	mapped_swt (swt_code : INTEGER) : BOOLEAN is
			-- does a map [?, swt_code] exist ?
		local
			index : INTEGER
		do
			index := map_index (swt_code, False)
			if index > 0 then
				Result := True
			end
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	put (internal_code, swt_code : INTEGER) is
		require
			not_mapped_internal: not mapped_internal (internal_code)
			not_mapped_swt: not mapped_swt (swt_code)
		do
			code_map.force (internal_code, code_map.upper + 1)
			code_map.force (swt_code, code_map.upper + 1)
		ensure
			mapped_internal: internal_from_swt (swt_code) = internal_code
			mapped_swt: swt_from_internal (internal_code) = swt_code
			count_incremented: count = old count + 1
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

	code_map : ARRAY[INTEGER]
	
	map_index (swt_code : INTEGER; internal : BOOLEAN) : INTEGER is
		local
			upper, index : INTEGER
		do
			from
				if internal then
					index := internal_lower_index
				else
					index := swt_lower_index
				end
				upper := code_map.upper
			until
				Result > upper or else code_map.item (index) = swt_code
			loop
				index := index + index_increment
			end
			if index > upper then
				Result := 0
			else
				Result := index
			end
		end
	
	internal_lower_index : INTEGER is 1
	swt_lower_index : INTEGER is 2
	index_increment : INTEGER is 2
	
invariant
	code_map_exists: code_map /= Void
	code_map_count_even: code_map.count \\ 2 = 0
	
end -- class KEY_TABLE
