indexing

	description:

		"Objects that represent a session to a database."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2006, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2010/08/31 21:42:02 $"

class ECLI_SESSION

inherit

	ECLI_STATUS
		export
			{ECLI_LOGIN_STRATEGY} set_status
		end

	ECLI_HANDLE
		export
			{ANY} is_valid;
			{ECLI_LOGIN_STRATEGY, ECLI_HANDLE, ECLI_DBMS_INFORMATION} handle
		end

	ECLI_SHARED_ENVIRONMENT

	PAT_PUBLISHER [ECLI_STATEMENT]
		rename
			subscribe as register_statement,
			unsubscribe as unregister_statement,
			has_subscribed as is_registered_statement,
			subscribers as statements,
			impl_subscribers as impl_statements,
			count as statements_count
		export
			{ECLI_STATEMENT}
				register_statement,
				unregister_statement,
				is_registered_statement
		end

	PAT_SUBSCRIBER
		rename
			publisher as environment,
			published as environment_release,
			has_publisher as has_environment,
			unsubscribed as is_closed
		redefine
			environment_release
		end

	ECLI_TRANSACTION_CAPABILITY_CONSTANTS

create

	make, make_default

feature -- Initialization

	make, open (a_data_source, a_user_name, a_password : STRING) is
			-- Make session using `a_data_source', `a_user_name', `a_password'.
		obsolete "[2005-01-04] Use `make_default' followed by `set_login_strategy' instead."
		require
			data_source_defined: a_data_source /= Void
			user_name_defined: a_user_name/= Void
			password_defined: a_password /= Void
			closed: is_closed
		do
			make_default
			create {ECLI_SIMPLE_LOGIN}login_strategy.make (a_data_source, a_user_name, a_password)
		ensure
			data_source_set : data_source.is_equal (a_data_source)
			user_name_set : user_name.is_equal (a_user_name)
			password_set : password.is_equal (a_password)
			ready_to_connect: is_ready_to_connect
			valid: is_valid
			open:  not is_closed
		end

	make_default is
			-- Default creation.
		require
			is_closed: is_closed
		do
			create error_handler.make_null
			allocate
			reset_implementation
			create info.make (Current)
		ensure
			valid: is_valid
			open: not is_closed
		end

