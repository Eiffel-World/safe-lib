indexing
	description: "Objects that share a same catalog name."

	library: "Access_gen : Access Modules Generators utilities"
	
	author: "Paul G. Crismer"
	date: "$Date: 2006/03/07 17:10:10 $"
	revision: "$Revision: 1.6 $"

class
	SHARED_CATALOG_NAME

feature -- Access

	shared_catalog_name : STRING is
			-- 
		once
			create Result.make (0)
		end
		
feature -- Element change

	set_shared_catalog_name (a_name : STRING) is
			-- 
		require
			a_name_not_void: a_name /= Void
		do
			shared_catalog_name.copy (a_name)
		ensure
			shared_catalog_name_set: shared_catalog_name.is_equal (a_name)
		end


end -- class SHARED_CATALOG_NAME
--
-- Copyright (c) 2000-2006, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
