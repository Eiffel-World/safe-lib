indexing
	description: "Accesses to the shared decimal context; used to be a singleton"

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2002/12/18 22:06:14 $"
	revision: "$Revision: 1.1.1.1 $"
	licensing: "See notice at end of class"

class
	EDA_SHARED_MATH_CONTEXT

inherit
	EDA_CONSTANTS
	
feature -- Access

	shared_decimal_context : EDA_MATH_CONTEXT is
			-- decimal context for operations where it does not explicitly appear in the signature
		do
			Result := cell.item
		ensure
			Result /= Void
		end
		
feature -- Element change

	set_shared_decimal_context (a_context : EDA_MATH_CONTEXT) is
			-- 
		require
			a_context_not_void: a_context /= Void
		do
			cell.put (a_context)
		ensure
			context_set: shared_decimal_context = a_context
		end
		
feature {NONE} -- Implementation

	cell : KL_CELL[EDA_MATH_CONTEXT] is
			-- 
		local
			a_context : EDA_MATH_CONTEXT
		once
			!!a_context.make_default
			!!Result.make (a_context)
		end
		
invariant
	shared_context_not_void: shared_decimal_context /= Void

end -- class EDA_SHARED_MATH_CONTEXT

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
