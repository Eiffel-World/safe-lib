-- enum wrapper
class ACL_INFORMATION_CLASS_ENUM_EXTERNAL

feature {ANY}

	aclrevisioninformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AclRevisionInformation"
		end














	aclsizeinformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AclSizeInformation"
		end














end
