indexing
	description: "Objets that handles insufficient with errors in formats"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2005/07/31 18:22:28 $";
	revision: "$Revision: 1.1 $";
	author: "Fafchamps Eric"

class
	FM_INSUFFICIENT_WIDTH_HANDLER [G]

feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature {FM_SINGLE_LINE_FORMAT} -- Basic operations

	string_with_valid_width (an_object: G; a_format: FM_SINGLE_LINE_FORMAT [G]): STRING is
			-- String with valid width width.
		require
			last_formatted_not_void: a_format.last_formatted /= Void
		local 
			estring: ESTRING
		do
			Result := clone (a_format.last_formatted)
			Result.head (a_format.width)
		ensure
			valid_width: Result.count <= a_format.width
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class FM_INSUFFICIENT_WIDTH_HANDLER


