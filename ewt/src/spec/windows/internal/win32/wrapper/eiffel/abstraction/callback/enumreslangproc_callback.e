deferred class ENUMRESLANGPROC_CALLBACK

feature {ENUMRESLANGPROC_DISPATCHER}

	on_callback (a_hmodule: POINTER; a_lptype: POINTER; a_lpname: POINTER; a_wlanguage: INTEGER; a_lparam: INTEGER): INTEGER is 
		deferred
		end

end
