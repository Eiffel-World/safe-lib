deferred class PVOID_DWORD_PVOID_ANONYMOUS_CALLBACK_CALLBACK

feature {PVOID_DWORD_PVOID_ANONYMOUS_CALLBACK_DISPATCHER}

	on_callback (a_dllhandle: POINTER; a_reason: INTEGER; a_reserved: POINTER)is 
		deferred
		end

end
