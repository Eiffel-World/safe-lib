class PTHREAD_START_ROUTINE_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: PTHREAD_START_ROUTINE_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_pthread_start_routine_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: PTHREAD_START_ROUTINE_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_pthread_start_routine_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_lpthreadparameter: POINTER): INTEGER is 
		do
			Result := callback.on_callback (a_lpthreadparameter) 
		end

invariant

	 callback_not_void: callback /= Void

end
