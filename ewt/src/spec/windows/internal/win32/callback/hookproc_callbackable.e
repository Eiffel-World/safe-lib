indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 16:47:12 $"
	revision: "$Revision: 1.1 $"

deferred class
	HOOKPROC_CALLBACKABLE

feature
	
	call_hook_procedure (ncode, wparam, lparam : INTEGER) : INTEGER is
		deferred
		end

end -- class HOOKPROC_CALLBACK
