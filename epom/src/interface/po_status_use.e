indexing

	description:

		"Objects that use a Persistence Operations Status"

	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/06/06 20:26:28 $"

deferred class PO_STATUS_USE

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

end