class MSGBOXCALLBACK_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: MSGBOXCALLBACK_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_msgboxcallback_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: MSGBOXCALLBACK_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_msgboxcallback_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_lphelpinfo: POINTER)is 
		do
			callback.on_callback (a_lphelpinfo) 
		end

invariant

	 callback_not_void: callback /= Void

end
