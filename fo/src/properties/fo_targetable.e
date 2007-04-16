indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/04/16 12:24:43 $"
	revision: "$Revision: 1.1 $"

deferred class
	FO_TARGETABLE

inherit
	FO_RENDERABLE
		undefine
			render_forth, pre_render, is_renderable
		redefine
			post_render
		end

feature -- Access

	target : FO_TARGET
		-- As link destination: characteristics.

	set_target (a_target : like target) is
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

feature -- Basic operations

	post_render (document : FO_DOCUMENT; region : FO_RECTANGLE) is
		local
			pdf_destination : PDF_DESTINATION_XY_ZOOM
			fix : DOUBLE
		do
			fix := 1.5
			if target /= Void then
				if not document.has_target (target) then
					document.add_target (target)
					create pdf_destination.make (document.current_page, region.left.as_points - fix, region.top.as_points + fix, 0)
					document.pdf_document.add_named_destination (target.name, pdf_destination)
				end
			end
		end

end
