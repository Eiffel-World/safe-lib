indexing
	description: "Targets that may be hyperlinked."
	author: "Paul G. Crismer"
	date: "$Date: 2007/06/15 08:40:29 $"
	revision: "$Revision: 1.2 $"

class
	FO_TARGET

create
	make

feature {NONE} -- Initialization

	make (new_name : STRING) is
		require
			new_name_not_void: new_name /= Void
			name_not_empty: not new_name.is_empty
		do
			name := new_name
		ensure
			name_set: name = new_name
		end

feature -- Access

	name : STRING
			-- Name to be referenced.

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
end
