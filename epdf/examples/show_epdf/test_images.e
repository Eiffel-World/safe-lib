indexing
	description: "Objects that show how to use PDF images, as supported by ePDF"
	author: "Paul G. Crismer"
	date: "$Date: 2003/08/19 15:42:45 $"
	revision: "$Revision: 1.1 $"

class
	TEST_IMAGES

inherit
	XS_IMPORTED_UINT32_ROUTINES

feature -- Basic operations

	do_test (document : PDF_DOCUMENT; images_outline : PDF_OUTLINE_ITEM) is
			-- 
		local
			page, page1, page2 : PDF_PAGE
			image, alpha, image2 : PDF_IMAGE
			i,j, c : INTEGER
			png : PDF_PNG_IMAGE
		do
			page := document.last_page
			document.create_png_image ("images\toucan.png")
			image2 := document.last_image
			document.create_image (80, 80,3,8)
			image := document.last_image
			document.create_image (80,80,1,8)
			alpha := document.last_image
			-- create red image with alpha
			from
				i := 1
				c := UINT32_.left_shift (255, 16)
				j := 1
			until
				i > image.height
			loop
				if i /= 25 then
					from
						j := 1
					until
						j > image.width
					loop
						image.put_sample (c, i, j)
						alpha.put_sample (155, i, j)
						j := j + 1
					end
				end
				i := i + 1
			end
			image.set_alpha (alpha)
			--
			-- compose page
			-- begin text mode
			page.begin_text	
			-- set font + size
			page.set_font (document.last_font, 36)		
			-- move text origin to (left edge + 1 inch, upper edge - 1 inch - fontsize)
			page.move_text_origin ((page.mediabox.width - image.width) //2 , page.mediabox.height // 2)			
			-- show text
			page.put_string ("Hello World !")		
			-- end text mode
			page.end_text
			page.gsave
			page.translate ((page.mediabox.width - image.width)  //2 , page.mediabox.height // 2 )
			page.scale (80,80)
			page.put_image (image)
			page.grestore
			page.gsave
			page.translate ((page.mediabox.width - image2.width)  //2 - 20, (page.mediabox.height - image.height) // 2 + (image2.height // 4))
			page.scale (image2.width,image2.height)
			page.put_image (image2)
			page.grestore
			
			document.add_page
			page := document.last_page
			document.create_outline_item ("Test PNG", page, page.mediabox.llx, page.mediabox.ury)
			images_outline.put_last (document.last_outline_item)
			document.find_font ("Helvetica", document.Encoding_winansi)
			page.set_font (document.last_font, 12)
			from
				i := 1
				j := document.default_mediabox.ury - 100
			until
				i > images.upper
			loop
				--create png.make (images.item (i))
				document.create_png_image (images.item (i))
				image := document.last_image
				page.gsave
				page.translate (100, j)
				page.scale (image.width, image.height)
				page.put_image (image)
				page.grestore
				page.gsave
				page.begin_text
				page.set_text_origin (100 + 2 * image.width, j)
				page.put_string (images.item (i+1))
				page.end_text
				page.grestore				
				j := j - image.height - 5
				i := i + 2
			end
		end
		
	images : ARRAY [STRING] is
			-- 
		once 
			Result := <<
			    "images\basn0g01.png", "1-bit grayscale",
			    "images\basn0g02.png", "2-bit grayscale",
			    "images\basn0g04.png", "4-bit grayscale",
			    "images\basn0g08.png", "8-bit grayscale",
			    "images\basn0g16.png", "16-bit grayscale",
			    "images\basn2c08.png", "8-bit truecolor",
			    "images\basn2c16.png", "16-bit truecolor",
			    "images\basn3p01.png", "1-bit paletted",
			    "images\basn3p02.png", "2-bit paletted",
			    "images\basn3p04.png", "4-bit paletted",
			    "images\basn3p08.png", "8-bit paletted",
			    "images\basn4a08.png", "8-bit gray with alpha",
			    "images\basn4a16.png", "16-bit gray with alpha",
			    "images\basn6a08.png", "8-bit RGBA",
			    "images\basn6a16.png", "16-bit RGBA"
			>>
		end

end -- class TEST_IMAGES
