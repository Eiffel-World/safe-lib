-- enum wrapper
class TOKEN_TYPE_ENUM_EXTERNAL

feature {ANY}

	tokenprimary: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenPrimary"
		end














	tokenimpersonation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenImpersonation"
		end














end
