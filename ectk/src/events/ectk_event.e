indexing
	description: "Elementary user action (Keyboard hit)"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:14:20 $"
	revision: "$Revision: 1.1 $"

class
	ECTK_EVENT

inherit
	HASHABLE
		undefine
			is_equal
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

	ANY
		redefine
			is_equal
		end

feature -- initialize

	set (an_id, a_value: INTEGER) is
			-- Inialize with `an_id' and `a_value'
		do
			id := an_id
			value := a_value
			is_processed := False
		ensure
			id_copied: id = an_id
			value_copied: value = a_value
			not_is_processed: not is_processed
		end

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := id
		end;

feature -- Status change

	set_processed is
			-- Set `Current as processed.
		do
			is_processed := True
		ensure
			is_processed: is_processed
		end

	reset_processed is
			-- Set `Current as not processed.
		do
			is_processed := False
		ensure
			not_is_processed: not is_processed
		end

feature -- Access
	
	id: INTEGER
			-- Event identifier.

	value: INTEGER
			-- Event value
	
feature -- Status

	is_processed: BOOLEAN
			-- Is this event completly processed? 

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do	
			Result := equal (id, other.id)
		end

end -- class ECTK_EVENT

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
