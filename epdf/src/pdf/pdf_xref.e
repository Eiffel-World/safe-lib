indexing

	description: "PDF Cross reference section. (PDFReference 3.4.3).%N%
		% The cross-reference table contains information that permits random access to indirect %
		% objects within the file, so that the entire file need not be read to locate any particular object."
	note: "This XREF is limited to one subsection"
	author: "Paul G. Crismer"
	licence: "Release under the Eiffel Forum licence.  See file 'forum.txt'."
	
class

	PDF_XREF

inherit

	PDF_SERIALIZABLE
		redefine
			put_pdf
		end

creation

	make
	
feature -- Initialization

	make is
		local
			an_entry : PDF_XREF_ENTRY
		do
			!!xref_section.make (0, 20) -- prevent too much resizing
			!!an_entry.make_free (0, 65535)
			xref_section.force (an_entry, entry_count)
			entry_count := entry_count + 1
		end
			
feature -- Access
	
	entry_offset (entry_number : INTEGER) : INTEGER is
			-- offset of `entry_number' entry
		require
			good_entry_number: entry_number >= 0 and entry_number < count
		do
			Result := xref_section.item (entry_number).offset
		end
		
	object (entry_number : INTEGER) : PDF_OBJECT is
			-- 
		require
			good_entry_number: entry_number >= 0 and entry_number < count
		do
			Result := xref_section.item (entry_number).object
		end
		
		
feature -- Status report

	is_free_entry (entry_number : INTEGER) : BOOLEAN is
			-- is the `entry_number' entry free?
		require
			good_entry_number: entry_number >= 0 and entry_number < count
		do
			Result := xref_section.item (entry_number).is_free
		ensure
			entry_zero_always_free: (entry_number = 0) implies (Result = True)
		end

feature -- Measurement

	count : INTEGER is
			-- number of cross reference entries
		do
			Result := entry_count
		end

feature {PDF_DOCUMENT} -- Element change

	add_entry (an_object : PDF_OBJECT) is
			-- 
		require
			object_exists: an_object /= Void
			number_sequence: an_object.number = count
		local
			an_entry : PDF_XREF_ENTRY
		do
			!!an_entry.make (an_object)
			xref_section.force (an_entry, count)
			entry_count := entry_count + 1
		ensure
			count = old count + 1
		end
		
	
	
	add_free_entry is
			-- add a new object to the cross reference section
		local
			an_entry : PDF_XREF_ENTRY
			number : INTEGER
		do
			number := xref_section.upper + 1
			!!an_entry.make_free (number, 0)
			xref_section.force(an_entry, count)
			entry_count := entry_count + 1
		ensure
			count = old count + 1
		end

	set_entry_offset (entry_number, an_offset : INTEGER) is
			-- set `entry_number' entry offset to `an_offset'
		require
			good_entry_number: entry_number > 0 and entry_number < count
			not_free_entry: not is_free_entry (entry_number)
		do
			xref_section.item (entry_number).set_offset (an_offset)
		ensure
			entry_offset: entry_offset (entry_number) = an_offset
		end
	
feature -- Conversion

	to_pdf : STRING is
		local
			index : INTEGER
		do
			!!Result.make (0)
			Result.append ("xref%N")
			-- Output xref-section header
			-- first object number in cross reference section
			Result.append (xref_section.lower.out)
			Result.append (" ")
			-- count of objects
			Result.append (count.out)
			Result.append ("%N")
			-- Output each entry in xref-section
			from
				index := 0
			until
				index = count
			loop
				Result.append (xref_section.item(index).to_pdf)
				index := index + 1
			end
			--
			-- End of cross reference
			Result.append ("%N")
		end
	
	put_pdf (medium : PDF_OUTPUT_MEDIUM) is
			-- 
		local
			index : INTEGER
		do
			medium.put_string ("xref%N")
			-- Output xref-section header
			-- first object number in cross reference section
			medium.put_string (xref_section.lower.out)
			medium.put_string (" ")
			-- count of objects
			medium.put_string (count.out)
			medium.put_new_line
			-- Output each entry in xref-section
			from
				index := 0
			until
				index = count
			loop
				xref_section.item(index).put_pdf (medium)
				index := index + 1
			end
			--
			-- End of cross reference
			medium.put_new_line
		end
		
feature {NONE} -- Implementation

	xref_section : ARRAY[PDF_XREF_ENTRY]
	
	entry_count : INTEGER
	
end -- class PDF_XREF
		