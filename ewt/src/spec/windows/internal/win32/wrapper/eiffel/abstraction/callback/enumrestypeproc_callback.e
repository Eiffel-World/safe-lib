deferred class ENUMRESTYPEPROC_CALLBACK

feature {ENUMRESTYPEPROC_DISPATCHER}

	on_callback (a_hmodule: POINTER; a_lptype: POINTER; a_lparam: INTEGER): INTEGER is 
		deferred
		end

end
