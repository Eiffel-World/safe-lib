indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/06/11 13:11:16 $"
	revision: "$Revision: 1.2 $"

class
	SHARED_SCHEMA_NAME

feature -- Access

	shared_schema_name : STRING is
			-- 
		once
			create Result.make (0)
		end
		
feature -- Element change

	set_shared_schema_name (a_name : STRING) is
			-- 
		require
			a_name_not_void: a_name /= Void
		do
			shared_schema_name.copy (a_name)
		ensure
			shared_schema_name_set: shared_schema_name.is_equal (a_name)
		end

end -- class SHARED_SCHEMA_NAME
