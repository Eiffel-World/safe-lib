-- enum wrapper
class TOKEN_INFORMATION_CLASS_ENUM_EXTERNAL

feature {ANY}

	tokenuser: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenUser"
		end














	tokengroups: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenGroups"
		end














	tokenprivileges: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenPrivileges"
		end














	tokenowner: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenOwner"
		end














	tokenprimarygroup: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenPrimaryGroup"
		end














	tokendefaultdacl: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenDefaultDacl"
		end














	tokensource: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenSource"
		end














	tokentype: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenType"
		end














	tokenimpersonationlevel: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenImpersonationLevel"
		end














	tokenstatistics: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenStatistics"
		end














	tokenrestrictedsids: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenRestrictedSids"
		end














	tokensessionid: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"TokenSessionId"
		end














end
