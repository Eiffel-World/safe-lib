indexing
	description: "Objects that give access to a shared columns repository object"
	author: "Paul G. Crismer"
	date: "$Date: 2003/09/16 18:52:26 $"
	revision: "$Revision: 1.1 $"

class
	SHARED_COLUMNS_REPOSITORY

feature -- Access

	shared_columns_repository : COLUMNS_REPOSITORY is
			-- shared columns repository object
		do
			Result := columns_repository_cell.item	
		ensure
			repository_exists: Result /= Void
		end
		
feature -- Element change

	set_shared_columns_repository (new_columns_repository : COLUMNS_REPOSITORY) is
			-- set shared object as `new_columns_repository'
		require
			new_columns_repository_not_void: new_columns_repository /= Void
		do
			columns_repository_cell.put (new_columns_repository)
		ensure
			shared_columns_repository_set: shared_columns_repository = new_columns_repository
		end

feature -- Implementation

	columns_repository_cell : DS_CELL[COLUMNS_REPOSITORY] is
			-- 
		once
			create Result.make (Void)
		end
		
end -- class SHARED_COLUMNS_REPOSITORY
