indexing
	description: "Adapters using ECLI that implement delete access"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECLI_ADAPTER_DELETE_SKELETON[G->PO_PERSISTENT]

inherit
	ECLI_ADAPTER_COMMON_SKELETON[G]

feature -- Status report

	can_delete : BOOLEAN is 
		do 
			Result := True
		ensure then
			can_delete: Result
		end

feature -- Basic operations

	delete (object: like last_object) is
			-- Delete `object' from datastore using `delete_query'.
		do  
			status.reset
			last_pid ?= object.pid
			
			last_object := Void
			if last_pid /= Void then
				init_parameters_for_delete (last_pid)
				delete_query.execute
				if delete_query.is_ok then
					status.reset
					cache.search (last_pid.to_string)
					if cache.found then
						cache.remove (cache.found_key)
					end
					object.set_deleted
				else
					status.set_datastore_error (delete_query.native_code, delete_query.diagnostic_message						)
				end
			else
				status.set_framework_error (status.error_non_conformant_pid)
			end
		end
	
feature {PO_ADAPTER} -- Basic operations

	init_parameters_for_delete (a_pid : like last_pid) is
			-- Initialize parameters of `delete_query' with information from `a_pid'.
		deferred
		ensure
			bound_parameters: delete_query.bound_parameters
		end

feature {PO_ADAPTER} -- Implementation

	delete_query : ECLI_QUERY is
		deferred
		end

end -- class ECLI_ADAPTER_DELETE_SKELETON
