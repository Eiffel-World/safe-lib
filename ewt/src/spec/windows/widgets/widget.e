indexing
	description: "Windows implemenation of ABSTRACT_WIDGET"
	date: "$Date: 2003/12/30 21:12:43 $";
	revision: "$Revision: 1.6 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	WIDGET

inherit
	ABSTRACT_WIDGET
	
	SHARED_SWT
		export
			{NONE} all
		end

	SHARED_OS
		export
			{NONE} all
		end

	XS_IMPORTED_UINT32_ROUTINES
		export
			{NONE} all
		end
		
feature {NONE} -- Initialization

feature -- Access

feature -- Measurement

feature -- Comparison

feature -- Status report

feature -- Status setting

feature -- Cursor movement

feature -- Element change

	add_listener (an_event_type : INTEGER; a_listener : LISTENER) is
			-- Add `a_listener' to the collection of listeners who will
			-- be notifed when an event of `an_event_type' occurs. When the
 			-- event does occur in the widget, the listener is notified by
 			-- calling it's handle_event routine.
		do
			-- FIXME
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	check_bits (a_style : INTEGER;
				int0	: INTEGER;
				int1	: INTEGER;
				int2	: INTEGER;
				int3	: INTEGER;
				int4	: INTEGER;
				int5	: INTEGER) : INTEGER is
			-- Returns a style with exactly one style bit set out of the specified set of exclusive style bits. 
			-- All other possible bits are cleared when the first matching bit is found. 
			-- Bits that are not part of the possible set are untouched.
		local
			l_mask : INTEGER
			l_style : INTEGER
		do
			l_mask := UINT32_.u_or (int0, int1)
			l_mask := UINT32_.u_or (l_mask, int2)
			l_mask := UINT32_.u_or (l_mask, int3)
			l_mask := UINT32_.u_or (l_mask, int4)
			l_mask := UINT32_.u_or (l_mask, int5)
			l_style := a_style
			if UINT32_.u_and (a_style, l_mask) = 0 then
				l_style := UINT32_.u_or (l_style, int0)
			end
			if UINT32_.u_and (a_style, int0) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int0)
			end
			if UINT32_.u_and (a_style, int1) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int1)
			end
			if UINT32_.u_and (a_style, int2) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int2)
			end
			if UINT32_.u_and (a_style, int3) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int3)
			end
			if UINT32_.u_and (a_style, int4) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int4)
			end
			if UINT32_.u_and (a_style, int5) /= 0 then
				l_style := UINT32_.u_or (UINT32_.u_and (l_style, UINT32_.u_not (l_mask)), int5)
			end
			Result := l_style
		end

	check_orientation (a_parent : WIDGET) is
		do
			style := UINT32_.u_and (style, UINT32_.u_not (swt.style_MIRRORED))
			if UINT32_.u_and (style, UINT32_.u_or (swt.Style_left_to_right, swt.Style_right_to_left)) = 0 then
				if a_parent /= Void then
					if UINT32_.u_and (a_parent.style, swt.Style_left_to_right) /= 0 then
						style := UINT32_.u_or (style, swt.Style_left_to_right)
					end
					if UINT32_.u_and (a_parent.style, swt.Style_right_to_left) /= 0 then
						style := UINT32_.u_or (style, swt.Style_right_to_left)
					end
				end
			end
			style := check_bits (style, swt.Style_left_to_right, swt.Style_right_to_left, 0, 0, 0, 0)
		end

feature {WIDGET} -- Attributes

	style : INTEGER
			-- Style.
			
feature {NONE} -- Onces

	error (a_code : INTEGER) is
			-- Does whatever widget specific cleanup is required, and then uses the code in swt.error to handle the error.
		do
			swt.error(a_code)
		end

invariant
	invariant_clause: -- Your invariant here

end -- class WIDGET

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
