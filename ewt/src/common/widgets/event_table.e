indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/07/06 20:15:18 $"
	revision: "$Revision: 1.1 $"

class
	EVENT_TABLE

creation
	make

feature -- Initialization

	make is
		do
			create table.make (10)
		end
		

feature -- Access

	table : DS_HASH_TABLE[DS_LIST[LISTENER], INTEGER]
			-- Table of listeners indexed by event type.
			
	level : INTEGER

feature -- Measurement

	count : INTEGER
			-- Number of listeners.
			
feature -- Status report

	hooks (event_type : INTEGER) : BOOLEAN is
			-- Does current hook `event_type' events ?
		do
			Result := table.has (event_type)
		end
	
	hooks_listener (event_type : INTEGER; listener : LISTENER) : BOOLEAN is
			-- Is `listener' hooking for `event_type' ?
		do
			Result := hooks (event_type)
			if Result then
				Result := table.item (event_type).has (listener)
			end
		end		
		
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	hook (event_type : INTEGER; listener : LISTENER) is
		local
			list : DS_LIST[LISTENER]
		do
			list := table.item (event_type)
			if list = Void then
				create {DS_LINKED_LIST[LISTENER]}list.make
				table.force (list, event_type)
			end
			list.put_last (listener)
			count := count + 1
		ensure
			hooks_event: hooks (event_type)
			hooks_listener: hooks_listener (event_type, listener)
			count_adapted: count = old count + 1
		end
	
	unhook (event_type : INTEGER; listener : LISTENER) is
		local
			list : DS_LIST[LISTENER]
		do
			list := table.item (event_type)
			if list /= Void then
				list.start
				list.search_forth (listener)
				if not list.off then
					list.remove_at
					count := count - 1
					list.go_after
				end
			end
		ensure
--FIXME
		end

	unhook_typed (event_type : INTEGER; listener : LISTENER) is
		do
--FIXME
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class EVENT_TABLE
