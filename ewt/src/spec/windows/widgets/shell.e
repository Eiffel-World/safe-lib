indexing
	description: "Windows implementation of an ABSTRACT_SHELL"
	date: "$Date: 2003/12/30 10:59:35 $";
	revision: "$Revision: 1.5 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	SHELL

inherit
	ABSTRACT_SHELL
	
	DECORATIONS
		rename
			make as make_decorations
		redefine
			get_display
		end
		
creation
	make, make_by_style, make_by_display, make_by_display_style, make_by_parent, make_by_parent_style
	
feature {NONE} -- Initialization

	make is
			-- Initialize.
			-- Equivalent to calling make_by_display (Void)
		do
			make_by_display (Void)
		end

	make_by_style (a_style : INTEGER) is
			-- Initialize with `a_style' describing its behavior and appearance.
			-- Equivalent to calling make_by_display_style (Void, a_style).
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		do
			make_by_display_style (Void, a_style)
		end

	make_by_display (a_display : DISPLAY) is
			-- Initialize by using `a_display'.
			-- Equivalent to calling make_by_display_style (a_display, swt.Shell_trim).
			-- Note: Currently, null can be passed in for the display argument.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the display argument is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		do
			make_by_display_style (display, swt.Shell_trim)
		end

	make_by_display_style (a_display : DISPLAY; a_style : INTEGER) is
			-- Initialize with `a_display' and `a_style' describing its behavior and appearance.
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
		do
			initialize (a_display, Void, a_style, default_pointer)
		end

	make_by_parent (a_parent : SHELL) is
			-- Initialize with `a_parent'.
			-- Note: Currently, Void can be passed in for the parent.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the parent is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		do
			make_by_parent_style (a_parent, swt.Dialog_trim)
		end

	make_by_parent_style (a_parent : SHELL; a_style : INTEGER) is
			-- Initialize with `a_parent' and `a_style' describing its behavior and appearance.
			-- The style value is either one of the style constants defined in class SWT which is applicable to instances of this
			-- class, or must be built by bitwise OR'ing together two or more of those SWT style constants. 
			-- The class description lists the style constants that are applicable to the class.
			-- Style bits are also inherited from superclasses.
			-- Note: Currently, Void can be passed in for the parent.
			-- This has the effect of creating the shell on the currently active
			-- display if there is one. If there is no current display, the 
			-- shell is created on a "default" display. Passing in null as
			-- the parent is not considered to be good coding style,
			-- and may not be supported in a future release of EWT.
		do
				if a_parent /= Void then
					initialize (a_parent.get_display, a_parent, a_style, default_pointer)
				else
					initialize (Void, a_parent, a_style, default_pointer)
				end
		end

	initialize (a_display : DISPLAY; a_parent : SHELL; a_style : INTEGER; a_handle : POINTER) is
			-- Internal initialization.
		local
			l_display : DISPLAY
		do
			-- FIXME
			make_decorations
--			if a_display = Void then 
--				l_display := display.get_current
--			end
--			if l_display = Void then
--				l_display := display.get_default
--			end
--			style := checkStyle (a_style);
--			parent := a_parent;
--			display := l_display
--			handle := handle
			--	createWidget ()
		end

feature -- Access

	get_display : DISPLAY is
			-- Returns the Display that is associated with the receiver.
			--  A widget's display is either provided when it is created (for example, top level Shells) or is the
			-- same as its parent's display.
		do
			if display = Void then
				error (swt.Error_widget_disposed)
			else
				Result := display
			end
		end

feature -- Measurement

feature -- Comparison

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

	open is
			-- Moves `Current' to the top of the drawing order for the display on which it was created (so that all other
			-- shells on that display, which are not `Current' 's children will be drawn behind it), marks it visible, 
			-- and sets focus to its default button (if it has one) and asks the window manager to make the shell active.
		do
			-- FIXME
		end

	bring_to_top is
			-- 
		do
			--| FIXME
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation


feature {NONE} -- Attributes

	display : DISPLAY
			-- Display.

invariant
	invariant_clause: -- Your invariant here

end -- class SHELL

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
