indexing
	description: "Adapters using ECLI that implement write access"
	author: "Paul G. Crismer"
	date: "$Date: 2004/06/06 12:52:52 $"
	revision: "$Revision: 1.1 $"

deferred class
	ECLI_ADAPTER_WRITE_SKELETON[G->PO_PERSISTENT]

inherit
	ECLI_ADAPTER_COMMON_SKELETON[G]

feature -- Status report

	can_write : BOOLEAN is 
		do 
			Result := True 
		end

feature -- Basic operations

	write (object: like last_object) is
			-- Write `object' on datastore.
		do
			status.reset
			create_pid_from_object (object)
			last_object := object
			if last_pid /= Void then
				init_parameters_for_write (object, last_pid)
				write_query.execute
				if write_query.is_ok then
					object.set_pid (last_pid)
					if is_enabled_cache_on_write then
						cache.force (last_object, last_pid.to_string)
					end
				else
					status.set_datastore_error (write_query.native_code, write_query.diagnostic_message)
				end
			else
				status.set_framework_error (status.Error_non_conformant_pid)
			end		
		end
	
feature {PO_ADAPTER} -- Basic operations

	init_parameters_for_write (object : like last_object; a_pid : like last_pid) is
			-- Initialize parameters of `write_query' with information from `object' and `a_pid'.
		deferred
		ensure
			bound_parameters: write_query.bound_parameters
		end

feature {PO_ADAPTER} -- Implementation

	write_query : ECLI_QUERY is
		deferred
		end

end -- class ECLI_ADAPTER_WRITE_SKELETON
