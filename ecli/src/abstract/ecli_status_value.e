note
	description: "Summary description for {ECLI_STATUS_VALUE}."
	author: ""
	date: "$Date: 2012/07/04 18:54:48 $"
	revision: "$Revision: 1.1.2.1 $"

class
	ECLI_STATUS_VALUE

inherit
	ECLI_STATUS

create
	default_create,
	make_copy

feature {} -- Implementation

	get_error_diagnostic (record_index : INTEGER; state : POINTER; native_error : POINTER; message : POINTER; buffer_length : INTEGER; length_indicator : POINTER) : INTEGER  is
		do

		end
		
end
