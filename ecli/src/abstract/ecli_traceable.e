indexing
	description: "Objects that are traceable through an ECLI_TRACER"
	rationale: "Usage of visitor pattern.  This way it is possible to customize tracers without impacting %
			% other traceable classes."
	author: "Paul G. Crismer"
	date: "$Date: 2001/09/15 09:56:52 $"
	revision: "$Revision: 1.1 $"

deferred class

	ECLI_TRACEABLE

feature -- Basic operations

	trace (a_tracer : ECLI_TRACER) is
			-- trace current object through 'a_tracer'
		require
			trace_possible: can_trace
			tracer_writable: a_tracer /= Void
		deferred
		end

	can_trace : BOOLEAN is
			-- can Current trace itself ?
		deferred
		end
		
end -- class ECLI_TRACEABLE