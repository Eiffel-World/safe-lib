class EDITWORDBREAKPROCW_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: EDITWORDBREAKPROCW_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_editwordbreakprocw_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: EDITWORDBREAKPROCW_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_editwordbreakprocw_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_lpch: POINTER; a_ichcurrent: INTEGER; a_cch: INTEGER; a_code: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_lpch, a_ichcurrent, a_cch, a_code) 
		end

invariant

	 callback_not_void: callback /= Void

end
