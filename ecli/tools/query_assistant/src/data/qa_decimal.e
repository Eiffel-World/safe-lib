indexing
	description: "NUMBER/DECIMAL values."
	author: ""
	date: "$Date: 2007/11/15 10:01:50 $"
	revision: "$Revision: 1.3 $"

class
	QA_DECIMAL

inherit
	ECLI_DECIMAL
	
	QA_VALUE
		undefine
			bind_as_parameter
		end

create
	make
	
feature

	ecli_type : STRING is "ECLI_DECIMAL"
		
	value_type : STRING is "MA_DECIMAL"

	creation_call : STRING is
		do
			Result := make_call_with_precision_and_digits
		end

end -- class QA_DECIMAL
