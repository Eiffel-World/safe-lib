-- enum wrapper
class GET_FILEEX_INFO_LEVELS_ENUM_EXTERNAL

feature {ANY}

	getfileexinfostandard: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"GetFileExInfoStandard"
		end














	getfileexmaxinfolevel: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"GetFileExMaxInfoLevel"
		end














end
