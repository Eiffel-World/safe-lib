indexing
	description: "Nullable metadata constants"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/28 08:36:00 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_NULLABILITY_CONSTANTS

feature -- Status Report

	--  values of NULLABLE field in descriptor 
	Sql_no_nulls	:	INTEGER is	0
	Sql_nullable	:	INTEGER is	1

	-- Value returned by SQLGetTypeInfo() to denote that it is
	-- not known whether or not a data type supports null values.
	--
	Sql_nullable_unknown	:	INTEGER is	2

end -- class ECLI_NULLABILITY_CONSTANTS
