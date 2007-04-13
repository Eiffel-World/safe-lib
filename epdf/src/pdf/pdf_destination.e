indexing
	description: "PDF Destinations"
	author: "Paul G. Crismer"
	date: "$Date: 2007/04/13 09:32:03 $"
	revision: "$Revision: 1.2 $"

deferred class
	PDF_DESTINATION

inherit
	PDF_SERIALIZABLE
		undefine
			put_pdf
		end

feature -- Conversion

	to_pdf : STRING is
		do
			Result := to_pdf_using_put_pdf
		end

feature -- Inapplicable

	number : INTEGER is do  end

end -- class PDF_DESTINATION
