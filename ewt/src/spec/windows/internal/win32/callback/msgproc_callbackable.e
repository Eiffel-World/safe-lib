indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 16:47:12 $"
	revision: "$Revision: 1.1 $"

deferred class
	MSGPROC_CALLBACKABLE


feature
	
	call_message_procedure (hwnd : POINTER; msg, lparam, wparam : INTEGER) : INTEGER is
		deferred
		end

end -- class MSGPROC_CALLBACKABLE
