deferred class ENUMRESNAMEPROC_CALLBACK

feature {ENUMRESNAMEPROC_DISPATCHER}

	on_callback (a_hmodule: POINTER; a_lptype: POINTER; a_lpname: POINTER; a_lparam: INTEGER): INTEGER is 
		deferred
		end

end
