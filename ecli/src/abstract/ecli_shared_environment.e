indexing
	description: "Shared CLI environment"
	author: "Paul G. Crismer"
	date: "$Date: 2001/05/16 13:17:12 $"
	revision: "$Revision: 1.1.1.2 $"
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
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
