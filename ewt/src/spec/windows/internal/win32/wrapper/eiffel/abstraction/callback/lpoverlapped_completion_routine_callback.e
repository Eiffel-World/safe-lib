deferred class LPOVERLAPPED_COMPLETION_ROUTINE_CALLBACK

feature {LPOVERLAPPED_COMPLETION_ROUTINE_DISPATCHER}

	on_callback (a_dwerrorcode: INTEGER; a_dwnumberofbytestransfered: INTEGER; a_lpoverlapped: POINTER)is 
		deferred
		end

end
