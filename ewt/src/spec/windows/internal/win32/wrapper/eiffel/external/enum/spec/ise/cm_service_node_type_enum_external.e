-- enum wrapper
class CM_SERVICE_NODE_TYPE_ENUM_EXTERNAL

feature {ANY}

	drivertype: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"DriverType"
		end














	filesystemtype: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"FileSystemType"
		end














	win32serviceownprocess: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"Win32ServiceOwnProcess"
		end














	win32serviceshareprocess: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"Win32ServiceShareProcess"
		end














	adaptertype: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AdapterType"
		end














	recognizertype: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"RecognizerType"
		end














end