feature -- Access

	login_strategy : ECLI_LOGIN_STRATEGY
			-- Login strategy used for connection.

	data_source : STRING is
			-- Data source used for connection
		obsolete "[2004-12-23]Use `login_strategy' instead."
		do
			Result := simple_login.datasource_name
		end

	user_name : STRING is
			-- User name used for connection
		obsolete "[2004-12-23]Use `login_strategy' instead."
		do
			Result := simple_login.user_name
		end

	password : STRING is
			-- Password used for connection
		obsolete "[2004-12-23]Use `login_strategy' instead."
		do
			Result := simple_login.password
		end

	info : ECLI_DBMS_INFORMATION
			-- Various informations about underlying DBMS.

	transaction_capability : INTEGER is
			-- Transaction capability of established session
		require
			connected: is_connected
		do
			--| evaluate capability
			if impl_transaction_capability < sql_tc_none then
				set_status ("ecli_c_transaction_capable", ecli_c_transaction_capable (handle, ext_transaction_capability.handle))
			end
			Result := impl_transaction_capability
		ensure
			definition: Result = Sql_tc_all or else Result = Sql_tc_ddl_commit or else Result = Sql_tc_ddl_ignore
				or else Result = Sql_tc_dml or else Result = Sql_tc_none
		end

	tracer : ECLI_TRACER
			-- Tracer of all SQL. Void implies no trace.

	api_trace_filename : STRING is
			-- Name of the api trace file.
		local
			ext_string: XS_C_STRING
			int32: XS_C_INT32
		do
			create ext_string.make (2048)
			create int32.make
			set_status ("ecli_c_get_pointer_connection_attribute", ecli_c_get_pointer_connection_attribute (handle, att.sql_attr_tracefile, ext_string.handle, ext_string.capacity, int32.handle))
			Result := ext_string.substring (1, int32.item)
		ensure
			api_trace_filename_not_void: Result /= Void
		end

	transaction_isolation : ECLI_TRANSACTION_ISOLATION is
			-- Current active transaction isolation options
		local
			ext_txn_isolation : XS_C_UINT32
		do
			create ext_txn_isolation.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.Sql_attr_txn_isolation , ext_txn_isolation.handle))
			create Result.make (ext_txn_isolation.item)
		ensure
			transaction_isolation_not_void: Result /= Void
		end

	connection_timeout : DT_TIME_DURATION is
			-- Duration corresponding to the number of seconds to wait for any request on the connection
			-- to complete before returning to the application.
			-- Result.second_count = 0 means no timeout
		local
			ext_connection_timeout: XS_C_UINT32
		do
			create ext_connection_timeout.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.sql_attr_connection_timeout, ext_connection_timeout.handle))
			create Result.make_canonical (ext_connection_timeout.item)
		ensure
			connection_timeout_not_void: Result /= Void
		end

	login_timeout : DT_TIME_DURATION is
			-- Duration corresponding to the number of seconds to wait for a login request to complete
			-- before returning to the application. The default is driver-dependent.
			-- Result.second_count = 0 means not timeout and a connection attempt will wait indefinitely.
		local
			ext_connection_timeout: XS_C_UINT32
		do
			create ext_connection_timeout.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.sql_attr_login_timeout, ext_connection_timeout.handle))
			create Result.make_canonical (ext_connection_timeout.item)
		ensure
			login_timeout_not_void: Result /= Void
		end

	network_packet_size : INTEGER is
			-- Network packet size.
			-- Note:   Many data sources either do not support this option or only can return but not set
			--         the network packet size.
		local
			uint32 : XS_C_UINT32
		do
			create uint32.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.sql_attr_packet_size, uint32.handle))
			Result := uint32.item
		end

	set_network_packet_size (new_size : INTEGER) is
			--  If the specified size exceeds the maximum packet size
			--  or is smaller than the minimum packet size, the driver substitutes that value and
			--  returns SQLSTATE 01S02 (Option value changed).
		require
			new_size_positive: new_size > 0
			not_connected: not is_connected
		do
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute(handle, att.sql_attr_packet_size, new_size))
		ensure
			network_packet_size_set: (is_ok and not cli_state.is_equal ("01S02")) implies network_packet_size = new_size
		end

