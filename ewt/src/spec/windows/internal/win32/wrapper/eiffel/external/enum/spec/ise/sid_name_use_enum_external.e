-- enum wrapper
class SID_NAME_USE_ENUM_EXTERNAL

feature {ANY}

	sidtypeuser: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeUser"
		end














	sidtypegroup: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeGroup"
		end














	sidtypedomain: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeDomain"
		end














	sidtypealias: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeAlias"
		end














	sidtypewellknowngroup: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeWellKnownGroup"
		end














	sidtypedeletedaccount: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeDeletedAccount"
		end














	sidtypeinvalid: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeInvalid"
		end














	sidtypeunknown: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeUnknown"
		end














	sidtypecomputer: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"SidTypeComputer"
		end














end
