deferred class PFE_IMPORT_FUNC_CALLBACK

feature {PFE_IMPORT_FUNC_DISPATCHER}

	on_callback (a_pbdata: POINTER; a_pvcallbackcontext: POINTER; a_ullength: POINTER): INTEGER is 
		deferred
		end

end
