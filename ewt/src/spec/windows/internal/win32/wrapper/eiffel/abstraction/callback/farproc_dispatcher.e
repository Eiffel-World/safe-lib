class FARPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: FARPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_farproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: FARPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_farproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback : INTEGER is 
		do
			Result := callback.on_callback 
		end

invariant

	 callback_not_void: callback /= Void

end
