indexing
	description: "Maps of access module parameters, by name."
	author: "Paul G. Crismer"
	
	application: "Query Assistant"
	library: "ECLI"
	date: "$Date: 2007/11/15 10:01:52 $"
	revision: "$Revision: 1.2 $"

class
	PARAMETER_MAP

inherit
	DS_HASH_TABLE [MODULE_PARAMETER, STRING]
	
create
	make 
	
end -- class PARAMETER_MAP
