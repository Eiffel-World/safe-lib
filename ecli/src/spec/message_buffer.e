indexing
	description: "Fixed length buffer, for external usage"

	author: "Paul G. Crismer"
	date: "$Date: 2001/09/15 09:56:52 $"
	revision: "$Revision: 1.3 $"
	licensing: "See notice at end of class"

	
class
	MESSAGE_BUFFER

inherit

	STRING
		redefine
			fill_blank
		end
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

	fill_blank is
		local
			i : INTEGER
		do
			clear_content
			from 
				i := 1 
			until 
				i > capacity
			loop
				append (" ")	
				i := i + 1
			end
		end
		
end -- class MESSAGE_BUFFER
--
-- Copyright: 2000, Paul G. Crismer, <pgcrism@attglobal.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--

