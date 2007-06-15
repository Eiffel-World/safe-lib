indexing
	description: "Objects that can link to some target destination."
	author: ""
	date: "$Date: 2007/06/15 08:40:29 $"
	revision: "$Revision: 1.2 $"

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
