class WAITORTIMERCALLBACKFUNC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: WAITORTIMERCALLBACKFUNC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_waitortimercallbackfunc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: WAITORTIMERCALLBACKFUNC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_waitortimercallbackfunc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER; a_anonymous_2: INTEGER)is 
		do
			callback.on_callback (a_anonymous_1, a_anonymous_2) 
		end

invariant

	 callback_not_void: callback /= Void

end