feature -- Status report

	has_pending_transaction : BOOLEAN is
			-- Has the session a pending transaction ?
		do
			Result := impl_has_pending_transaction
		end

	is_manual_commit : BOOLEAN is
			-- Is this session in 'manual commit mode' ?
		require
			valid: is_valid
			connected: is_connected
		do
			set_status ("ecli_c_is_manual_commit", ecli_c_is_manual_commit (handle, ext_is_manual_commit.handle))
			Result := impl_is_manual_commit
		end

	is_ready_to_connect : BOOLEAN is
			-- Is this session ready to be connected ?
		do
			Result := (login_strategy /= Void)
		ensure
			definition: Result = (login_strategy /= Void)
		end

	is_connected : BOOLEAN is
			-- Is this session connected to a database ?
		do
			Result := impl_is_connected
		ensure
			connected_valid: Result implies is_valid
		end

	is_connection_dead : BOOLEAN is
			-- Is the connection dead ?
		local
			uint_result : XS_C_UINT32
		do
			create uint_result.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.Sql_attr_connection_dead,uint_result.handle))
			Result := (uint_result.item = att.Sql_cd_true)
		end

	is_transaction_capable : BOOLEAN is
		require
			connected: is_connected
		do
			Result := transaction_capability /= sql_tc_none
		ensure
			capability: Result implies (transaction_capability = sql_tc_all or
				transaction_capability = sql_tc_dml or
				transaction_capability = sql_tc_ddl_commit or
				transaction_capability = sql_tc_ddl_ignore )
		end

	is_describe_parameters_capable : BOOLEAN is
			-- Can 'ECLI_STATEMENT.describe_parameters' be called ?
		local
			functions : ECLI_FUNCTIONS_CONSTANTS
		do
			create functions
			if impl_describe_parameters_capability < sql_false then
				set_status ("ecli_c_sql_get_functions", ecli_c_sql_get_functions (handle, functions.Sql_api_sqldescribeparam, ext_describe_parameters_capability.handle))
			end
			Result := impl_describe_parameters_capability = sql_true
		end

	is_bind_arrayed_parameters_capable : BOOLEAN is
			-- Can arrayed parameters be used in rowset operations ?
		local
			dummy_statement : ECLI_STATEMENT
		do
			if impl_is_bind_arrayed_parameters_capability < 0 then
				create dummy_statement.make (Current)
				if dummy_statement.can_use_arrayed_parameters then
					impl_is_bind_arrayed_parameters_capability := 1
				else
					impl_is_bind_arrayed_parameters_capability := 0
				end
				dummy_statement.close
			end
			Result := impl_is_bind_arrayed_parameters_capability = 1
		end

	is_bind_arrayed_results_capable : BOOLEAN is
			-- Can arrayed results be used  ?
		local
			dummy_statement : ECLI_STATEMENT
		do
			if impl_is_bind_arrayed_results_capability < 0 then
				create dummy_statement.make (Current)
				if dummy_statement.can_use_arrayed_results then
					impl_is_bind_arrayed_results_capability := 1
				else
					impl_is_bind_arrayed_results_capability := 0
				end
				dummy_statement.close
			end
			Result := impl_is_bind_arrayed_results_capability = 1
		end

	is_tracing : BOOLEAN is
			-- Is this session tracing SQL statements ?
		do
			Result := tracer /= Void
		ensure
			tracing_is_tracer_not_void: Result = (tracer /= Void)
		end

	is_api_tracing : BOOLEAN is
			-- Is this session tracing ODBC/CLI api calls ?
		local
			uint32 : XS_C_UINT32
		do
			create uint32.make
			set_status ("ecli_c_get_integer_connection_attribute", ecli_c_get_integer_connection_attribute (handle, att.sql_attr_trace,uint32.handle))
			Result := (uint32.item = att.sql_opt_trace_on)
		end

