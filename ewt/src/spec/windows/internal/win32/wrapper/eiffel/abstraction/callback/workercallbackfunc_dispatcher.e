class WORKERCALLBACKFUNC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: WORKERCALLBACKFUNC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_workercallbackfunc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: WORKERCALLBACKFUNC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_workercallbackfunc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER)is 
		do
			callback.on_callback (a_anonymous_1) 
		end

invariant

	 callback_not_void: callback /= Void

end
