indexing
	description: "Fixed length buffer, for external usage"

	author: "Paul G. Crismer"
	date: "$Date: 2000/06/06 21:45:34 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

	
class
	MESSAGE_BUFFER

inherit

	STRING

creation

	make

feature

	clear_content is
			-- clear buffer content
		do
			count := 0
		ensure
			count = 0
		end

end -- class MESSAGE_BUFFER
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

