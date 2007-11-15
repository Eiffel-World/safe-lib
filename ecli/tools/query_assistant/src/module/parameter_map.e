indexing
	description: "Maps of access module parameters, by name."
	author: "Paul G. Crismer"
	
	application: "Query Assistant"
	library: "ECLI"
	date: "$Date: 2007/11/15 10:21:47 $"
	revision: "$Revision: 1.3 $"

class
	PARAMETER_MAP

inherit
	DS_HASH_TABLE [RDBMS_ACCESS_PARAMETER, STRING]
	
create
	make 
	
end -- class PARAMETER_MAP
