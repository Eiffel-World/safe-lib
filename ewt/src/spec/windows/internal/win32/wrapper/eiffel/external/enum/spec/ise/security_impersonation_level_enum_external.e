-- enum wrapper
class SECURITY_IMPERSONATION_LEVEL_ENUM_EXTERNAL

feature {ANY}

	securityanonymous: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SecurityAnonymous"
		end














	securityidentification: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SecurityIdentification"
		end














	securityimpersonation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SecurityImpersonation"
		end














	securitydelegation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SecurityDelegation"
		end














end
