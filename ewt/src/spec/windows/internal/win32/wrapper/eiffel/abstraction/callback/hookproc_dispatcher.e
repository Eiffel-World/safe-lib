class HOOKPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: HOOKPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_hookproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: HOOKPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_hookproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_code: INTEGER; a_wparam: INTEGER; a_lparam: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_code, a_wparam, a_lparam) 
		end

invariant

	 callback_not_void: callback /= Void

end
