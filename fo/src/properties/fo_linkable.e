indexing
	description: "Objects that can be link target or origin"
	author: ""
	date: "$Date: 2007/04/16 12:24:40 $"
	revision: "$Revision: 1.1 $"

deferred class
	FO_LINKABLE

feature -- Access

	destination : FO_DESTINATION
		-- As link origin: destination pointed to.

feature -- Element change

	set_destination (a_destination : like destination) is
		require
			a_destination_not_void: a_destination /= Void
		do
			destination := a_destination
		ensure
			destination_set: destination = a_destination
		end

end
