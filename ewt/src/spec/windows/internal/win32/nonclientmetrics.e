indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2003/12/29 21:26:54 $"
	revision: "$Revision: 1.2 $"

class
	NONCLIENTMETRICS

inherit
	TAG_NONCLIENTMETRICSA_STRUCT
		rename
			get_cbsize as cbSize,
			get_iborderwidth as iBorderWidth,
			get_icaptionheight as iCaptionHeight,
			get_icaptionwidth as iCaptionWidth,
			get_imenuheight as iMenuHeight,
			get_imenuwidth as iMenuWidth,
			get_iscrollheight as iScrollHeight,
			get_iscrollwidth as iScrollWidth,
			get_ismcaptionheight as iSmCaptionHeight,
			get_ismcaptionwidth as iSmCaptionWidth
		export
			{ANY} sizeof
		end
		
	TAG_NONCLIENTMETRICSA_STRUCT_EXTERNAL2
	
creation
	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared
	
feature -- Access

	lfCaptionFont : LOGFONT is
		do
			create Result.make_shared (get_lfCaptionFont_external (item))
		end
		
	lfSmCaptionFont : LOGFONT is
		do
			create Result.make_shared (get_lfSmCaptionFont_external (item))
		end
		
	lfMenuFont : LOGFONT is
		do
			create Result.make_shared (get_lfMenuFont_external (item))
		end
		
	lfStatusFont : LOGFONT is
		do
			create Result.make_shared (get_lfStatusFont_external (item))
		end
		
	lfMessageFont : LOGFONT is
		do
			create Result.make_shared (get_lfmessagefont_external (item))
		end

feature -- Measurement

feature -- Status report

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

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

invariant
	invariant_clause: True -- Your invariant here

end -- class NONCLIENTMETRICS
