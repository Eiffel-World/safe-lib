indexing
	description: "Persistent identifiers for BORROWER objects"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

class
	BORROWER_PID
	
inherit
	PO_PID
	
creation
	{BORROWER_ADAPTER} make
	
feature -- Initialization

	make (an_id : INTEGER) is
			-- make for `an_id'
		require
			an_id_gt0: an_id > 0
		do
			id := an_id
		ensure
			id_set: id = an_id
		end
		
feature -- Access

	class_name : BORROWER_PERSISTENT_CLASS_NAME is once create Result.make end
	
	id : INTEGER
	
feature -- Conversion

	to_string : STRING is
			-- 
		do
			create Result.make_from_string (class_name)
			Result.append_character(',')
			Result.append_string (id.out)
		end
		
invariant
	id_gt0: id > 0
	
end -- class BORROWER_PID
