indexing
	description: "Shared CLI environment"
	author: "Paul G. Crismer"
	date: "$Date: 2000/07/30 20:34:09 $"
	revision: "$Revision: 1.1 $"
	licensing: "See notice at end of class"

class
	ECLI_SHARED_ENVIRONMENT

feature -- Access

	environment : ECLI_ENVIRONMENT is
		once
			!!Result.make
		end

end -- class ECLI_SHARED_ENVIRONMENT
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
