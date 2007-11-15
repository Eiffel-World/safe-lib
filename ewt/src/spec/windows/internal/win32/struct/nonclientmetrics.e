indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	NONCLIENTMETRICS

inherit
	TAG_NONCLIENTMETRICSA_STRUCT
		export
			{ANY} sizeof
		end

	WIN32_STRUCT_COMPLEMENT_FUNCTIONS
	
create
	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared
	
feature -- Access

	lfCaptionFont : LOGFONT is
		do
			create Result.make_shared (ewg_struct_nonclientmetricsa_member_get_lf_Caption_Font (item))
		end
		
	lfSmCaptionFont : LOGFONT is
		do
			create Result.make_shared (ewg_struct_nonclientmetricsa_member_get_lf_Sm_Caption_Font (item))
		end
		
	lfMenuFont : LOGFONT is
		do
			create Result.make_shared (ewg_struct_nonclientmetricsa_member_get_lf_Menu_Font (item))
		end
		
	lfStatusFont : LOGFONT is
		do
			create Result.make_shared (ewg_struct_nonclientmetricsa_member_get_lf_Status_Font (item))
		end
		
	lfMessageFont : LOGFONT is
		do
			create Result.make_shared (ewg_struct_nonclientmetricsa_member_get_lf_message_font (item))
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
