-- enum wrapper
class EXCEPTION_DISPOSITION_ENUM_EXTERNAL

feature {ANY}

	exceptioncontinueexecution: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"ExceptionContinueExecution"
		end














	exceptioncontinuesearch: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"ExceptionContinueSearch"
		end














	exceptionnestedexception: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"ExceptionNestedException"
		end














	exceptioncollidedunwind: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"ExceptionCollidedUnwind"
		end














end
