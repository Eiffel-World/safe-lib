indexing
	description: "[
	
	Implementers of Listener provide a simple handleEvent() method that is used internally by SWT to dispatch events.
	 
	After creating an instance of a class that implements this interface it can be added to a widget using the 
	addListener(int eventType, Listener handler) method and removed using the 
	removeListener (int eventType, Listener handler) method. When the specified event occurs, handleEvent(...) will
	will be sent to the instance.
	
	Classes which implement this interface are described within SWT as providing the untyped listener API. Typically, widgets will
	also provide a higher-level typed listener API, that is based on the standard java.util.EventListener pattern.
	Note that, since all internal SWT event dispatching is based on untyped listeners, it is simple to build subsets of SWT 
	for use on memory constrained, small footprint devices, by removing the classes and methods which implement the typed listener API.
 
 	]"
	date: "$Date: 2003/12/13 22:30:48 $";
	revision: "$Revision: 1.2 $";
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"

class
	ABSTRACT_LISTENER

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

end -- class ABSTRACT_LISTENER

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
