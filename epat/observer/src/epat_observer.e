indexing
	description: "Interface for objects that should be notified for an update due to changes in a subject."
	author: "Fafchamps Eric"
	date: "$Date: 2001/11/28 10:20:39 $"
	revision: "$Revision: 1.1 $"

deferred class
	EPAT_OBSERVER

feature -- Basic operations

	update is
			-- Update `Current' to reflect subject changes.
		require	
			is_ready: is_ready
		deferred
		end

feature -- Status report

	is_ready: BOOLEAN is
			-- Is `Current' ready to update.
		deferred
		end

end -- class EPAT_OBSERVER
