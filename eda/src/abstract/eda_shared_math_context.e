indexing
	description: "Accesses to the shared decimal context; used to be a singleton"

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2003/01/22 10:57:52 $"
	revision: "$Revision: 1.2 $"
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

	decimal_zero : EDA_DECIMAL is
			-- zero as EDA_DECIMAL
		once
			create Result.make_zero
		end
		
	decimal_one : EDA_DECIMAL is
			-- one as EDA_DECIMAL
		once
			create Result.make_from_integer (1)
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
