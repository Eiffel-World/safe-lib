class PROPENUMPROCA_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: PROPENUMPROCA_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_propenumproca_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: PROPENUMPROCA_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_propenumproca_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER; a_anonymous_2: POINTER; a_anonymous_3: POINTER): INTEGER is 
		do
			Result := callback.on_callback (a_anonymous_1, a_anonymous_2, a_anonymous_3) 
		end

invariant

	 callback_not_void: callback /= Void

end