indexing
	description: "[

	Objects that represent the windows which the desktop or "window manager" is managing.
	Instances that do not have a parent (that is, they are built using the constructor, which takes a Display as the argument)
	are described top level shells. 
	Instances that do have a parent are described as secondary or dialog shells.
	Instances are always displayed in one of the maximized, minimized or normal states.
	When an instance is marked as maximized, the window manager will typically resize it to fill the entire visible area of the display, 
	and the instance is usually put in a state where it can not be resized (even if it has style RESIZE) until it is no longer maximized.
	When an instance is in the normal state (neither maximized or minimized), its appearance is controlled by the style constants which were 
	specified when it was created and the restrictions of the window manager (see below).
	When an instance has been marked as minimized, its contents (client area) will usually not be visible, and depending on the window manager,
	it may be iconified (that is, replaced on the desktop by a small simplified representation of itself), relocated to a distinguished area
	of the screen, or hidden. 
	Combinations of these changes are also possible.
	
	Note: The styles supported by this class must be treated as HINTs, since the window manager for the desktop on which the instance is visible
	has ultimate control over the appearance and behavior of decorations and modality. 
	For example, some window managers only support resizable windows and will always assume the RESIZE style, even if it is not set.
	In addition, if a modality style is not supported, it is upgraded to a more restrictive modality style that is supported. For
	example, if PRIMARY_MODAL is not supported, it would be upgraded to APPLICATION_MODAL.
	
	Styles: BORDER, CLOSE, MIN, MAX, NO_TRIM, RESIZE, TITLE, APPLICATION_MODAL, MODELESS, PRIMARY_MODAL, SYSTEM_MODAL
	Events:	Activate, Close, Deactivate, Deiconify, Iconify
	
	Class EWT provides two convenience constants for the most commonly required style combinations: 
	SHELL_TRIM the result of combining the constants which are required to produce a typical application top level shell: 
	(that is, CLOSE | TITLE | MIN | MAX | RESIZE) 
	DIALOG_TRIM the result of combining the constants which are required to produce a typical application dialog shell:
	(that is, TITLE | CLOSE | BORDER)
	
	Note: Only one of the styles APPLICATION_MODAL, MODELESS, PRIMARY_MODAL and SYSTEM_MODAL may be specified.
	
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:21 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	ABSTRACT_SHELL

inherit
	ABSTRACT_DECORATIONS

feature {NONE} -- Initialization

	make_by_display (a_display : ABSTRACT_DISPLAY) is
			-- Initialize by using `a_display'.			
		require
			a_display_defined : a_display /= Void
		deferred
		ensure
			--default_style : style = SWT.SHELL_TRIM
		end

feature -- Access

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
		require
 			not_is_released : not is_released			
		deferred
		end

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_SHELL

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widgets/abstract_shell.e,v $";
-- $Log: abstract_shell.e,v $
-- Revision 1.1  2003/12/13 19:34:21  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
