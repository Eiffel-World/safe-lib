indexing
	description: "Objects that are procedure type metadata"
	author: "Paul G. Crismer"
	date: "$Date: 2003/09/16 18:52:26 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_PROCEDURE_TYPE_METADATA

inherit
	ECLI_PROCEDURE_TYPE_METADATA_CONSTANTS
	
feature {NONE} -- Access

	column_type : INTEGER
	
feature -- Measurement

feature -- Status report

	is_type_input_parameter : BOOLEAN is
			-- Input parameter
		do
			Result := column_type = Sql_param_input
		end
		
	is_type_output_parameter : BOOLEAN is
			-- Output parameter
		do
			Result := column_type = Sql_param_output
		end

	is_type_input_output_parameter : BOOLEAN is
			-- Input/output parameter
		do
			Result := column_type = Sql_param_input_output
		end

	is_type_result : BOOLEAN is
			-- Return value of a procedure
		do
			Result := column_type = Sql_return_value
		end

	is_type_unknow : BOOLEAN is
			-- Unkown type
		do
			Result := column_type = Sql_param_type_unknown
		end

	is_type_column : BOOLEAN is
			-- Column of result-set
		do
			Result := column_type = Sql_result_col
		end
		
end -- class ECLI_PROCEDURE_TYPE_METADATA
