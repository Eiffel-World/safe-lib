indexing
	description: "Transaction capability constants"
	author: "Paul G. Crismer"
	date: "$Date: 2002/09/28 08:36:00 $"
	revision: "$Revision: 1.1 $"

class
	ECLI_TRANSACTION_CAPABILITY_CONSTANTS

feature -- Status Report

	Sql_tc_none	:	INTEGER is	0
		-- no transaction support

	Sql_tc_dml	:	INTEGER is	1
		-- DML transaction support, DDL cause an error

	Sql_tc_all	:	INTEGER is	2
		-- DML and DDL statements are supported in transactions

	Sql_tc_ddl_commit	:	INTEGER is	3
		-- DML transaction support, DDL commits current transaction

	Sql_tc_ddl_ignore	:	INTEGER is	4
		-- DML transaction support, DDL statements are ignored

end -- class ECLI_TRANSACTION_CAPABILITY_CONSTANTS