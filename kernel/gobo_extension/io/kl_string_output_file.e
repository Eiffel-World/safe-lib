indexing

	description:

	    "Objects that..."

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2009/09/10 08:24:07 $";
	revision: "$Revision: 1.1 $";
	author: ""

class
	KL_STRING_OUTPUT_FILE

inherit

	KI_BINARY_OUTPUT_FILE
		rename
			make as make_file
--		redefine
--			is_closable
		end

create

	make

feature {NONE} -- Initialization

	make (a_string: STRING_8)
		do
			target_string := a_string
			create stream.make (target_string)
		ensure
			target_string_attached: target_string = a_string
		end

feature -- Access

	target_string : STRING_8

	name: STRING = "STRING"

	time_stamp: INTEGER_32 = 0

feature -- Measurement

	count : INTEGER_32
		require else
			is_open: is_open_write
		do
			Result := target_string.count
		end

feature -- Comparison

feature -- Status report

	exists: BOOLEAN
		do
			Result := True
		end

	is_closed : BOOLEAN
		do
			Result := not is_open_write
		end

	is_open_write: BOOLEAN

	is_readable : BOOLEAN
		do
			Result := False
		end

--	is_closable : BOOLEAN
--		do
--			Result := False
--		end

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

	close
		do
			is_open_write := False
		end

	flush
		do
			stream.flush
		end

	open_append
		do

		end

	open_write
		do
			is_open_write := True
		end

	put_character (c: CHARACTER_8)
		do
			stream.put_character (c)
		end

	put_string (a_string: STRING_8)
		do
			stream.put_string (a_string)
		end

feature -- Obsolete

feature -- Inapplicable

	concat (a_filename: STRING_8)
		do

		end

	copy_file (new_name : STRING_8)
		do

		end

	change_name (new_name: STRING_8)
		do

		end

	delete
		do

		end

	make_file (a_name : STRING_8)
		do

		end

	recursive_open_append
		do

		end

	recursive_open_write
		do

		end

	same_physical_file (other_name: STRING_8) : BOOLEAN
		do

		end

feature -- Constants

feature {NONE} -- Implementation

	stream : KL_STRING_OUTPUT_STREAM

invariant

	stream_attached: stream /= Void
	target_string_attached: target_string /= Void

end -- class KL_STRING_OUTPUT_FILE

--
--    copyright: "Groupe S (c)"
--    licence: "All rights reserved. Duplication and distribution prohibited."
--
--    source: "$Source: F:/CVSRoot/doc/Se2000/Projet/Standards/full.e.tpl,v ";
