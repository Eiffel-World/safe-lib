indexing

	description:

	    "Objects that..."

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2010/11/30 15:47:28 $";
	revision: "$Revision: 1.1 $";
	author: ""

class
	QA_STRING_LONGVARCHAR

inherit
	QA_CHAR_VALUE
		undefine
			is_buffer_too_small,
			read_result,
			bind_as_parameter,
			put_parameter
		end

	ECLI_STRING_LONGVARCHAR

create
	make, make_force_maximum_capacity

feature

	ecli_type : STRING is do Result := "ECLI_STRING_LONGVARCHAR" end

	value_type : STRING is "STRING"

	creation_call : STRING is
		do
			Result := make_call_with_precision
		end

end

--
--    copyright: "Groupe S (c)"
--    licence: "All rights reserved. Duplication and distribution prohibited."
--
--    source: "$Source: F:/CVSRoot/doc/Se2000/Projet/Standards/full.e.tpl,v ";
