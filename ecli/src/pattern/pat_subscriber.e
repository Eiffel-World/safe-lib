indexing
	description: "Subscriber part of the publisher/subscriber pattern"
	author: "Paul G. Crismer"
	date: "$Date: 2004/03/01 14:08:43 $"
	revision: "$Revision: 1.8 $"
	licensing: "See notice at end of class"

deferred class
	PAT_SUBSCRIBER

feature -- Initialization

feature -- Access

	publisher : PAT_PUBLISHER [PAT_SUBSCRIBER] is
		deferred
		end

feature -- Status report

	unsubscribed : BOOLEAN is
		do
			Result := (publisher = Void)
		ensure
			definition: Result = (publisher = Void)
		end

	has_publisher : BOOLEAN is
		do
			Result := (publisher /= Void)
		ensure
			definition: Result = (publisher /= Void)
		end

feature -- Basic operations

	published (a_publisher : like publisher) is
			-- called by publisher
			-- redefine in descendant classes
		do
		end

	
invariant

	subscription: unsubscribed or else has_publisher

end -- class PAT_SUBSCRIBER
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
