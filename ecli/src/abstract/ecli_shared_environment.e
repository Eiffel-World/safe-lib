indexing
	description: 
	
		"Shared CLI environment"
	
	author: "Paul G. Crismer"
	date: "$Date: 2003/07/25 18:24:23 $"
	revision: "$Revision: 1.6 $"
	licensing: "See notice at end of class"

class
	ECLI_SHARED_ENVIRONMENT

feature -- Access

	shared_environment : ECLI_ENVIRONMENT is
		once
			!!Result.make
		end

end -- class ECLI_SHARED_ENVIRONMENT
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
