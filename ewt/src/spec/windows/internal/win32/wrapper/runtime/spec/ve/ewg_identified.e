indexing

	description: "Portable weak references"

class EWG_IDENTIFIED


inherit 

	MEMORY




















feature 

	ewg_object_id: INTEGER is
		do
			Result := object_id
		ensure
			id_greater_zero: Result > 0
			consistent: Current = ewg_id_object (Result)
		end

	ewg_id_object (id: INTEGER): EWG_IDENTIFIED is
		require
			valid_id: id > 0
		do
			Result ?= id_object(id)
		end












































































end




