-- enum wrapper
class CM_ERROR_CONTROL_TYPE_ENUM_EXTERNAL

feature {ANY}

	ignoreerror: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"IgnoreError"
		end














	normalerror: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"NormalError"
		end














	severeerror: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SevereError"
		end














	criticalerror: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"CriticalError"
		end














end
