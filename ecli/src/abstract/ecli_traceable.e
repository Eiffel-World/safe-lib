indexing

	description: 
	
		"Objects that are traceable through an ECLI_TRACER"
	
	rationale: "Usage of visitor pattern.%
			% This way it is possible to customize tracers without impacting %
			% other traceable classes."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/06/24 19:40:43 $"

deferred class

	ECLI_TRACEABLE

feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
			-- Trace current object through 'a_tracer'
		require
			trace_possible: can_trace
			tracer_writable: a_tracer /= Void
		deferred
		end

	can_trace : BOOLEAN is
			-- Can Current trace itself ?
		deferred
		end
		
end
