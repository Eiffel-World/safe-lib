indexing
	description: "Objects that can output characters on a text file"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:47:56 $"
	revision: "$Revision: 1.1 $"

class
	EREP_TEXT_FILE_MEDIUM

inherit
	EREP_OUTPUT_MEDIUM

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
			export
				{NONE} all
			end

	MEMORY
		export 
			{NONE} all
		redefine 
			dispose
		end

creation	
	make

feature {NONE} -- Initialization

	make (a_file_name: STRING) is
			-- Initialize with `a_file_name'.
		require
			name_defined: a_file_name /= Void
		do
			name_i := a_file_name
		ensure
			name_shared: name = a_file_name
		end

feature -- Access
	
	name: STRING is
			-- Medium name
		do
			Result := name_i
		end

feature -- Element change

	put_new_line is
			-- Write a new line character to medium
		do
			file.put_new_line
		end;

	put_string (a_string: STRING) is
			-- Write `a_string' to medium.
		do
			file.put_string (a_string)
		end;

	put_character (a_character: CHARACTER) is
			-- Write `a_character' to medium.
		do
			file.put_character (a_character)
		end;

feature -- Status report

	is_open_write: BOOLEAN is
			-- Is this medium opened for output
		do
			Result := file /= Void and then OUTPUT_STREAM_.is_open_write (file)
		end

	is_closed: BOOLEAN is
			-- Is the I/O medium open
		do
			result := not is_open_write
		end;

feature -- Status setting

	open_write is
			-- Open medium for write.
		require
			not_is_open_write: not is_open_write
		do
			file := OUTPUT_STREAM_.make_file_open_write (name_i)
		end			

	close is
			-- Close medium.
		do
			OUTPUT_STREAM_.close (file)
		end;

feature {NONE} -- Implementation

	file: like OUTPUT_STREAM_TYPE
			-- File to write	

	dispose is
			-- Action to be executed just before garbage collection
			-- reclaims an object.
		do
			if is_open_write then
				close
			end
		end

	name_i: STRING
			-- Implementation of file name	
	
end -- class EREP_TEXT_FILE_MEDIUM


--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
