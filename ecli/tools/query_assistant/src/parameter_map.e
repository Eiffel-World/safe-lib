indexing
	description: "Maps of access module parameters, by name."
	author: "Paul G. Crismer"
	
	application: "Query Assistant"
	library: "ECLI"
	date: "$Date: 2003/09/16 18:52:26 $"
	revision: "$Revision: 1.1 $"

class
	PARAMETER_MAP

inherit
	DS_HASH_TABLE [MODULE_PARAMETER, STRING]
	
creation
	make 
	
end -- class PARAMETER_MAP
