indexing
	description: "SQL BINARY (n) data objects."
	author: "Paul G. Crismer"
	
	library: "ECLI"
	
	date: "$Date: 2004/05/18 11:17:38 $"
	revision: "$Revision: 1.2 $"

class
	ECLI_BINARY

inherit
	ECLI_BINARY_VALUE
		redefine
			formatted
		end
		
creation
	make
	
feature -- Access

	max_capacity : INTEGER is
			-- 
		once
			Result := 8_192
		end

	sql_type_code : INTEGER is
			-- 
		once
			Result := sql_binary
		end
		
feature -- Inapplicable

	formatted (v : like item) : like item is
		do
			create Result.make_from_string (v)
			format (Result)
		end

feature {NONE} -- Implementation

	pad (s : STRING) is
			-- pad 's' with blanks
		do
			from
			until
				s.count = capacity
			loop
				s.append_character ('%/0/')
			end
		ensure
			s.count = capacity
		end

	format (s : STRING) is
			-- format 's' according to 'capacity'
		require
			s_not_void: s /= Void
		do
			if s.count > count then
				s.keep_head (capacity)
			else
				pad (s)
			end
		end

end -- class ECLI_BINARY
