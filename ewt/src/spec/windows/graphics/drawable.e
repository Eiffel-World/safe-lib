indexing
	description: "Windows implementation of ABSTRACT_DRAWABLE"
	date: "$Date: 2004/07/06 20:15:18 $";
	revision: "$Revision: 1.4 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	DRAWABLE
	
inherit
	ABSTRACT_DRAWABLE
	
feature -- Platform specific

	internal_new_GC (a_gc_data : ABSTRACT_GC_DATA ) : POINTER is
			-- Allocate a new platform specific GC handle.
--		require
--			not_is_resource_disposed : not is_resource_disposed
		deferred
		ensure
			handle_defined : Result /= default_pointer
		end

	internal_dispose_GC (a_gc_handle : POINTER; a_gc_data : ABSTRACT_GC_DATA )is
			-- Dispose a platform specific GC handle.
		require
			a_gc_handle_defined : a_gc_handle /= default_pointer
		deferred
		end

end -- class DRAWABLE

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
