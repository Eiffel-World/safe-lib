class ENUMRESTYPEPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: ENUMRESTYPEPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_enumrestypeproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: ENUMRESTYPEPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_enumrestypeproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_hmodule: POINTER; a_lptype: POINTER; a_lparam: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_hmodule, a_lptype, a_lparam) 
		end

invariant

	 callback_not_void: callback /= Void

end
