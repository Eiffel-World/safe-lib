indexing
	description: "SQL statement parameters : value and direction."
	author: ""
	date: "$Date: 2003/09/16 18:52:25 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECLI_STATEMENT_PARAMETER

inherit
	DS_CELL[ECLI_VALUE]
		export
			{NONE} put,make
		end
	
feature -- Status report

	is_input : BOOLEAN is
			-- is this an input parameter? Transfer is from application to RDBMS.
		deferred
		end

	is_output : BOOLEAN is
			-- is this an output parameter? Transfer is from RDBMS to application.
		deferred
		end
		
	is_input_output : BOOLEAN is
			-- is this an input/output parameter? Transfer is from application to RDBMS and vice versa.
		deferred
		end
		
feature -- Basic operations

	bind (statement : ECLI_STATEMENT; position : INTEGER) is
			-- 
		require
			statement_exists: statement /= Void
			positive_position: position > 0
		deferred
		end
		
invariant
	exclusive_direction: is_input xor is_output xor is_input_output
	item_set: item /= Void
	
end -- class ECLI_STATEMENT_PARAMETER
