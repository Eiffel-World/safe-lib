-- enum wrapper
class LATENCY_TIME_ENUM_EXTERNAL

feature {ANY}

	lt_dont_care: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"LT_DONT_CARE"
		end














	lt_lowest_latency: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"LT_LOWEST_LATENCY"
		end














end
