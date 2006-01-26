indexing
	description: "Fonts"
	author: "Paul G. Crismer"
	date: "$Date: 2006/01/26 18:27:04 $"
	revision: "$Revision: 1.1 $"

class
	FO_FONT

inherit
	FO_SHARED_FONT_FACTORY
	
creation
	{FO_FONT_FACTORY} make
	
feature {NONE} -- Initialization

	make (new_family, new_weight, new_style : STRING; corresponding_internal_font : PDF_FONT) is
			-- Make with `new_family', `new_weight', `new_style', and `corresponding_internal_font'.
		require
			valid_family: font_factory.valid_family (new_family)
			valid_weight: font_factory.valid_weight (new_weight)
			valid_style: font_factory.valid_style (new_style)
			corresponding_internal_font_exists: corresponding_internal_font /= Void
		do
			family := new_family
			weight := new_weight
			style := new_style
			create size.points (0)
			internal_font := corresponding_internal_font
			stretch := 100.0
			encoding := corresponding_internal_font.encoding.name.value
		ensure
			no_stretch: stretch = 100
			family_set: family = new_family
			weight_set: weight = new_weight
			style_set: style = new_style
			size_zero: size.as_points = 0
			internal_font_set: internal_font = corresponding_internal_font
		end
		
feature -- Access

	name : STRING is
			-- Name.
		do
			Result := internal_font.basefont.value
		end
	
	encoding : STRING
			-- Encoding.
		
	stretch: DOUBLE
			-- Streching factor. 100 = no stretch.

	style: STRING
			-- Style name.

	size: FO_MEASUREMENT
			-- Size.

	family : STRING
			-- Family name.
			
	weight : STRING
			-- Weight name.

	pdf_encoding : PDF_CHARACTER_ENCODING is			
		do
			Result := internal_font.encoding
		end

	italic_angle : INTEGER is
		do
			Result := internal_font.italic_angle
		end
		
	is_fixed_pitch : BOOLEAN is
		do
			Result := internal_font.is_fixed_pitch
		end
		
	character_set : STRING  is
		do
			Result := internal_font.character_set
		end
		
	bounding_box : FO_RECTANGLE is
		local
			r : PDF_RECTANGLE
			ratio : FO_MEASUREMENT
		do		
			r := internal_font.font_b_box
			ratio := create {FO_MEASUREMENT}.points (em_size) / size
			create Result.set (
				create {FO_MEASUREMENT}.points (r.llx.truncated_to_integer) / ratio,
				create {FO_MEASUREMENT}.points (r.lly.truncated_to_integer) / ratio,
				create {FO_MEASUREMENT}.points (r.urx.truncated_to_integer) / ratio,
				create {FO_MEASUREMENT}.points (r.ury.truncated_to_integer) / ratio)
			end
		
	underline_position : INTEGER is
		do
			Result := internal_font.underline_position
		end
		
	underline_thickness : INTEGER is
		do
			Result := internal_font.underline_thickness
		end
		
	encoding_scheme : STRING is
		do		
			Result := internal_font.encoding_scheme
		end
		
	cap_height : INTEGER is
		do
			Result := internal_font.cap_height
		end
		
	x_height : INTEGER is
		do
			Result := internal_font.x_height
		end
		
	ascender : INTEGER is
		do
			Result := internal_font.ascender
		end
		
	descender : INTEGER is
		do
			Result := internal_font.descender
		end
		
	std_hw : INTEGER is
		do
			Result := internal_font.std_hw
		end
		
	std_vw : INTEGER is
		do
			Result := internal_font.std_vw
		end
	
	em_size : INTEGER is	
		do
			Result := internal_font.em_size
		end
		
feature -- Measurement

	string_width (string : STRING) : FO_MEASUREMENT is
			-- Width of `string' rendered using Current.
		require
			string_exists: string /= Void
		do
			create Result.points (internal_font.string_width (string, size.as_points, 0, 0, stretch))
		ensure
			result_exists: Result /= Void
		end
	
	character_width (c : CHARACTER) : FO_MEASUREMENT is
			-- Width of `c' rendered using Current.
		do
			create Result.points (internal_font.character_width (c,size.as_points, 0, 0, stretch))
		end
		
feature -- Status report
		
feature -- Status setting

feature -- Cursor movement

feature -- Element change

	set_stretch (a_stretch: DOUBLE) is
			-- Set `stretch' to `a_stretch'.
		require
			stretch_is_a_percentage: a_stretch > 0
		do
			stretch := a_stretch
		ensure
			stretch_assigned: stretch = a_stretch
		end

	set_size (a_size: FO_MEASUREMENT) is
			-- Set `size' to `a_size'.
		require
			a_size_not_void: a_size /= Void
		do
			size := a_size
		ensure
			size_assigned: size = a_size
		end
		
feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Constants
	
feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	internal_font : PDF_FONT
	
invariant
	family_not_void: family /= Void and then font_factory.valid_family (family)
	weight_not_void: size /= Void and then Font_factory.valid_weight (weight)
	style_not_void: style /= Void and then Font_factory.valid_style (style)
	size_not_void: size /= Void
	internal_font_not_void: internal_font /= Void
	
end -- class FO_FONT_ABLE
