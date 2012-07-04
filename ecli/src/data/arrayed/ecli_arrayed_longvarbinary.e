note
	description: "Summary description for {ECLI_ARRAYED_LONGVARBINARY}."
	author: ""
	date: "$Date: 2012/07/04 18:54:48 $"
	revision: "$Revision: 1.1.2.1 $"

class
	ECLI_ARRAYED_LONGVARBINARY

inherit

	ECLI_ARRAYED_BINARY
		redefine
			sql_type_code
		end

create

	make

feature -- Access

	sql_type_code : INTEGER is
		do
			Result := Sql_longvarbinary
		end

end
