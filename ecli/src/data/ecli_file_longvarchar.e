indexing

	description:

			"SQL LONGVARCHAR large data transferred from/into a file."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2006, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2012/06/08 19:32:41 $"

class ECLI_FILE_LONGVARCHAR

inherit

	ECLI_FILE_VALUE

create

	make_input, make_output

feature -- Access

	sql_type_code : INTEGER is
		do
			Result := Sql_longvarchar
		end

feature {NONE} -- Implementation

	get_transfer_length : INTEGER is
		do
--			Result := Precursor
			if ext_item.item (Result) = '%U' then
				Result := Result - 1
			end
		end

end
