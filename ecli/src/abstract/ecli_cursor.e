indexing
	description: "Abstraction of a SQL cursor."
	author: "Paul G. Crismer"
	date: "$Date: 2003/11/11 19:31:07 $"
	revision: "$Revision: 1.15 $"
	licensing: "See notice at end of class"

deferred class
	ECLI_CURSOR

inherit
	ECLI_QUERY
			
feature -- Basic Operations

	start is
			-- Start sweeping through cursor, after execution of `sql'
		require
			sql_set: sql /= Void
			parameters_set: parameters.count = parameters_count and then not array_routines.has (parameters, Void)
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
		ensure
			result_set_created_if_executed: (is_executed and then has_result_set) implies (results.count = result_columns_count and then not array_routines.has (results, Void))
			not_before_if_executed: (is_executed and then has_result_set) implies not before
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

