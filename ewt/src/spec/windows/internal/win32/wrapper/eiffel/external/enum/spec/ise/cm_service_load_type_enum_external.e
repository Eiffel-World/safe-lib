-- enum wrapper
class CM_SERVICE_LOAD_TYPE_ENUM_EXTERNAL

feature {ANY}

	bootload: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"BootLoad"
		end














	systemload: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SystemLoad"
		end














	autoload: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AutoLoad"
		end














	demandload: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"DemandLoad"
		end














	disableload: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"DisableLoad"
		end














end
