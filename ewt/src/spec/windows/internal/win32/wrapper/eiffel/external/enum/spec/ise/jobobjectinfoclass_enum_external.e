-- enum wrapper
class JOBOBJECTINFOCLASS_ENUM_EXTERNAL

feature {ANY}

	jobobjectbasicaccountinginformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectBasicAccountingInformation"
		end














	jobobjectbasiclimitinformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectBasicLimitInformation"
		end














	jobobjectbasicprocessidlist: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectBasicProcessIdList"
		end














	jobobjectbasicuirestrictions: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectBasicUIRestrictions"
		end














	jobobjectsecuritylimitinformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectSecurityLimitInformation"
		end














	jobobjectendofjobtimeinformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectEndOfJobTimeInformation"
		end














	jobobjectassociatecompletionportinformation: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"JobObjectAssociateCompletionPortInformation"
		end














	maxjobobjectinfoclass: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"MaxJobObjectInfoClass"
		end














end
