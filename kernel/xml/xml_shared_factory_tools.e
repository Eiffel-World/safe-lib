indexing
	description: "Access to shared XML factory tools"
	author: "Paul G. Crismer"
	date: "$Date: 2006/01/26 18:17:22 $"
	revision: "$Revision: 1.1 $"

class
	XML_SHARED_FACTORY_TOOLS

feature -- Access

	xml_tools : XML_FACTORY_TOOLS is
			-- xml factory tools
		once
			create Result
		end
		
end -- class XML_SHARED_FACTORY_TOOLS
