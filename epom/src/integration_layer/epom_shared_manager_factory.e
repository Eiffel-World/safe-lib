indexing
	description: "Shared EPOM_MANAGER_FACTORY"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/19 07:26:15 $"
	revision: "$Revision: 1.2 $"

class
	EPOM_SHARED_MANAGER_FACTORY

feature -- Access

	shared_manager_factory: EPOM_MANAGER_FACTORY is
			-- Shared manager factory
		do
			Result := cell.item
		end

feature -- Element change

	set_shared_manager_factory (a_manager_factory: EPOM_MANAGER_FACTORY) is
			-- Set shared_manager_factory with `a_manager_factory'.
		require
			manager_factory_exists: a_manager_factory /= Void
		do
			cell.put (a_manager_factory)
		ensure
			shared_manager_factory_set: shared_manager_factory = a_manager_factory
		end


feature {NONE} -- Implementation

	cell: DS_CELL [EPOM_MANAGER_FACTORY] is
			-- Cell for shared manager factory.
		once
			!!Result.make (Void)
		end

end -- class EPOM_SHARED_MANAGER_FACTORY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
