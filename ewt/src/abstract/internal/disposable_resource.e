indexing
	description: "Disposable resources"
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

deferred class
	DISPOSABLE_RESOURCE

feature -- Status report

	is_resource_disposed : BOOLEAN is
			-- Is the resource disposed ?
		deferred
		end
		
feature -- Basic operations

	dispose_resource  is
			-- Dispose resource
		deferred
		ensure
			is_resource_disposed: is_resource_disposed
		end
		
end -- class DISPOSABLE_RESOURCE
