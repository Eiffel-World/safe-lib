deferred class PTHREAD_START_ROUTINE_CALLBACK

feature {PTHREAD_START_ROUTINE_DISPATCHER}

	on_callback (a_lpthreadparameter: POINTER): INTEGER is 
		deferred
		end

end