feature -- Status setting

	set_manual_commit is
			-- Set commit mode to `manual'
		require
			valid: is_valid
			connected: is_connected
			capable : is_transaction_capable
		do
			--| actual setting of manual commit
			set_status ("ecli_c_set_manual_commit", ecli_c_set_manual_commit (handle, True))
		ensure
			is_manual_commit
		end

	set_automatic_commit is
			-- Set commit mode to `automatic'
		require
			valid: is_valid
			connected: is_connected
		do
			--| actual setting of automatic commit
			set_status ("ecli_c_set_manual_commit", ecli_c_set_manual_commit (handle, False))
		ensure
			automatic_commit: not is_manual_commit
		end

	disable_tracing is
			-- Disable SQL tracing.
		require
			tracing: is_tracing
		do
			tracer := Void
		ensure
			not_tracing: not is_tracing
			no_tracer: tracer = Void
		end

	enable_api_tracing is
			-- Enable ODBC API tracing into `api_trace_filename'.
--		require
--			-- FIXME: api_trace_filename set.
		do
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute (handle, att.sql_attr_trace , att.sql_opt_trace_on))
		end

	disable_api_tracing is
			-- Disable ODBC API tracing.
		do
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute (handle, att.sql_attr_trace , att.sql_opt_trace_off))
		end

--SQL_ATTR_TRACE
--	Either
--	(ODBC 1.0)
--	An SQLUINTEGER value telling the Driver Manager whether to perform tracing:
--	SQL_OPT_TRACE_OFF = Tracing off (the default)
--	
--	SQL_OPT_TRACE_ON = Tracing on
--	
--	When tracing is on, the Driver Manager writes each ODBC function call to the trace file.
--	
--	Note   When tracing is on, the Driver Manager can return SQLSTATE IM013 (Trace file error) from any function.
--	An application specifies a trace file with the SQL_ATTR_TRACEFILE option. If the file already exists, the Driver Manager appends to the file. Otherwise, it creates the file. If tracing is on and no trace file has been specified, the Driver Manager writes to the file SQL.LOG in the root directory.
--	
--	An application can set the variable ODBCSharedTraceFlag to enable tracing dynamically. Tracing is then enabled for all ODBC applications currently running. If an application turns tracing off, it is turned off only for that application.
--	
--	If the Trace keyword in the system information is set to 1 when an application calls SQLAllocHandle with a HandleType of SQL_HANDLE_ENV, tracing is enabled for all handles. It is enabled only for the application that called SQLAllocHandle.
--	
--	Calling SQLSetConnectAttr with an Attribute of SQL_ATTR_TRACE does not require that the ConnectionHandle argument be valid and will not return SQL_ERROR if ConnectionHandle is NULL. This attribute applies to all connections.

--SQL_ATTR_TRACEFILE
--	Either
--	(ODBC 1.0)
--	A null-terminated character string containing the name of the trace file.
--	The default value of the SQL_ATTR_TRACEFILE attribute is specified with the TraceFile keyword in the system information. For more information, see ODBC Subkey.
--	
--	Calling SQLSetConnectAttr with an Attribute of SQL_ATTR_ TRACEFILE does not require the ConnectionHandle argument to be valid and will not return SQL_ERROR if ConnectionHandle is invalid. This attribute applies to all connections.

feature -- Element change

	set_login_strategy (new_login : ECLI_LOGIN_STRATEGY) is
			-- Change `login_strategy' to `new_login'.
		require
			not_connected: not is_connected
			new_login_not_void: new_login /= Void
		do
			login_strategy := new_login
		ensure
			login_strategy_set: login_strategy = new_login
		end

	set_user_name(a_user_name: STRING) is
			-- Set `user' to `a_user'
		obsolete "[2004-12-23]Use `login_strategy' instead."
		require
			not_connected: not is_connected
			a_user_ok: a_user_name/= Void
		do
			simple_login.set_user_name (a_user_name)
		ensure
			user_name_set: user_name.is_equal (a_user_name)
		end

	set_data_source (a_data_source : STRING) is
			-- Set `data_source' to `a_data_source'
		obsolete "[2004-12-23]Use `set_login_strategy' instead."
		require
			not_connected: not is_connected
			a_data_source_ok: a_data_source /= Void
		do
			simple_login.set_datasource_name (a_data_source)
		ensure
			data_source_set: data_source.is_equal (a_data_source)
		end

	set_password (a_password : STRING) is
			-- Set password to 'a_password
		obsolete "[2004-12-23]Use `set_login_strategy' instead."
		require
			not_connected: not is_connected
			a_password_ok: a_password /= Void
		do
			simple_login.set_password (a_password)
		ensure
			password_set: password.is_equal (a_password)
		end

	set_tracer (a_tracer : ECLI_TRACER) is
			-- Trace SQL with `a_tracer'.
		require
			tracer_ok: a_tracer /= Void
		do
			tracer := a_tracer
		ensure
			tracer_set: tracer = a_tracer
			tracing: is_tracing
		end

	set_transaction_isolation (an_isolation : ECLI_TRANSACTION_ISOLATION) is
			-- Change transaction isolation level
		require
			an_isolation_not_void: an_isolation /= Void
			no_pending_transaction: not has_pending_transaction
		do
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute (handle, att.Sql_attr_txn_isolation,  an_isolation.value))
		ensure
			done_when_ok: is_ok implies (transaction_isolation.is_equal (an_isolation))
		end

	set_login_timeout (duration : DT_TIME_DURATION) is
			-- Set `login_timeout' to `duration'.
			-- If the specified timeout exceeds the maximum login timeout in the data source,
			-- the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).
		require
			not_connected: not is_connected
			duration_not_void: duration /= Void
		local
			uint32: XS_C_UINT32
		do
			create uint32.make
			uint32.put (duration.second_count)
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute (handle, att.sql_attr_login_timeout,  uint32.item))
		ensure
			login_timeout_set: (is_ok and not cli_state.is_equal ("01S02")) implies login_timeout.is_equal (duration)
		end

	set_connection_timeout (duration : DT_TIME_DURATION) is
			-- Set `connection_timeout' to `duration'.
			-- If the specified timeout exceeds the maximum connection timeout in the data source,
			-- the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).
		require
			not_connected: not is_connected
			duration_not_void: duration /= Void
		local
			uint32: XS_C_UINT32
		do
			create uint32.make
			uint32.put (duration.second_count)
			set_status ("ecli_c_set_integer_connection_attribute", ecli_c_set_integer_connection_attribute (handle, att.sql_attr_connection_timeout,  uint32.item))
		ensure
			connection_timeout_set: (is_ok and not cli_state.is_equal ("01S02")) implies connection_timeout.is_equal (duration)
		end

	set_api_trace_filename (filename : STRING; file_system : KI_FILE_SYSTEM) is
			-- Set `api_trace_filename' to `filename'.
		require
			filename_not_void: filename /= Void
			file_system_not_void: file_system /= Void
			file_name_valid: file_system.directory_exists (file_system.dirname (filename))
			not_api_tracing: not is_api_tracing
		local
			xs_string : XS_C_STRING
		do
			create xs_string.make_from_string (filename)
			set_status ("ecli_c_set_pointer_connection_attribute", ecli_c_set_pointer_connection_attribute (handle, att.sql_attr_tracefile, xs_string.handle, filename.count))
		ensure
			api_trace_filename_set: is_ok implies file_system.basename (api_trace_filename).is_equal (file_system.basename (filename))
		end

