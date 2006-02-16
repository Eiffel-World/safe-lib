indexing

	description: 

		"Factories of fonts"

	library: "FO - Formatting Objects in Eiffel. Project SAFE."
	copyright: "Copyright (c) 2006 - , Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2006/02/16 17:29:22 $"

class
	FO_FONT_FACTORY

inherit
	PDF_ENCODING_CONSTANTS
		export
			{ANY} Encoding_mac, Encoding_pdf, Encoding_standard, Encoding_winansi
		end

	FO_SHARED_DEFAULTS
			
creation
	make

feature {NONE} -- Initialization

	make is
		local
			key : STRING
			equality_tester : KL_EQUALITY_TESTER[STRING]
		do
			create font_table.make (10)
			create families.make (10)
			create equality_tester
			families.set_equality_tester (equality_tester)
			create dummy_document.make
			
			key := font_key ("Helvetica", "", "")
			add_font ("Helvetica", "Helvetica", "","")
			add_font ("Helvetica-Bold", "Helvetica", "bold", "")
			add_font ("Helvetica-Oblique", "Helvetica", "", "italic")
			add_font ("Helvetica-BoldOblique", "Helvetica", "bold", "italic")

			add_font ("Times-Roman", "Times", "","")			
			add_font ("Times-Bold", "Times", "bold", "")
			add_font ("Times-Italic", "Times", "", "italic")
			add_font ("Times-BoldItalic", "Helvetica", "bold", "italic")

			add_font ("Courier", "Courier", "","")			
			add_font ("Courier-Bold", "Courier", "bold", "")
			add_font ("Courier-Oblique", "Courier", "", "italic")
			add_font ("Courier-BoldOblique", "Courier", "bold", "italic")
		end
		
feature -- Access

	last_font : FO_FONT

	default_font : FO_FONT is
		do
			if default_font_impl = Void then
				find_font (shared_defaults.font_family, "", "", shared_defaults.font_size)
				default_font_impl := last_font
			end
			Result := default_font_impl
		end
		
			
feature -- Measurement

feature -- Status report

	is_default (a_font : FO_FONT) : BOOLEAN is
			-- Is `a_font' same as `default_font'?
		require
			a_font_not_void: a_font /= Void
		do
			Result := default_font.is_equal (a_font)
		end
		
	valid_family (family : STRING) : BOOLEAN is
			-- is `family' a valid font family ?
		do
			if family /= Void then
				Result := families.has (family)
			end
		ensure
			definition: Result implies family /= Void
		end
		
	valid_weight (weight : STRING) : BOOLEAN is
			-- is `weight' a valid font weight ?
		do
			if weight /= Void then
				Result := weight.is_equal (Weigth_normal)
				Result := Result or else weight.is_equal (Weigth_bold)
			end
		ensure
			definition: Result implies weight /= Void
		end
		
	valid_style (style : STRING) : BOOLEAN is
			-- is `style' a valid font style ?
		do
			if style /= Void then
				Result := style.is_equal (Style_normal)
				Result := Result or else style.is_equal (Style_italic)
			end
		ensure
			definition: Result implies style /= Void
		end
		
	
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_default_font (new_font: FO_FONT) is
			-- Set `default_font' to `new_font'.
		require
			new_font_not_void: new_font /= Void
		do
			default_font_impl := new_font
		ensure
			default_font_set: default_font = new_font
		end

	find_font (name, weight, style : STRING; size : FO_MEASUREMENT) is
		do
			find_font_weight_style_encoding (name, weight, style, shared_defaults.font_encoding, size)
		end
		
	find_font_weight_style_encoding (name, weight, style, encoding : STRING; size : FO_MEASUREMENT) is
			-- Find font with `name', `weight', `style', `encoding'
		do
			font_table.search (font_key (name, weight, style))
			if font_table.found then
				if supported_encodings.has (encoding) then
					dummy_document.find_font (font_table.found_item, encoding)
					if dummy_document.last_font /= Void then
						create last_font.make (name, weight, style, dummy_document.last_font, size)
					end
				end
			end
			if last_font = Void then
				if default_font /= Void then
					find_font_weight_style_encoding (default_font.family,
						default_font.weight,
						default_font.style,
						default_font.encoding,
						default_font.size)
				else
					find_font_weight_style_encoding (shared_defaults.font_family, "","", shared_defaults.font_encoding, shared_defaults.font_size)
				end
			end
		ensure
			found_name: last_font /= Void implies last_font.family.is_equal (name)
			found_weight: last_font /= Void implies last_font.weight.is_equal (weight)
			found_style: last_font /= Void implies last_font.style.is_equal (style)
			found_encoding: last_font /= Void implies last_font.encoding.is_equal (encoding)
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Constants

	weigth_normal, style_normal : STRING is once Result := "" end
	weigth_bold : STRING is once Result := "bold" end
	style_italic : STRING is once Result := "italic" end

	supported_encodings : DS_LINKED_LIST[STRING] is
		once
			create Result.make
			Result.set_equality_tester (create {KL_EQUALITY_TESTER[STRING]})
			Result.put_last (dummy_document.encoding_mac)
			Result.put_last (dummy_document.encoding_pdf)
			Result.put_last (dummy_document.encoding_standard)
			Result.put_last (dummy_document.encoding_winansi)
		end
		
feature -- Inapplicable

feature {NONE} -- Implementation

	add_font (actual_name, family_name, weight, style : STRING) is
		require
			actual_name_exists: actual_name /= Void
			family_name_exists: family_name /= Void
			weight_exists: weight /= Void
			style_exists: style /= Void
		do
			font_table.force (actual_name, font_key (family_name, weight, style))	
			families.force (family_name) 
		end
		
	font_table : DS_HASH_TABLE [STRING, STRING]

	font_key (name, weight, style : STRING) : STRING is
		do
			create Result.make (name.count + weight.count + style.count + 2)
			Result.append_string (name)
			Result.append_character ('-')
			Result.append_string (weight)
			Result.append_character ('-')
			Result.append_string (style)
		end
	
	families : DS_HASH_SET [STRING]

	dummy_document : PDF_DOCUMENT

	default_font_impl : FO_FONT
	
end
