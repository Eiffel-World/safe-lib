deferred class HOOKPROC_CALLBACK

feature {HOOKPROC_DISPATCHER}

	on_callback (a_code: INTEGER; a_wparam: INTEGER; a_lparam: INTEGER): INTEGER is 
		deferred
		end

end