feature -- Basic Operations

	begin_transaction is
			-- Begin a new transaction
		require
			connected: is_connected
			capable : is_transaction_capable
		do
			set_manual_commit
			if is_ok then
				impl_has_pending_transaction := True
			end
			if is_tracing then
				tracer.trace_begin
			end
		ensure
			manual_commit:	is_manual_commit implies is_ok
			has_pending_transaction: has_pending_transaction implies is_ok
		end

	commit is
			-- Commit current transaction
		require
			valid: is_valid
			connected: is_connected
			manual_commit: is_manual_commit
			pending_transaction: has_pending_transaction
		do
			set_status ("ecli_c_commit", ecli_c_commit (handle))
			if is_ok then
				impl_has_pending_transaction := False
			end
			set_automatic_commit
			if is_tracing then
				tracer.trace_commit
			end
		ensure
			no_pending_transaction: not has_pending_transaction implies is_ok
			automatic_commit : not is_manual_commit
		end

	rollback is
			-- Rollback current transaction
		require
			valid: is_valid
			connected: is_connected
			manual_commit: is_manual_commit
			pending_transaction: has_pending_transaction
		do
			set_status ("ecli_c_rollback", ecli_c_rollback (handle))
			if is_ok then
				impl_has_pending_transaction := False
			end
			set_automatic_commit
			if is_tracing then
				tracer.trace_rollback
			end
		ensure
			no_pending_transaction: not has_pending_transaction implies is_ok
			automatic_commit : not is_manual_commit
		end

	connect is
			-- Connect using `login_strategy'
		require
			is_valid: is_valid
			not_connected: not is_connected
			ready_to_connect: is_ready_to_connect
		do
			login_strategy.connect (Current)
			if is_ok and then status /= Sql_no_data then
				set_connected
			end
		ensure
			connected: is_connected implies is_ok
		end

	connect_with_strategy (new_strategy: ECLI_LOGIN_STRATEGY) is
			-- Connect using `new_strategy'.
		require
			is_valid: is_valid
			not_connected: not is_connected
		do
			login_strategy := new_strategy
			connect
		ensure
			login_set: login_strategy = new_strategy
			connected: is_connected implies is_ok
		end

	disconnect is
			-- Disconnect the session and close any remaining statement
		require
			is_valid: is_valid
			connected: is_connected
		local
			statements_cursor : DS_LIST_CURSOR[ECLI_STATEMENT]
		do
			-- First close all statements, if any
			if statements_count > 0 then
				from
					statements_cursor := statements.new_cursor
					statements_cursor.start
				until
					statements_cursor.off
				loop
					statements_cursor.item.do_close
					statements_cursor.forth
				end
				statements.wipe_out
				statements_count := 0
			end
			do_disconnect
		ensure
			not_connected: not is_connected implies is_ok
			no_opened_statements: statements_count = 0
		end

	close is
			-- Close the session
		require
			valid: is_valid
			not_connected: not is_connected
			not_closed: not is_closed
		do
			if not is_closed then
				environment.unregister_session (Current)
			end
			release_handle
			environment := Void
		ensure
			closed:     	is_closed
			unregistered:	not (old environment).is_registered_session (Current)
			not_valid:  	not is_valid
		end

