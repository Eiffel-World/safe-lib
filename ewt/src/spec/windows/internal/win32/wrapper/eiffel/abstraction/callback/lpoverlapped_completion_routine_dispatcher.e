class LPOVERLAPPED_COMPLETION_ROUTINE_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: LPOVERLAPPED_COMPLETION_ROUTINE_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_lpoverlapped_completion_routine_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: LPOVERLAPPED_COMPLETION_ROUTINE_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_lpoverlapped_completion_routine_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_dwerrorcode: INTEGER; a_dwnumberofbytestransfered: INTEGER; a_lpoverlapped: POINTER)is 
		do
			callback.on_callback (a_dwerrorcode, a_dwnumberofbytestransfered, a_lpoverlapped) 
		end

invariant

	 callback_not_void: callback /= Void

end
