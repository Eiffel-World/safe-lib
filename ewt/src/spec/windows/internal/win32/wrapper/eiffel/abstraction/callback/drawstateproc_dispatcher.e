class DRAWSTATEPROC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: DRAWSTATEPROC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_drawstateproc_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: DRAWSTATEPROC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_drawstateproc_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_hdc: POINTER; a_ldata: INTEGER; a_wdata: INTEGER; a_cx: INTEGER; a_cy: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_hdc, a_ldata, a_wdata, a_cx, a_cy) 
		end

invariant

	 callback_not_void: callback /= Void

end
