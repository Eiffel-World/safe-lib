indexing
	description: "Commands that begin a transaction."
	author: "Paul G. Crismer"
	date: "$Date: 2003/02/25 09:23:04 $"
	revision: "$Revision: 1.1 $"

class
	ISQL_CMD_BEGIN

inherit
	ISQL_COMMAND

feature -- Access

	help_message : STRING is
		do
			Result := padded ("be[gin transaction]", command_width)
			Result.append ("Begin a new transaction.") -- No effect if a transaction is already active.")
		end

	match_string : STRING is "be"
	
feature -- Status report
	
	needs_session : BOOLEAN is True
	
	matches (text: STRING) : BOOLEAN is
		do
			Result := matches_single_string (text, match_string)
		end
		
feature -- Basic operations

	execute (text : STRING; context : ISQL_CONTEXT) is
			-- execute a begin transaction
		do
			if not context.session.has_pending_transaction  then
				context.session.begin_transaction			
			end
		end

end -- class ISQL_CMD_BEGIN