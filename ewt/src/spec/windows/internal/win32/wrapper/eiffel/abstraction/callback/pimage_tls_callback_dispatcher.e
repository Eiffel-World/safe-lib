class PIMAGE_TLS_CALLBACK_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: PIMAGE_TLS_CALLBACK_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_pimage_tls_callback_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: PIMAGE_TLS_CALLBACK_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_pimage_tls_callback_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_dllhandle: POINTER; a_reason: INTEGER; a_reserved: POINTER)is 
		do
			callback.on_callback (a_dllhandle, a_reason, a_reserved) 
		end

invariant

	 callback_not_void: callback /= Void

end
