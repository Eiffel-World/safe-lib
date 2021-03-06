indexing
	description: "[

	Instances of this class provide the appearance and behavior of Shells, but are not top level shells or dialogs. 
	Class Shell shares a significant amount of code with this class, and is a subclass.
	Instances are always displayed in one of the maximized,  minimized or normal states:
	
	When an instance is marked as maximized, the  window manager will typically resize it to fill the entire visible area of the display,
	and the instance is usually put in a state where it can not be resized  (even if it has style RESIZE) until it is no longer maximized.
	 
	When an instance is in the normal state (neither maximized or minimized), its appearance is controlled by the style constants which were
	specified when it was created  and the restrictions of the window manager (see below).
	 
	When an instance has been marked as minimized, its contents (client area) will usually not be visible, and depending on the window manager,
	it may be "iconified" (that is, replaced on the desktop by a small simplified representation of itself), relocated to a distinguished 
	area of the screen, or hidden.
	Combinations of these changes are also possible.
	
	Note: The styles supported by this class must be treated as HINTs, since the window manager for the desktop on which the instance
	is visible has ultimate control over the appearance and behavior of decorations.
	For example, some window managers only support resizable windows and will always assume the RESIZE style, even if it is not set.
	 
	Styles:BORDER, CLOSE, MIN, MAX, NO_TRIM, RESIZE, TITLE, ON_TOP, TOOL
	
	Events:(none)
	 
	Class EWT provides two convenience constants for the most commonly required style combinations: 
	SHELL_TRIM the result of combining the constants which are required to produce a typical application top level shell: (that is, CLOSE | TITLE | MIN | MAX | RESIZE)
	
	DIALOG_TRIM the result of combining the constants which are required to produce a typical application dialog shell: (that is, TITLE | CLOSE | BORDER)

	]"
	date: "$Date: 2004/07/06 20:15:17 $";
	revision: "$Revision: 1.3 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

deferred class
	ABSTRACT_DECORATIONS

inherit
	ABSTRACT_CANVAS

feature {NONE} -- Initialization

feature -- Access

feature {ABSTRACT_WIDGET} -- Access

	image : ABSTRACT_IMAGE is
		deferred
		end
		
	menu_bar : ABSTRACT_MENU is
		deferred
		end

	menus : ARRAY[ABSTRACT_MENU] is
		deferred
		end

	saved_focus : ABSTRACT_CONTROL is
		deferred
		end

	default_button : ABSTRACT_BUTTON is
		deferred
		end

	save_default : ABSTRACT_BUTTON is
		deferred
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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_DECORATIONS

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
