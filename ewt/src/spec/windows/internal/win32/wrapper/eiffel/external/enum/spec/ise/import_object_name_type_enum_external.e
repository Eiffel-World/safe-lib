-- enum wrapper
class IMPORT_OBJECT_NAME_TYPE_ENUM_EXTERNAL

feature {ANY}

	import_object_ordinal: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_ORDINAL"
		end














	import_object_name: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_NAME"
		end














	import_object_name_no_prefix: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_NAME_NO_PREFIX"
		end














	import_object_name_undecorate: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_NAME_UNDECORATE"
		end














end
