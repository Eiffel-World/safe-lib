indexing
	description: "Adapters using ECLI that implement update access"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECLI_ADAPTER_UPDATE_SKELETON[G->PO_PERSISTENT]

inherit
	ECLI_ADAPTER_COMMON_SKELETON[G]

feature -- Access report

	can_update : BOOLEAN is 
		do 
			Result := True 
		ensure then
			can_update: Result
		end

feature -- Basic operations

	update (object: like last_object) is
			-- Update `object' on datastore using `update_query'.
		do  
			status.reset
			if object.is_volatile then
				create_pid_from_object (object)
			else
				last_pid ?= object.pid
			end
			
			last_object := Void
			if last_pid /= Void then
				init_parameters_for_update (object, last_pid)
				update_query.execute
				if update_query.is_ok then
					object.set_pid (last_pid)
				else
					--| query failed
					status.set_datastore_error (update_query.native_code, update_query.diagnostic_message					)
				end
			else
				--| non_conformant_pid 
				status.set_framework_error (status.error_non_conformant_pid)
			end		
		end
	
feature {PO_ADAPTER} -- Basic operations

	init_parameters_for_update (object : like last_object; a_pid : like last_pid) is
			-- Initialize parameters of `update_query' with information from `object' and `a_pid'.
		deferred
		end

feature {PO_ADAPTER} -- Implementation
	
	update_query : ECLI_QUERY is
		deferred
		end

end -- class ECLI_ADAPTER_UPDATE_SKELETON
