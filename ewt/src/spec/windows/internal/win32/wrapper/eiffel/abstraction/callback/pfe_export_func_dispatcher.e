class PFE_EXPORT_FUNC_DISPATCHER

inherit

	EWG_CALLBACK_C_GLUE_CODE_FUNCTIONS_EXTERNAL
		export {NONE} all end

creation

	make

feature {NONE}

	make (a_callback: PFE_EXPORT_FUNC_CALLBACK) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			set_pfe_export_func_entry_external (Current, $on_callback)
		end

feature {ANY}

	callback: PFE_EXPORT_FUNC_CALLBACK

	c_dispatcher: POINTER is
		do
			Result := get_pfe_export_func_stub_external
		end

feature {NONE} -- Implementation

	frozen on_callback (a_pbdata: POINTER; a_pvcallbackcontext: POINTER; a_ullength: INTEGER): INTEGER is 
		do
			Result := callback.on_callback (a_pbdata, a_pvcallbackcontext, a_ullength) 
		end

invariant

	 callback_not_void: callback /= Void

end
