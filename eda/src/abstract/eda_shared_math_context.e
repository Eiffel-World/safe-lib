indexing
	description: "Accesses to the shared decimal context; used to be a singleton"

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/12/22 10:53:13 $"
	revision: "$Revision: 1.5 $"
	licensing: "See notice at end of class"

class
	EDA_SHARED_MATH_CONTEXT
		
feature -- Access

	shared_decimal_context : EDA_MATH_CONTEXT is
			-- decimal context for operations where it does not explicitly appear in the signature
		do
			Result := cell.item
		ensure
			Result /= Void
		end

		
feature -- Element change

	set_shared_decimal_context (new_context : EDA_MATH_CONTEXT) is
			-- set `shared_decimal_context' to `new_context'
		require
			new_context_not_void: new_context /= Void
		do
			cell.put (new_context)
		ensure
			context_set: shared_decimal_context = new_context
		end
		
feature {NONE} -- Implementation

	cell : KL_CELL[EDA_MATH_CONTEXT] is
			-- 
		local
			new_context : EDA_MATH_CONTEXT
		once
			!!new_context.make_default
			!!Result.make (new_context)
		end
		
invariant
	shared_context_not_void: shared_decimal_context /= Void

end -- class EDA_SHARED_MATH_CONTEXT

--
-- Copyright: 2002, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
