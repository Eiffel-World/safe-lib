deferred class DRAWSTATEPROC_CALLBACK

feature {DRAWSTATEPROC_DISPATCHER}

	on_callback (a_hdc: POINTER; a_ldata: INTEGER; a_wdata: INTEGER; a_cx: INTEGER; a_cy: INTEGER): INTEGER is 
		deferred
		end

end
