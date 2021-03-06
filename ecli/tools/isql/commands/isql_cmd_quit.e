indexing
	description: "Objects that quit CLISQL."
	author: "Paul G. Crismer"
	date: "$Date: 2009/03/05 08:43:18 $"
	revision: "$Revision: 1.1 $"

class
	ISQL_CMD_QUIT

inherit
	ISQL_COMMAND

feature -- Access

	help_message : STRING is
		do
			Result := padded ("q[uit]", command_width)
			Result.append_string ("Quit the application.") -- and closes current connection
		end

	match_string : STRING is "q"
	
feature -- Status report
	
	needs_session : BOOLEAN is False
	
	matches (text: STRING) : BOOLEAN is
		do
			Result := matches_single_string (text, match_string)
		end
		
feature -- Basic operations

	execute (text : STRING; context : ISQL_CONTEXT) is
			-- execute a commit
		do
			context.set_must_quit
		end

end -- class ISQL_CMD_QUIT
