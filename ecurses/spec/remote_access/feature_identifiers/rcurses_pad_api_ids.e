indexing
	description: "Identifiers of pad api features"
    cluster: 	"ecurses, spec, remote_access"
    interface: 	"mixin"
    status: 	"See notice at do end of class"
    date: 	"$Date: 2001/10/20 13:37:13 $"
    revision: 	"$Revision: 1.1 $"
    author: 	"Paul G. Crismer, Eric Fafchamps"

class
	RCURSES_PAD_API_IDS

feature -- Identifiers

	Id_newpad: INTEGER is 170
	Id_prefresh: INTEGER is 171
	Id_pnoutrefresh: INTEGER is 172
	Id_subpad: INTEGER is 173
	Id_pechochar: INTEGER is 174

end -- class RCURSES_PAD_API_IDS

-----------------------------------------------------------
-- Copyright (C) 2001 Paul G. Crismer, Eric Fafchamps
-- Licensed under Eiffel Forum Freeware License, version 1
-- (see forum.txt)
-----------------------------------------------------------

