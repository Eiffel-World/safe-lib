indexing
	description: "Objects that provide an EiffelBase implementation for PO_ADAPTERs"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

deferred class
	PO_ADAPTER_IMPL[G->PO_PERSISTENT]

inherit
	PO_ADAPTER[PO_PERSISTENT]

feature -- Access
	
	datastore: PO_DATASTORE

	last_cursor: PO_CURSOR [G]
	
	last_object: G

	last_pid: PO_PID

feature -- Status report

--	is_error: BOOLEAN
--	is_pid_valid (p: like last_pid): BOOLEAN is do  end

	
feature -- Measurement

	count: INTEGER

feature {PO_LAUNCHER} -- Element change

	set_datastore (a_datastore: PO_DATASTORE) is
		do
			datastore := a_datastore
		end
		
feature -- Basic operations

	exists (p: like last_pid): BOOLEAN  is do  end
	create_pid_from_object (an_object: G) is do  end
	read (pid: like last_pid) is do  end
	delete (object: like last_object) is do  end
	refresh (object: like last_object) is do  end
	update (object: like last_object) is do  end
	write (object: like last_object) is do  end
	
invariant
	invariant_clause: True -- Your invariant here

end -- class PO_ADAPTER_IMPL
