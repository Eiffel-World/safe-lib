-- enum wrapper
class IMPORT_OBJECT_TYPE_ENUM_EXTERNAL

feature {ANY}

	import_object_code: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_CODE"
		end














	import_object_data: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_DATA"
		end














	import_object_const: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IMPORT_OBJECT_CONST"
		end














end
