indexing
	description: "Objects that use a Persistence Operations Status"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:53 $"
	revision: "$Revision: 1.1 $"

deferred class
	PO_STATUS_USE

feature -- Access

	status : PO_STATUS is
			-- status related to latest persistance operation
		do
			if impl_status = Void then
				create impl_status
			end
			Result := impl_status
		end

feature {NONE} -- Implementation

	impl_status : like status
	
invariant
	status_not_void: status /= Void

end -- class PO_STATUS_USE
