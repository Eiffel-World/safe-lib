class ICMENUMPROCW_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: ICMENUMPROCW_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_icmenumprocw_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: ICMENUMPROCW_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_icmenumprocw_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER; a_anonymous_2: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_anonymous_1, a_anonymous_2) 
		end

invariant

	 callback_not_void: callback /= Void

end
