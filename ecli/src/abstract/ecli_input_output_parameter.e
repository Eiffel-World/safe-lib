indexing
	description: "Input/Output parameters in SQL statements."
	author: "Paul G. Crismer"
	date: "$Date: 2004/03/01 14:08:42 $"
	revision: "$Revision: 1.3 $"

class
	ECLI_INPUT_OUTPUT_PARAMETER

inherit
	ECLI_STATEMENT_PARAMETER

creation
	make
	
feature -- Access

feature -- Measurement

feature -- Status report

	is_input : BOOLEAN is 
		do 
			Result := False 
		ensure then
			is_false: not Result
		end
		
	is_input_output : BOOLEAN is 
		do 
			Result := True 
		ensure then
			is_true: Result
		end
		
	is_output : BOOLEAN is 
		do 
			Result := False 
		ensure then
			is_false: not Result
		end
	
feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature {ECLI_STATEMENT} -- Basic operations

	bind (statement : ECLI_STATEMENT; position : INTEGER) is
		do
			item.bind_as_input_output_parameter (statement, position)
		end
		
feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	is_input_output: is_input_output

end -- class ECLI_INPUT_OUTPUT_PARAMETER
