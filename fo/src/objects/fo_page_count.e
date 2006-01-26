indexing
	description: "Objects that..."

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/01/26 18:27:03 $";
	revision: "$Revision: 1.1 $";
	author: ""

class FO_PAGE_COUNT

inherit
	FO_SPECIAL_INLINE

create
	make_inherit, make_with_font

feature -- Basic operations

	update_text (document: FO_DOCUMENT; region: FO_RECTANGLE) is
		do
			set_text (document.page_count.out)
		end
		
invariant
end


