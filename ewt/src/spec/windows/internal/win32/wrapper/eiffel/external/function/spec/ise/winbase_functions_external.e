-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- functions wrapper
class WINBASE_FUNCTIONS_EXTERNAL

feature
	free_library_external (hlibmodule: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HMODULE):BOOL"
		alias
			"ewg_function_macro_FreeLibrary"











		end

	free_library_address_external: POINTER is
			-- Address of C function `FreeLibrary'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) FreeLibrary"






	end

	get_proc_address_external (hmodule: POINTER; lpprocname: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HMODULE, LPCSTR):FARPROC"
		alias
			"ewg_function_macro_GetProcAddress"











		end

	get_proc_address_address_external: POINTER is
			-- Address of C function `GetProcAddress'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetProcAddress"






	end

	global_alloc_external (uflags: INTEGER; dwbytes: INTEGER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (UINT, DWORD):HGLOBAL"
		alias
			"ewg_function_macro_GlobalAlloc"











		end

	global_alloc_address_external: POINTER is
			-- Address of C function `GlobalAlloc'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GlobalAlloc"






	end

	global_size_external (hmem: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HGLOBAL):DWORD"
		alias
			"ewg_function_macro_GlobalSize"











		end

	global_size_address_external: POINTER is
			-- Address of C function `GlobalSize'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GlobalSize"






	end

	global_lock_external (hmem: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HGLOBAL):LPVOID"
		alias
			"ewg_function_macro_GlobalLock"











		end

	global_lock_address_external: POINTER is
			-- Address of C function `GlobalLock'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GlobalLock"






	end

	global_unlock_external (hmem: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HGLOBAL):BOOL"
		alias
			"ewg_function_macro_GlobalUnlock"











		end

	global_unlock_address_external: POINTER is
			-- Address of C function `GlobalUnlock'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GlobalUnlock"






	end

	global_free_external (hmem: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HGLOBAL):HGLOBAL"
		alias
			"ewg_function_macro_GlobalFree"











		end

	global_free_address_external: POINTER is
			-- Address of C function `GlobalFree'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GlobalFree"






	end

	heap_alloc_external (hheap: POINTER; dwflags: INTEGER; dwbytes: INTEGER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HANDLE, DWORD, DWORD):LPVOID"
		alias
			"ewg_function_macro_HeapAlloc"











		end

	heap_alloc_address_external: POINTER is
			-- Address of C function `HeapAlloc'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) HeapAlloc"






	end

	heap_free_external (hheap: POINTER; dwflags: INTEGER; lpmem: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (HANDLE, DWORD, LPVOID):BOOL"
		alias
			"ewg_function_macro_HeapFree"











		end

	heap_free_address_external: POINTER is
			-- Address of C function `HeapFree'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) HeapFree"






	end

	get_process_heap_external : POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] :HANDLE"
		alias
			"ewg_function_macro_GetProcessHeap"











		end

	get_process_heap_address_external: POINTER is
			-- Address of C function `GetProcessHeap'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetProcessHeap"






	end

	get_current_process_id_external : INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] :DWORD"
		alias
			"ewg_function_macro_GetCurrentProcessId"











		end

	get_current_process_id_address_external: POINTER is
			-- Address of C function `GetCurrentProcessId'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetCurrentProcessId"






	end

	get_current_thread_id_external : INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] :DWORD"
		alias
			"ewg_function_macro_GetCurrentThreadId"











		end

	get_current_thread_id_address_external: POINTER is
			-- Address of C function `GetCurrentThreadId'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetCurrentThreadId"






	end

	get_last_error_external : INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] :DWORD"
		alias
			"ewg_function_macro_GetLastError"











		end

	get_last_error_address_external: POINTER is
			-- Address of C function `GetLastError'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetLastError"






	end

	get_tick_count_external : INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] :DWORD"
		alias
			"ewg_function_macro_GetTickCount"











		end

	get_tick_count_address_external: POINTER is
			-- Address of C function `GetTickCount'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetTickCount"






	end

	load_library_a_external (lplibfilename: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCSTR):HMODULE"
		alias
			"ewg_function_macro_LoadLibraryA"











		end

	load_library_a_address_external: POINTER is
			-- Address of C function `LoadLibraryA'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) LoadLibraryA"






	end

	load_library_w_external (lplibfilename: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCWSTR):HMODULE"
		alias
			"ewg_function_macro_LoadLibraryW"











		end

	load_library_w_address_external: POINTER is
			-- Address of C function `LoadLibraryW'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) LoadLibraryW"






	end

	get_module_handle_a_external (lpmodulename: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCSTR):HMODULE"
		alias
			"ewg_function_macro_GetModuleHandleA"











		end

	get_module_handle_a_address_external: POINTER is
			-- Address of C function `GetModuleHandleA'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetModuleHandleA"






	end

	get_module_handle_w_external (lpmodulename: POINTER): POINTER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCWSTR):HMODULE"
		alias
			"ewg_function_macro_GetModuleHandleW"











		end

	get_module_handle_w_address_external: POINTER is
			-- Address of C function `GetModuleHandleW'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetModuleHandleW"






	end

	expand_environment_strings_a_external (lpsrc: POINTER; lpdst: POINTER; nsize: INTEGER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCSTR, LPSTR, DWORD):DWORD"
		alias
			"ewg_function_macro_ExpandEnvironmentStringsA"











		end

	expand_environment_strings_a_address_external: POINTER is
			-- Address of C function `ExpandEnvironmentStringsA'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) ExpandEnvironmentStringsA"






	end

	expand_environment_strings_w_external (lpsrc: POINTER; lpdst: POINTER; nsize: INTEGER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCWSTR, LPWSTR, DWORD):DWORD"
		alias
			"ewg_function_macro_ExpandEnvironmentStringsW"











		end

	expand_environment_strings_w_address_external: POINTER is
			-- Address of C function `ExpandEnvironmentStringsW'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) ExpandEnvironmentStringsW"






	end

	get_profile_string_a_external (lpappname: POINTER; lpkeyname: POINTER; lpdefault: POINTER; lpreturnedstring: POINTER; nsize: INTEGER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCSTR, LPCSTR, LPCSTR, LPSTR, DWORD):DWORD"
		alias
			"ewg_function_macro_GetProfileStringA"











		end

	get_profile_string_a_address_external: POINTER is
			-- Address of C function `GetProfileStringA'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetProfileStringA"






	end

	get_profile_string_w_external (lpappname: POINTER; lpkeyname: POINTER; lpdefault: POINTER; lpreturnedstring: POINTER; nsize: INTEGER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPCWSTR, LPCWSTR, LPCWSTR, LPWSTR, DWORD):DWORD"
		alias
			"ewg_function_macro_GetProfileStringW"











		end

	get_profile_string_w_address_external: POINTER is
			-- Address of C function `GetProfileStringW'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetProfileStringW"






	end

	get_version_ex_a_external (lpversioninformation: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPOSVERSIONINFOA):BOOL"
		alias
			"ewg_function_macro_GetVersionExA"











		end

	get_version_ex_a_address_external: POINTER is
			-- Address of C function `GetVersionExA'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetVersionExA"






	end

	get_version_ex_w_external (lpversioninformation: POINTER): INTEGER is
		external

			"C [macro <c\function\ewg_function_c_glue_code.h>] (LPOSVERSIONINFOW):BOOL"
		alias
			"ewg_function_macro_GetVersionExW"











		end

	get_version_ex_w_address_external: POINTER is
			-- Address of C function `GetVersionExW'
		external






			"C [macro <my_winbase.h>]: void*"
		alias
			"(void*) GetVersionExW"






	end

end