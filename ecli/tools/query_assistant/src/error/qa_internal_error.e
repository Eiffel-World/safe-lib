indexing

	description:
	
			"Internal Errors"

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2004/12/07 21:13:05 $"

class
	QA_INTERNAL_ERROR

inherit
	QA_ERROR

creation
	
	make_could_not_create_parameter,
	make_xml_parser_unavailable,
	make_column_length_too_large,
	make_column_length_truncated
	
feature {NONE} -- Initialization

	make_could_not_create_parameter (name, module : STRING) is
			-- Could not create parameter `name' in `module'.
		require
			name_not_void: name /= Void
		do
			default_template := Cncp_template
			create parameters.make (1, 2)
			parameters.put (name, 1)
			parameters.put (module, 2)
		end
		
	make_xml_parser_unavailable (name : STRING) is
			-- XML Parser `name' not available.
		require
			name_not_void: name /= Void
		do
			default_template := Xpunvl_template
			create parameters.make (1, 1)
			parameters.put (name, 1)
		end
		
	make_column_length_too_large (module, column : STRING; length : INTEGER; parameter : BOOLEAN) is
			-- Length `length' of `column' `parameter/result' in `module' is too large.
		require
			module_not_void: module /= Void
			column_not_void: column /= Void
			length_strictly_positive: length > 0
		do
			default_template := Ctool_template
			create parameters.make (1, 4)
			parameters.put (column, 1)
			parameters.put (module, 2)
			parameters.put (length.out, 3)
			if parameter then
				parameters.put (parameter_constant, 4)
			else
				parameters.put (result_constant, 4)
			end
		end
		
	make_column_length_truncated (module, column : STRING; length : INTEGER; parameter : BOOLEAN) is
			-- Length of `column' `parameter/result' in `module' has been truncated to `length'.
		require
			module_not_void: module /= Void
			column_not_void: column /= Void
			length_strictly_positive: length > 0
		do
			default_template := Ctrunc_template
			create parameters.make (1, 4)
			parameters.put (column, 1)
			parameters.put (module, 2)
			parameters.put (length.out, 3)
			if parameter then
				parameters.put (parameter_constant, 4)
			else
				parameters.put (result_constant, 4)
			end
		end
		
feature -- Access

feature -- Measurement

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

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	cncp_template : STRING is   "[E-INT-CNCRPAR] Could not create parameter $1 in module $2."
	xpunvl_template : STRING is "[E-INT-PARSNVL] XML parser $1 not available. Please choose another one."
	ctool_template : STRING is  "[W-INT-COLNTOL] Length of `$1' $4 in `$2' is too large : `$3' bytes."
	ctrunc_template : STRING is "[W-INT-COLNTRC] Length of `$1' $4 in `$2' has been truncated to `$3' bytes."
	
	parameter_constant : STRING is "parameter"
	result_constant : STRING is "result"
	
invariant
	invariant_clause: True -- Your invariant here

end -- class QA_INTERNAL_ERROR
