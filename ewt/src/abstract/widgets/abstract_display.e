indexing
	description: "[

	Instances of this class are responsible for managing the connection between EWT and the underlying operating
	system. Their most important function is to implement the EWT event loop in terms of the platform event model.
	They also provide various methods for accessing information about the operating system, and have overall control over
	the operating system resources which EWT allocates.

	Applications which are built with EWT will almost always require only a single display. In particular, some platforms
	which EWT supports will not allow more than one active display. In other words, some platforms do not support
	creating a new display if one already exists that has not been released.

	A process is not allowed to construct other Displays until that display has been disposed.
	Enforcing this allows EWT to be implemented directly on the underlying operating system's event model. This has 
	numerous benefits including smaller footprint, better use of resources, safer memory management, clearer program logic,
	better performance.

	Styles:
		(none)
	Events:
		Close, Dispose	
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/13 19:34:21 $";
	revision: "$Revision: 1.1 $";
	author: ""

deferred class
	ABSTRACT_DISPLAY

feature {NONE} -- Initialization

	make is
			-- Initialize.
		deferred
		ensure
			-- The resulting display is marked as the current display. 
			-- If this is the first display which has been constructed since the application started, it is also
 			-- marked as the default display.
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

feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

invariant
	invariant_clause: -- Your invariant here

end -- class ABSTRACT_DISPLAY

--
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widgets/abstract_display.e,v $";
-- $Log: abstract_display.e,v $
-- Revision 1.1  2003/12/13 19:34:21  efa
-- spécification and creation of  directories
--
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
