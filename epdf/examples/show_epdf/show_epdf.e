indexing
	description: 	"System's root class"
	author: 	"Paul G. Crismer"
	licence: 	"Released under the Eiffel Forum licence.  See file 'forum.txt'."
	date: 		"$Date: 2003/08/19 15:42:45 $"
	revision: 	"$Revision: 1.3 $"

class
	SHOW_EPDF
	
inherit 
	KL_SHARED_FILE_SYSTEM

creation
	make

feature -- Initialization

	make is
			-- Creation procedure.
		local
			medium : PDF_OUTPUT_MEDIUM
			file : KI_TEXT_OUTPUT_FILE
			page : PDF_PAGE
		do
			print ("show_epdf application%N")
			create document.make
			top := document.default_mediabox.ury
			setup_document
			create_outline_root
			draw_title_page
			-- 
			test_fonts
			test_text_operations
			test_graphics
			test_images
			test_coordinate_system
			test_text_bonuses
			--
			file := file_system.new_output_file ("pdf_show.pdf")
			file.open_write
			create  medium.make (file)
			document.put_pdf (medium)
			file.close
			print ("file '")
			print (file.name)
			print ("' has been generated%N")
		end
		
feature -- Basic operations

	test_graphics is
			-- 
		local
			lines : TEST_LINES
			line_attributes : TEST_LINE_ATTRIBUTES
			paint : TEST_PAINT			
		do
			document.add_page
			document.create_outline_item ("Graphics", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			current_section := document.last_outline_item
			document.create_outline_item ("Line drawing", document.last_page, 0, top)
			current_section.put_last (document.last_outline_item)
			create lines
			lines.do_test (document)
			document.add_page
			document.create_outline_item ("Line attributes", document.last_page, 0, top)
			current_section.put_last (document.last_outline_item)
			create line_attributes
			line_attributes.do_test (document)
			document.add_page
			document.create_outline_item ("Path painting", document.last_page, 0, top)
			current_section.put_last (document.last_outline_item)
			create paint
			paint.do_test (document)			
		end
		
	test_text_bonuses is
		local
			text : TEST_TEXT
		do
			document.add_page
			document.create_outline_item ("Text bonuses", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			create text
			text.do_test (document)			
		end
		
	setup_document is
		local
			layout : PDF_LAYOUT_CONSTANTS
			mode : PDF_PAGE_MODE_CONSTANTS
		do
			create layout
			create mode
			document.set_page_layout (layout.Layout_single_page)
			document.set_page_mode (mode.Mode_use_outlines)
			document.find_font ("Helvetica", document.Encoding_winansi)
			document.create_information
			document.information.set_author ("Paul G. Crismer")
			document.information.set_title ("PDF Show")
			document.information.set_creator ("Eiffel PDF library")
			document.information.set_creation_date (create {DT_DATE_TIME}.make (2003, 8, 14, 18, 52, 20))
			document.create_viewer_preferences
			document.viewer_preferences.fit_window
			document.viewer_preferences.display_document_title
		end
	
	create_outline_root is
		do
			document.create_outlines
			document.create_outline_item ("SHOW ePDF", document.last_page, 0, top)
			document.outlines.set_open
			document.outlines.put_last (document.last_outline_item)
			root_outline := document.last_outline_item
			root_outline.set_open
			document.create_outline_item ("Front page", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			document.last_outline_item.set_open			
		end
		
	draw_title_page is
		local
			title : TEST_TITLE			
		do
			create title
			title.do_test (document)			
		end

	test_fonts is
		local
			fonts : TEST_FONTS
		do
			document.add_page
			document.create_outline_item ("Fonts", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			create fonts
			fonts.do_test (document)			
		end
	
	test_text_operations is
		local
			text_attributes : TEST_TEXT_ATTRIBUTES
			text_clip : TEST_TEXT_CLIP
		do
			document.add_page
			document.create_outline_item ("Text", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			current_section := document.last_outline_item
			--
			document.create_outline_item ("Text attributes", document.last_page, 0, top)
			current_section.put_last (document.last_outline_item)
			create text_attributes
			text_attributes.do_test (document)			
			document.add_page
			document.create_outline_item ("Text clipping", document.last_page, 0, top)
			current_section.put_last (document.last_outline_item)
			create text_clip
			text_clip.do_test (document)		
		end
		
	test_coordinate_system is
			-- 
		local
			matrix : TEST_MATRIX
		do
			document.add_page
			document.create_outline_item ("Coordinate system", document.last_page, 0, top)
			root_outline.put_last (document.last_outline_item)
			create matrix
			matrix.do_test (document)			
		end

	test_images is
			-- 
		local
			images_outline : PDF_OUTLINE_ITEM
			test : TEST_IMAGES
			page : PDF_PAGE
		do			
			document.add_page
			page := document.last_page
			document.find_font ("Helvetica", document.Encoding_winansi)
			document.create_outline_item ("Images", page, page.mediabox.llx, page.mediabox.ury)
			root_outline.put_last (document.last_outline_item)
			images_outline := document.last_outline_item
			document.create_outline_item ("Nice Image", page, page.mediabox.llx, page.mediabox.ury // 2)
			images_outline.put_last (document.last_outline_item)
			document.last_outline_item.set_open
			--
			create test
			test.do_test (document, images_outline)
		end		
		
feature -- Access

	document : PDF_DOCUMENT
			
	root_outline : PDF_OUTLINE_ITEM
	
	current_section : PDF_OUTLINE_ITEM

	top : DOUBLE
	
end -- class SHOW_EPDF
--
-- Copyright: 2001, 2003 Paul G. Crismer, <pgcrism@users.sf.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
