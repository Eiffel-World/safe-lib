indexing
	description: "NUMBER/DECIMAL values."
	author: ""
	date: "$Date: 2006/02/16 15:41:59 $"
	revision: "$Revision: 1.2 $"

class
	QA_DECIMAL

inherit
	ECLI_DECIMAL
	
	QA_VALUE
		undefine
			bind_as_parameter
		end

creation
	make
	
feature

	ecli_type : STRING is "ECLI_DECIMAL"
		
	value_type : STRING is "MA_DECIMAL"

	creation_call : STRING is
		do
			Result := make_call_with_precision_and_digits
		end

end -- class QA_DECIMAL
