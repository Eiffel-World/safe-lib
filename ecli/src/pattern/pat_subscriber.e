indexing
	description: "Subscriber part of the publisher/subscriber pattern"
	author: "Paul G. Crismer"
	date: "$Date: 2000/11/03 20:33:08 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

deferred class
	PAT_SUBSCRIBER

feature -- Initialization

feature -- Access

	publisher : PAT_PUBLISHER [PAT_SUBSCRIBER] is
		deferred
		end

	unsubscribed : BOOLEAN

feature -- Basic operations

	published (a_publisher : like publisher) is
			-- called by publisher
			-- redefine in descendant classes
		do
		end

	has_publisher : BOOLEAN is
		do
			Result := (publisher /= Void)
		end
	
invariant

	subscription: unsubscribed or else has_publisher

end -- class PAT_SUBSCRIBER
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--