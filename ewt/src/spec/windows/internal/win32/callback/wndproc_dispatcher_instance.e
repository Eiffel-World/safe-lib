indexing
	description: "Objects that dispatch WNDPROC callbacks."
	author: ""
	date: "$Date: 2004/06/29 16:47:12 $"
	revision: "$Revision: 1.1 $"

class
	WNDPROC_DISPATCHER_INSTANCE

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

	call (anonymous_1: POINTER; anonymous_2: INTEGER; anonymous_3: INTEGER; anonymous_4: INTEGER): INTEGER is
		do
			Result := call_clbk_wndproc (c_dispatcher, anonymous_1,anonymous_2,anonymous_3,anonymous_4)
		end
		
feature {NONE}

	make (a_callback: WNDPROC_CALLBACKABLE) is
		require
			a_callback_not_void: a_callback /= Void
		do
			callback := a_callback
			slot := new_wndproc_entry (Current, $on_callback)
			if slot < 0 then
				raise ("No more callbacks")
			end
		end

feature {ANY}

	callback: WNDPROC_CALLBACKABLE

	c_dispatcher: POINTER is
		do
			Result := get_wndproc_clbk_stub (slot)
		end

	slot : INTEGER
	
feature {NONE} -- Implementation

	frozen on_callback (a_anonymous_1: POINTER; a_anonymous_2: INTEGER; a_anonymous_3: INTEGER; a_anonymous_4: INTEGER): INTEGER is 
		do
			Result := callback.call_window_procedure (a_anonymous_1, a_anonymous_2, a_anonymous_3, a_anonymous_4) 
		end

	new_wndproc_entry (a_class: WNDPROC_DISPATCHER_INSTANCE; a_feature: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPVOID, LPVOID):int"
		alias
			"ewg_function_macro_new_wndproc_clbk_entry"
		end

--	call_wndproc_entry (index : INTEGER; a_anonymous_1: POINTER; a_anonymous_2: INTEGER; a_anonymous_3: INTEGER; a_anonymous_4: INTEGER): INTEGER

	dispose is
		do
			free_wndproc_clbk_entry (slot)
		end
		
invariant

	callback_not_void: callback /= Void
	slot_positive: slot >= 0
	
end -- class WNDPROC_DISPATCHER_INSTANCE
