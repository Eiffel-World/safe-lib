indexing
	description: "Objects that CONNECT to a database."
	author: "Paul G. Crismer"
	date: "$Date: 2008/05/19 13:55:36 $"
	revision: "$Revision: 1.6 $"

class
	ISQL_CMD_CONNECT

inherit
	ISQL_COMMAND

feature -- Access

	help_message : STRING is
		do
			Result := padded ("con[nect] <dsn> <user> <pwd>", Command_width)
			Result.append_string ("Connect to <dsn> datasource as <user> with password <pwd>.")
		end

	match_string : STRING is "con"

feature -- Status report

	needs_session : BOOLEAN is False

	matches (text: STRING) : BOOLEAN is
		do
			Result := matches_single_string (text, match_string)
		end

feature -- Basic operations

	execute (text : STRING; context : ISQL_CONTEXT) is
			-- connect to a datasource
		local
			worder : KL_WORD_INPUT_STREAM
			source, user, password : STRING
			session : ECLI_SESSION
			driver_strategy : ECLI_DRIVER_LOGIN
			simple_login : ECLI_SIMPLE_LOGIN
			info : ECLI_DBMS_INFORMATION
			stmt : ECLI_STATEMENT
			i64 : ECLI_INTEGER_64
			i32 : ECLI_INTEGER
			tc : ECLI_TYPE_CATALOG
			can_i32, can_i64 : BOOLEAN
		do
			create worder.make (text, " %T")
			user := ""
			password := ""
			--| consume command
			worder.read_word
			--| read data source name, if any
			worder.read_quoted_word
			if not worder.end_of_input then
				if worder.is_last_string_quoted then
					source := worder.last_string.substring (2,worder.last_string.count - 1)
				else
					source := clone (worder.last_string)
				end
				worder.read_word
				if not worder.end_of_input then
					user := clone (worder.last_string)
					worder.read_word
					if not worder.end_of_input then
						password := clone (worder.last_string)
					end
				end
				if context.session /= Void and then context.session.is_connected then
					context.session.disconnect
					context.session.close
				end
				if source.has_substring ("DSN=") or else source.has_substring ("DRIVER=") then
					create driver_strategy.make (source)
					create session.make_default
					session.set_login_strategy (driver_strategy)
					session.connect
				else
					create session.make_default
					create simple_login.make (source, user, password)
					session.set_login_strategy (simple_login)
					session.connect
				end
				if session.is_connected then
					context.set_session (session)
					info := session.info
					create stmt.make (session)
					create i64.make
					create i32.make
					can_i32 := session.info.can_bind (i32)
					can_i64 := session.info.can_bind (i64)
				else
					context.filter.begin_error
					context.filter.put_error (sql_error_msg (session,"NOT Connected"))
					context.filter.end_error
				end
			else
				context.filter.begin_error
				context.filter.put_error ("CONNECT : expecting a datasource name.")
				context.filter.end_error
			end
		end

end -- class ISQL_CMD_CONNECT
