deferred class PIMAGE_TLS_CALLBACK_CALLBACK

feature {PIMAGE_TLS_CALLBACK_DISPATCHER}

	on_callback (a_dllhandle: POINTER; a_reason: INTEGER; a_reserved: POINTER)is 
		deferred
		end

end
