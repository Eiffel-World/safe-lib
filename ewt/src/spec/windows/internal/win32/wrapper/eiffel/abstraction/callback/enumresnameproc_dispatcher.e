class ENUMRESNAMEPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: ENUMRESNAMEPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_enumresnameproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: ENUMRESNAMEPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_enumresnameproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_hmodule: POINTER; a_lptype: POINTER; a_lpname: POINTER; a_lparam: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_hmodule, a_lptype, a_lpname, a_lparam) 
		end

invariant

	 callback_not_void: callback /= Void

end
