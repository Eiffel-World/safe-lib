indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2004/06/29 16:47:12 $"
	revision: "$Revision: 1.1 $"

class
	HOOKPROC_DISPATCHER_INSTANCE

inherit
	WIN32_CALLBACK_COMPLEMENT_FUNCTIONS
		export {NONE} all end

	MEMORY
		redefine
			dispose
		end
	
	EXCEPTIONS
		export
			{NONE} all
		end
		
creation

	make

feature -- Basic operations

	call (anonymous_1, anonymous_2, anonymous_3: INTEGER): INTEGER is
		do
			Result := call_clbk_hookproc (c_dispatcher, anonymous_1,anonymous_2,anonymous_3)
		end
		
feature {NONE}

	make (a_callback: HOOKPROC_CALLBACKABLE) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			slot := new_hookproc_entry (Current, $on_callback)
			if slot < 0 then
				raise ("No more callbacks")
			end
		end

feature {ANY}

	callback: HOOKPROC_CALLBACKABLE

	c_dispatcher: POINTER is
		do
			Result := get_hookproc_clbk_stub (slot)
		end

	slot : INTEGER
	
feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1, a_anonymous_2, a_anonymous_3: INTEGER): INTEGER is 
		do
			Result := callback.call_hook_procedure (a_anonymous_1, a_anonymous_2, a_anonymous_3) 
		end

	new_hookproc_entry (a_class: HOOKPROC_DISPATCHER_INSTANCE; a_feature: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPVOID, LPVOID):int"
		alias
			"ewg_function_macro_new_hookproc_clbk_entry"
		end

	dispose is
		do
			free_hookproc_clbk_entry (slot)
		end
		
invariant

	callback_not_void: callback /= Void
	slot_positive: slot > 0
	
end -- class HOOKPROC_DISPATCHER_INSTANCE
