class PTOP_LEVEL_EXCEPTION_FILTER_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: PTOP_LEVEL_EXCEPTION_FILTER_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_ptop_level_exception_filter_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: PTOP_LEVEL_EXCEPTION_FILTER_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_ptop_level_exception_filter_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_exceptioninfo: POINTER): INTEGER is 
		do
			Result := callback.on_callback (a_exceptioninfo) 
		end

invariant

	 callback_not_void: callback /= Void

end
