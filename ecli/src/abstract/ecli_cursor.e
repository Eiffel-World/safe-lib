indexing
	description: "Abstraction of a SQL cursor."
	author: "Paul G. Crismer"
	date: "$Date: 2003/09/16 18:52:25 $"
	revision: "$Revision: 1.14 $"
	licensing: "See notice at end of class"

deferred class
	ECLI_CURSOR

inherit
	ECLI_QUERY
			
feature -- Basic Operations

	start is
		do
			if not bound_parameters then
				bind_parameters
			end
			execute
			if is_ok then
				if has_result_set then
					create_buffers
					statement_start
				end
			end
		end

feature {NONE} -- Implementation

	create_buffers is
			-- create all ECLI_VALUE objects
		deferred
		ensure
			results_set: results /= Void
		end
	
end -- class ECLI_CURSOR
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

