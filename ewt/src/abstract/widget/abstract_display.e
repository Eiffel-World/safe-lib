indexing
	description: "[

Instances of this class are responsible for managing the
connection between SWT and the underlying operating
system. Their most important function is to implement
the SWT event loop in terms of the platform event model.
They also provide various methods for accessing information
about the operating system, and have overall control over
the operating system resources which SWT allocates.

Applications which are built with SWT will almost always</em>
require only a single display. In particular, some platforms
which SWT supports will not allow more than one active</em>
display. In other words, some platforms do not support
creating a new display if one already exists that has not been
sent the dispose() message.

In SWT, the thread which creates a Display
instance is distinguished as the user-interface thread</em>
for that display.

The user-interface thread for a particular display has the
following special attributes:


The event loop for that display must be run from the thread.


Some SWT API methods (notably, most of the public methods in
Widget and its subclasses), may only be called
from the thread. (To support multi-threaded user-interface
applications, class Display provides inter-thread
communication methods which allow threads other than the 
user-interface thread to request that it perform operations
on their behalf.)


The thread is not allowed to construct other 
Displays until that display has been disposed.
(Note that, this is in addition to the restriction mentioned
above concerning platform support for multiple displays. Thus,
the only way to have multiple simultaneously active displays,
even on platforms which support it, is to have multiple threads.)

Enforcing these attributes allows SWT to be implemented directly
on the underlying operating system's event model. This has 
numerous benefits including smaller footprint, better use of 
resources, safer memory management, clearer program logic,
better performance, and fewer overall operating system threads
required. The down side however, is that care must be taken
(only) when constructing multi-threaded applications to use the
inter-thread communication mechanisms which this class provides
when required.

All SWT API methods which may only be called from the user-interface
thread are distinguished in their documentation by indicating that
they throw the "ERROR_THREAD_INVALID_ACCESS"
SWT exception.

Styles:
(none)
Events:
Close, Dispose

	
	
	]"

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2003/12/10 22:15:04 $";
	revision: "$Revision: 1.1 $";
	author: ""

class
	ABSTRACT_DISPLAY

feature {NONE} -- Initialization

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
--    source: "$Source: /cvsroot/safe/lib/ewt/src/abstract/widget/Attic/abstract_display.e,v $";
-- $Log: abstract_display.e,v $
-- Revision 1.1  2003/12/10 22:15:04  efa
-- library setup and specifications
--