feature {ECLI_ENVIRONMENT} --

	environment_release (env : like environment) is
			-- Environment is being released
		do
			if is_connected then
				disconnect
			end
			release_handle
			environment := Void
		ensure then
			released_environment: is_closed = True
		end

feature {NONE} -- Implementation

	simple_login : ECLI_SIMPLE_LOGIN is
		do
			Result ?= login_strategy
		end

	reset_implementation is
			-- Reset all implementation values to default ones
		do
			ext_transaction_capability.put (sql_tc_none - 1)
			ext_describe_parameters_capability.put (sql_false - 1)
			impl_is_bind_arrayed_parameters_capability := -1
			impl_is_bind_arrayed_results_capability := -1
		end

	release_handle is
		do
			if is_connected then
				do_disconnect
			end
			if handle /= default_pointer then
				set_status ("ecli_c_free_connection", ecli_c_free_connection (handle))
			end
			set_handle ( default_pointer)
		end

	impl_has_pending_transaction : BOOLEAN

	set_connected is
		do
			impl_is_connected := True
		end

	set_disconnected is
		do
			impl_is_connected := False
		end

	impl_is_connected : BOOLEAN

	get_error_diagnostic (record_index : INTEGER; state : POINTER; native_error : POINTER; message : POINTER; buffer_length : INTEGER; length_indicator : POINTER) : INTEGER  is
			-- To be redefined in descendant classes
		do
			Result := ecli_c_session_error (handle, record_index, state, native_error, message, buffer_length, length_indicator)

		end

	impl_is_manual_commit : BOOLEAN is
		do
			Result := ext_is_manual_commit.item
		end

	impl_transaction_capability : INTEGER is
		do
			Result := ext_transaction_capability.item
		end

	ext_is_manual_commit : XS_C_BOOLEAN
	ext_transaction_capability : XS_C_INT32
	ext_describe_parameters_capability : XS_C_INT32

	impl_describe_parameters_capability : INTEGER is do Result := ext_describe_parameters_capability.item end

	impl_is_bind_arrayed_parameters_capability : INTEGER
	impl_is_bind_arrayed_results_capability	: INTEGER

	allocate is
			-- Allocate HANDLE
		require
			is_closed: is_closed
		local
			henv : pointer
			ext_handle : XS_C_POINTER
		do
			create ext_handle.make
			create ext_is_manual_commit.make
			create ext_transaction_capability.make
			create ext_describe_parameters_capability.make

			-- | Allocate session handle
			environment := shared_environment
			henv := environment.handle
			set_status ("ecli_c_allocate_connection", ecli_c_allocate_connection(henv, ext_handle.handle))
			handle := ext_handle.item
			--| register with environment
			environment.register_session (Current)
		ensure
			registered: environment.is_registered_session (Current)
			valid: is_valid
		end

	is_ready_for_disposal : BOOLEAN is
			-- Is this object ready for disposal ?
		do
			Result := statements_count = 0
		end

	disposal_failure_reason : STRING is
		once
			Result := "ECLI_STATEMENT still opened on Current; Close them before closing this session."
		end

	environment : ECLI_ENVIRONMENT

	do_disconnect is
			-- Do disconnect
		do
			--| actual disconnect
			set_status ("ecli_c_disconnect", ecli_c_disconnect (handle))
			if is_ok then
				set_disconnected
			end
		end

	att : ECLI_CONNECTION_ATTRIBUTE_CONSTANTS is
		once
			create Result
		end

invariant
	valid_session: environment /= Void implies environment = shared_environment
	info_not_void: info /= Void
end
