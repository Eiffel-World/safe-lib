deferred class PFE_EXPORT_FUNC_CALLBACK

feature {PFE_EXPORT_FUNC_DISPATCHER}

	on_callback (a_pbdata: POINTER; a_pvcallbackcontext: POINTER; a_ullength: INTEGER): INTEGER is 
		deferred
		end

end
