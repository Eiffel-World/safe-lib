indexing

	description: "Portable weak references"

class EWG_IDENTIFIED








inherit 

	MEMORY
		redefine
			dispose, is_equal, copy
		end











feature 

















	ewg_object_id: INTEGER is
		do
			if internal_object_id = 0 then
				internal_object_id := ewg_new_id_external (Current)
			end
			Result := internal_object_id
		ensure
			id_greater_zero: Result > 0
			consistent: Current = ewg_id_object (Result)
		end

	ewg_id_object (id: INTEGER): EWG_IDENTIFIED is
		require
			valid_id: id > 0
		do
			Result := ewg_id_object_external (id)
		end

feature -- comparison and copy

	is_equal (other: like Current): BOOLEAN is
		local
			l_id: INTEGER
		do
			-- Make the internal IDs the same and then
			-- call the standard comparison
			l_id := internal_object_id
			internal_object_id := other.ewg_object_id
			Result := standard_is_equal (other)
			internal_object_id := l_id
		end

	copy (other: like Current) is
		do
			standard_copy (other)
			internal_object_id := 0
		end	

feature {NONE}

	internal_object_id: INTEGER

	dispose is
		do
			if internal_object_id /= 0 then
				ewg_free_id_external (internal_object_id)
				internal_object_id := 0
			end
		end

feature {NONE} -- externals

	ewg_new_id_external (object: EWG_IDENTIFIED): INTEGER is
		external
			"C"
		alias
			"ewg_new_id"
		end

	ewg_free_id_external (id: INTEGER) is
		external
			"C"
		alias
			"ewg_free_id"
		end

	ewg_id_object_external (id: INTEGER): EWG_IDENTIFIED is
		external
			"C"
		alias
			"ewg_id_object"
		end


end




