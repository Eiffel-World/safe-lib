-- enum wrapper
class AUDIT_EVENT_TYPE_ENUM_EXTERNAL

feature {ANY}

	auditeventobjectaccess: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AuditEventObjectAccess"
		end














	auditeventdirectoryserviceaccess: INTEGER is
		external

			"C macro use <my_winbase.h>"
		alias
			"AuditEventDirectoryServiceAccess"
		end














end
