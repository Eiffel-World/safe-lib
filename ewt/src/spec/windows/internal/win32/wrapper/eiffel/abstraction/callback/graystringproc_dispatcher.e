class GRAYSTRINGPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: GRAYSTRINGPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_graystringproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: GRAYSTRINGPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_graystringproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER; a_anonymous_2: INTEGER; a_anonymous_3: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_anonymous_1, a_anonymous_2, a_anonymous_3) 
		end

invariant

	 callback_not_void: callback /= Void

end
